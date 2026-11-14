# nvim.dotfile
my nvim

```
       /██ /████████ /██      
      | ██|_____ ██ | ██      
  /███████     /██/ | ███████ 
 /██__  ██    /██/  | ██__  ██
| ██  | ██   /██/   | ██  \\ ██
| ██  | ██  /██/    | ██  | ██
|  ███████ /████████| ███████/
 \\_______/|________/|_______/

```



    <Space>s  — сохранить
    <Space>sv — вертикальный сплит
    <Space>sh — горизонтальный сплит
    <Space>st — терминал в сплите
    <Space>n  — nnn   
    <Space>j  — PageDown
    <Space>k  — PageUp
    <Space>2  — выделить строку без пробелов
    <Space>3  — выделить внутри тега
    <Space>4  — выделить тег полностью
    <Space>5  — удалить пустые строки
    <Space>6  — схлопнуть пустые строки
    <C-a>     — выделить всё
    <C-d>     — дублировать строку/выделение
    <S-h>/<S-l> — вкладки
    <C-h/j/k/l> — сплиты
    <F1>      — сохранить (из любого режима)




```
chmod +x nvim-restore.sh
./nvim-restore.sh

```

```
git clone https://github.com/neovim/neovim.git
cd neovim
make -j$(nproc) CMAKE_BUILD_TYPE=Release
sudo make install
```

```
sudo apt update 
&& sudo apt install 
ninja-build gettext cmake unzip curl build-essential git fzf ripgrep fd-find nnn xclip

cargo install stylua
```
