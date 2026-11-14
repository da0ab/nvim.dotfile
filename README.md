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


##HTML 


── VISUAL (обернуть выделение) ──────────────────

bb    — <strong>
bbb   — <b>
ii    — <em>
iii   — <i>
pp    — <p>
ddd   — <div>

s1    — <h1>
s2    — <h2>
s3    — <h3>
s4    — <h4>
s5    — <h5>
s6    — <h6>
s2t   — <h2 class="title">

sd    — <div class="">
se    — <section>
sec   — <section class="main">
sp    — <span>
spc   — <span class="">
su    — <ul>
sl    — <li>

si    — <img src="images/...">
sil   — <img class="iPop-img">
siv   — <img class="iPop-video">

sa    — <a href=""> (курсор в href)
saa   — <a href="URL">URL</a>
sat   — <a target="_blank" rel="nofollow">
saat  — <a href="https://..." target="_blank">
s@    — mailto:
st    — tel:

ss    — <!-- -->
sc    — /* */
sx    — /* ---- ---- */

sq    — «»
det   — <details><summary>Заголовок</summary>
sum   — <details><summary>... (опечатка в коде)


── INSERT (HTML) ────────────────────────────────

<C-Enter>  — <br>
<C-CR>     — <br>
\a         — <a id="" class="anchor"></a>
\<Space>   — &nbsp;
\i         — id=""
\c         — class=""
\l         — <hr>
\s         — <style type="text/css"> </style>
\j         — <script type="text/javascript" src="js"> </script>
\css       — <link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1">
\sh        — #!/bin/bash
\py        — #!/usr/bin/env python3 + coding


── INSERT (CSS) ─────────────────────────────────

\w    — width:;
\h    — height:;
\v    — var(--);
\ff   — color: #fff;
\b    — border: 1px solid #ddd;
\1    — !important
\fw   — font-weight: bold;
\bg   — background: transparent url(../images/) no-repeat center;


── INSERT (прочее) ──────────────────────────────

\-    — –
\ve   — ?v=0.0.1


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
