#!/usr/bin/env bash
# nvim-restore.sh — полное развёртывание Neovim из Git
set -euo pipefail

# --- Настройки ---
CONFIG_REPO="https://github.com/da0ab/nvim.dotfile"
CONFIG_DIR="$HOME/.config/nvim"
NVIM_VERSION="${NVIM_VERSION:-stable}"   # stable | nightly
INSTALL_DIR="${INSTALL_DIR:-/opt/nvim}"
# --------------------------------------

echo "=== 1. Системные зависимости ==="
sudo apt update
sudo apt install -y \
    ninja-build gettext cmake unzip curl build-essential git \
    fzf ripgrep fd-find nnn xclip

echo "=== 2. Фикс fd (Debian/Ubuntu: fdfind → fd) ==="
mkdir -p "$HOME/.local/bin"
if command -v fdfind &>/dev/null && ! command -v fd &>/dev/null; then
    ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
    echo "✓ Симлинк: fdfind → ~/.local/bin/fd"
fi

echo "=== 3. Neovim ($NVIM_VERSION) ==="
ARCH="$(uname -m)"
case "$ARCH" in
    x86_64)         NVIM_ARCH="x86_64" ;;
    aarch64|arm64)  NVIM_ARCH="arm64" ;;
    *) echo "✗ Неизвестная архитектура: $ARCH" >&2; exit 1 ;;
esac

if [ "$NVIM_VERSION" = "nightly" ]; then
    NVIM_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-${NVIM_ARCH}.tar.gz"
else
    NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${NVIM_ARCH}.tar.gz"
fi

echo "→ $NVIM_URL"
sudo rm -rf "$INSTALL_DIR"
sudo mkdir -p "$INSTALL_DIR"
curl -fsSL "$NVIM_URL" | sudo tar -xz -C "$INSTALL_DIR" --strip-components=1

# Симлинк в PATH
if [ -w /usr/local/bin ]; then
    ln -sf "$INSTALL_DIR/bin/nvim" /usr/local/bin/nvim
else
    sudo ln -sf "$INSTALL_DIR/bin/nvim" /usr/local/bin/nvim
fi

# Проверка, что nvim запускается
if ! nvim --version &>/dev/null; then
    echo "✗ nvim не запускается после установки" >&2
    exit 1
fi
echo "✓ $(nvim --version | head -1)"

echo "=== 4. Конфиг из Git ==="
if [ -d "$CONFIG_DIR/.git" ]; then
    echo "→ Обновление существующего репозитория..."
    git -C "$CONFIG_DIR" fetch --depth 1 origin
    git -C "$CONFIG_DIR" reset --hard origin/HEAD
else
    if [ -d "$CONFIG_DIR" ]; then
        mv "$CONFIG_DIR" "$CONFIG_DIR.bak.$(date +%s)"
        echo "  (старый конфиг сохранён как .bak)"
    fi
    git clone --depth 1 "$CONFIG_REPO" "$CONFIG_DIR"
fi

echo "=== 5. lazy.nvim + плагины ==="
if [ -f "$CONFIG_DIR/lazy-lock.json" ]; then
    echo "→ Lazy restore (точные версии из lock-файла)"
    nvim --headless "+Lazy! restore" +qa 2>&1 | tail -20 || true
else
    echo "→ Lazy sync (lock-файл не найден)"
    nvim --headless "+Lazy! sync" +qa 2>&1 | tail -20 || true
fi

echo "=== 6. stylua ==="
if command -v cargo &>/dev/null; then
    cargo install stylua
    # PATH для cargo
    if ! echo "$PATH" | grep -q "$HOME/.cargo/bin"; then
        echo "⚠ Добавьте в ~/.bashrc (или ~/.zshrc):"
        echo '  export PATH="$HOME/.cargo/bin:$PATH"'
    fi
else
    echo "⚠ cargo не найден — установите Rust: https://rustup.rs"
fi

echo
echo "=== Итоговая проверка ==="
for cmd in nvim fzf rg fd fdfind nnn xclip stylua; do
    if command -v "$cmd" &>/dev/null; then
        printf "  ✅ %-10s %s\n" "$cmd" "$(command -v "$cmd")"
    else
        printf "  ❌ %-10s не найден\n" "$cmd"
    fi
done

echo
echo "✅ Готово. Запустите: nvim"
