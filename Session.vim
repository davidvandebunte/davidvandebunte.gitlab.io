let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/repo1_public
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +48 WORKSPACE
badd +2 BUILD
badd +1 build_scripts/build-bazel
badd +1 build_scripts
badd +5 packaging/tag
badd +9 packaging/build-image
badd +1 jb/BUILD
badd +1 jb/rethinking/install/with-system-packages
badd +4 jb/rethinking/install/rethinking.R
badd +0 packaging/Dockerfile
argglobal
%argdel
$argadd WORKSPACE
edit packaging/build-image
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
3wincmd k
wincmd w
wincmd w
wincmd w
wincmd w
wincmd _ | wincmd |
split
wincmd _ | wincmd |
split
2wincmd k
wincmd w
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
exe '1resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 1resize ' . ((&columns * 241 + 362) / 724)
exe '2resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 2resize ' . ((&columns * 241 + 362) / 724)
exe '3resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 3resize ' . ((&columns * 241 + 362) / 724)
exe '4resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 4resize ' . ((&columns * 241 + 362) / 724)
exe '5resize ' . ((&lines * 63 + 96) / 193)
exe 'vert 5resize ' . ((&columns * 240 + 362) / 724)
exe '6resize ' . ((&lines * 5 + 96) / 193)
exe 'vert 6resize ' . ((&columns * 240 + 362) / 724)
exe '7resize ' . ((&lines * 121 + 96) / 193)
exe 'vert 7resize ' . ((&columns * 240 + 362) / 724)
exe 'vert 8resize ' . ((&columns * 241 + 362) / 724)
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
let s:l = 14 - ((13 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 0
lcd ~/repo1_public
wincmd w
argglobal
if bufexists(fnamemodify("~/repo1_public/packaging/Dockerfile", ":p")) | buffer ~/repo1_public/packaging/Dockerfile | else | edit ~/repo1_public/packaging/Dockerfile | endif
if &buftype ==# 'terminal'
  silent file ~/repo1_public/packaging/Dockerfile
endif
balt ~/repo1_public/packaging/build-image
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
let s:l = 9 - ((8 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 044|
lcd ~/repo1_public
wincmd w
argglobal
if bufexists(fnamemodify("~/repo1_public/jb/rethinking/install/with-system-packages", ":p")) | buffer ~/repo1_public/jb/rethinking/install/with-system-packages | else | edit ~/repo1_public/jb/rethinking/install/with-system-packages | endif
if &buftype ==# 'terminal'
  silent file ~/repo1_public/jb/rethinking/install/with-system-packages
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
let s:l = 16 - ((15 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 16
normal! 0
lcd ~/repo1_public
wincmd w
argglobal
if bufexists(fnamemodify("~/repo1_public/packaging/tag", ":p")) | buffer ~/repo1_public/packaging/tag | else | edit ~/repo1_public/packaging/tag | endif
if &buftype ==# 'terminal'
  silent file ~/repo1_public/packaging/tag
endif
balt ~/repo1_public/packaging/build-image
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
let s:l = 3 - ((2 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0
lcd ~/repo1_public
wincmd w
argglobal
if bufexists(fnamemodify("~/repo1_public/WORKSPACE", ":p")) | buffer ~/repo1_public/WORKSPACE | else | edit ~/repo1_public/WORKSPACE | endif
if &buftype ==# 'terminal'
  silent file ~/repo1_public/WORKSPACE
endif
balt ~/repo1_public/packaging/build-image
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
let s:l = 48 - ((47 * winheight(0) + 31) / 63)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 48
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/repo1_public/BUILD", ":p")) | buffer ~/repo1_public/BUILD | else | edit ~/repo1_public/BUILD | endif
if &buftype ==# 'terminal'
  silent file ~/repo1_public/BUILD
endif
balt ~/repo1_public/packaging/build-image
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
let s:l = 2 - ((1 * winheight(0) + 2) / 5)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 2
normal! 05|
lcd ~/repo1_public
wincmd w
argglobal
if bufexists(fnamemodify("~/repo1_public/jb/BUILD", ":p")) | buffer ~/repo1_public/jb/BUILD | else | edit ~/repo1_public/jb/BUILD | endif
if &buftype ==# 'terminal'
  silent file ~/repo1_public/jb/BUILD
endif
balt ~/repo1_public/packaging/build-image
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
let s:l = 5 - ((4 * winheight(0) + 60) / 121)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 0
lcd ~/repo1_public
wincmd w
argglobal
if bufexists(fnamemodify("~/repo1_public/build_scripts/build-bazel", ":p")) | buffer ~/repo1_public/build_scripts/build-bazel | else | edit ~/repo1_public/build_scripts/build-bazel | endif
if &buftype ==# 'terminal'
  silent file ~/repo1_public/build_scripts/build-bazel
endif
balt ~/repo1_public/WORKSPACE
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
let s:l = 26 - ((25 * winheight(0) + 95) / 191)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 26
normal! 018|
wincmd w
exe '1resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 1resize ' . ((&columns * 241 + 362) / 724)
exe '2resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 2resize ' . ((&columns * 241 + 362) / 724)
exe '3resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 3resize ' . ((&columns * 241 + 362) / 724)
exe '4resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 4resize ' . ((&columns * 241 + 362) / 724)
exe '5resize ' . ((&lines * 63 + 96) / 193)
exe 'vert 5resize ' . ((&columns * 240 + 362) / 724)
exe '6resize ' . ((&lines * 5 + 96) / 193)
exe 'vert 6resize ' . ((&columns * 240 + 362) / 724)
exe '7resize ' . ((&lines * 121 + 96) / 193)
exe 'vert 7resize ' . ((&columns * 240 + 362) / 724)
exe 'vert 8resize ' . ((&columns * 241 + 362) / 724)
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
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
