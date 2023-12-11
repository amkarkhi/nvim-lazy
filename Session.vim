let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 lua/user/autocommands.lua
badd +6 lua/user/plugins.lua
badd +1 lua/user/treesitter.lua
badd +79 lua/user/whichkey.lua
badd +22 lua/user/alpha.lua
badd +0 fugitive:///home/amin/.config/nvim/.git//
argglobal
%argdel
edit lua/user/alpha.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 33 + 26) / 53)
exe 'vert 1resize ' . ((&columns * 104 + 105) / 210)
exe '2resize ' . ((&lines * 16 + 26) / 53)
exe 'vert 2resize ' . ((&columns * 105 + 105) / 210)
exe '3resize ' . ((&lines * 16 + 26) / 53)
exe 'vert 3resize ' . ((&columns * 105 + 105) / 210)
exe '4resize ' . ((&lines * 16 + 26) / 53)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("lua/user/alpha.lua", ":p")) | buffer lua/user/alpha.lua | else | edit lua/user/alpha.lua | endif
if &buftype ==# 'terminal'
  silent file lua/user/alpha.lua
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 1 - ((0 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("lua/user/alpha.lua", ":p")) | buffer lua/user/alpha.lua | else | edit lua/user/alpha.lua | endif
if &buftype ==# 'terminal'
  silent file lua/user/alpha.lua
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 22 - ((7 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 22
normal! 034|
wincmd w
argglobal
if bufexists(fnamemodify("fugitive:///home/amin/.config/nvim/.git//", ":p")) | buffer fugitive:///home/amin/.config/nvim/.git// | else | edit fugitive:///home/amin/.config/nvim/.git// | endif
if &buftype ==# 'terminal'
  silent file fugitive:///home/amin/.config/nvim/.git//
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 8) / 16)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
4wincmd w
exe '1resize ' . ((&lines * 33 + 26) / 53)
exe 'vert 1resize ' . ((&columns * 104 + 105) / 210)
exe '2resize ' . ((&lines * 16 + 26) / 53)
exe 'vert 2resize ' . ((&columns * 105 + 105) / 210)
exe '3resize ' . ((&lines * 16 + 26) / 53)
exe 'vert 3resize ' . ((&columns * 105 + 105) / 210)
exe '4resize ' . ((&lines * 16 + 26) / 53)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
