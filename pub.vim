let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/davidvandebunte.gitlab.io
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
badd +26 build_scripts/build-bazel
badd +1 build_scripts
badd +5 packaging/tag
badd +1 packaging/build-image
badd +1 jb/BUILD
badd +1 jb/rethinking/install/with-system-packages
badd +4 jb/rethinking/install/rethinking.R
badd +1 packaging/Dockerfile
badd +1 jb/tar/_toc.yml
badd +8 start-jln
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
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
5wincmd h
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
wincmd w
wincmd _ | wincmd |
split
1wincmd k
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
exe 'vert 1resize ' . ((&columns * 120 + 360) / 720)
exe '2resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 2resize ' . ((&columns * 120 + 360) / 720)
exe '3resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 3resize ' . ((&columns * 120 + 360) / 720)
exe '4resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 4resize ' . ((&columns * 120 + 360) / 720)
exe '5resize ' . ((&lines * 63 + 96) / 193)
exe 'vert 5resize ' . ((&columns * 120 + 360) / 720)
exe '6resize ' . ((&lines * 5 + 96) / 193)
exe 'vert 6resize ' . ((&columns * 120 + 360) / 720)
exe '7resize ' . ((&lines * 121 + 96) / 193)
exe 'vert 7resize ' . ((&columns * 120 + 360) / 720)
exe 'vert 8resize ' . ((&columns * 120 + 360) / 720)
exe '9resize ' . ((&lines * 95 + 96) / 193)
exe 'vert 9resize ' . ((&columns * 120 + 360) / 720)
exe '10resize ' . ((&lines * 95 + 96) / 193)
exe 'vert 10resize ' . ((&columns * 120 + 360) / 720)
exe 'vert 11resize ' . ((&columns * 120 + 360) / 720)
exe 'vert 12resize ' . ((&columns * 115 + 360) / 720)
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
let s:l = 17 - ((16 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 17
normal! 03|
lcd ~/davidvandebunte.gitlab.io
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/packaging/Dockerfile", ":p")) | buffer ~/davidvandebunte.gitlab.io/packaging/Dockerfile | else | edit ~/davidvandebunte.gitlab.io/packaging/Dockerfile | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/packaging/Dockerfile
endif
balt ~/davidvandebunte.gitlab.io/packaging/build-image
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
lcd ~/davidvandebunte.gitlab.io
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/jb/rethinking/install/with-system-packages", ":p")) | buffer ~/davidvandebunte.gitlab.io/jb/rethinking/install/with-system-packages | else | edit ~/davidvandebunte.gitlab.io/jb/rethinking/install/with-system-packages | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/jb/rethinking/install/with-system-packages
endif
balt ~/davidvandebunte.gitlab.io/packaging/build-image
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
let s:l = 20 - ((19 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 20
normal! 037|
lcd ~/davidvandebunte.gitlab.io
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/packaging/tag", ":p")) | buffer ~/davidvandebunte.gitlab.io/packaging/tag | else | edit ~/davidvandebunte.gitlab.io/packaging/tag | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/packaging/tag
endif
balt ~/davidvandebunte.gitlab.io/packaging/build-image
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
lcd ~/davidvandebunte.gitlab.io
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/WORKSPACE", ":p")) | buffer ~/davidvandebunte.gitlab.io/WORKSPACE | else | edit ~/davidvandebunte.gitlab.io/WORKSPACE | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/WORKSPACE
endif
balt ~/davidvandebunte.gitlab.io/packaging/build-image
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
let s:l = 46 - ((45 * winheight(0) + 31) / 63)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 46
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/BUILD", ":p")) | buffer ~/davidvandebunte.gitlab.io/BUILD | else | edit ~/davidvandebunte.gitlab.io/BUILD | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/BUILD
endif
balt ~/davidvandebunte.gitlab.io/packaging/build-image
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
lcd ~/davidvandebunte.gitlab.io
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/jb/BUILD", ":p")) | buffer ~/davidvandebunte.gitlab.io/jb/BUILD | else | edit ~/davidvandebunte.gitlab.io/jb/BUILD | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/jb/BUILD
endif
balt ~/davidvandebunte.gitlab.io/packaging/build-image
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
let s:l = 14 - ((13 * winheight(0) + 60) / 121)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 0
lcd ~/davidvandebunte.gitlab.io
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/jb/tar/_toc.yml", ":p")) | buffer ~/davidvandebunte.gitlab.io/jb/tar/_toc.yml | else | edit ~/davidvandebunte.gitlab.io/jb/tar/_toc.yml | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/jb/tar/_toc.yml
endif
balt ~/davidvandebunte.gitlab.io/build_scripts/build-bazel
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
let s:l = 3 - ((2 * winheight(0) + 95) / 191)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 07|
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/start-jln", ":p")) | buffer ~/davidvandebunte.gitlab.io/start-jln | else | edit ~/davidvandebunte.gitlab.io/start-jln | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/start-jln
endif
balt ~/davidvandebunte.gitlab.io/build_scripts/build-bazel
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
let s:l = 8 - ((7 * winheight(0) + 47) / 95)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/packaging/tag", ":p")) | buffer ~/davidvandebunte.gitlab.io/packaging/tag | else | edit ~/davidvandebunte.gitlab.io/packaging/tag | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/packaging/tag
endif
balt ~/davidvandebunte.gitlab.io/start-jln
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
let s:l = 4 - ((3 * winheight(0) + 47) / 95)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/packaging/tag", ":p")) | buffer ~/davidvandebunte.gitlab.io/packaging/tag | else | edit ~/davidvandebunte.gitlab.io/packaging/tag | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/packaging/tag
endif
balt ~/davidvandebunte.gitlab.io/build_scripts/build-bazel
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
let s:l = 5 - ((4 * winheight(0) + 95) / 191)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/build_scripts/build-bazel", ":p")) | buffer ~/davidvandebunte.gitlab.io/build_scripts/build-bazel | else | edit ~/davidvandebunte.gitlab.io/build_scripts/build-bazel | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/build_scripts/build-bazel
endif
balt ~/davidvandebunte.gitlab.io/WORKSPACE
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
let s:l = 24 - ((23 * winheight(0) + 95) / 191)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 24
normal! 018|
wincmd w
11wincmd w
exe '1resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 1resize ' . ((&columns * 120 + 360) / 720)
exe '2resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 2resize ' . ((&columns * 120 + 360) / 720)
exe '3resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 3resize ' . ((&columns * 120 + 360) / 720)
exe '4resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 4resize ' . ((&columns * 120 + 360) / 720)
exe '5resize ' . ((&lines * 63 + 96) / 193)
exe 'vert 5resize ' . ((&columns * 120 + 360) / 720)
exe '6resize ' . ((&lines * 5 + 96) / 193)
exe 'vert 6resize ' . ((&columns * 120 + 360) / 720)
exe '7resize ' . ((&lines * 121 + 96) / 193)
exe 'vert 7resize ' . ((&columns * 120 + 360) / 720)
exe 'vert 8resize ' . ((&columns * 120 + 360) / 720)
exe '9resize ' . ((&lines * 95 + 96) / 193)
exe 'vert 9resize ' . ((&columns * 120 + 360) / 720)
exe '10resize ' . ((&lines * 95 + 96) / 193)
exe 'vert 10resize ' . ((&columns * 120 + 360) / 720)
exe 'vert 11resize ' . ((&columns * 120 + 360) / 720)
exe 'vert 12resize ' . ((&columns * 115 + 360) / 720)
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
