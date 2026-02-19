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
badd +4 packaging/tag
badd +1 packaging/build-image
badd +1 jb/BUILD
badd +1 jb/rethinking/install/with-system-packages
badd +4 jb/rethinking/install/rethinking.R
badd +1 packaging/Dockerfile
badd +1 jb/tar/_toc.yml
badd +8 start-jln
badd +1 jb/tar/notes/zathura.md
badd +1 jb/tar/jb-build
badd +1 .gitlab-ci.yml
badd +1 build-notes
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
wincmd _ | wincmd |
split
1wincmd k
wincmd w
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
exe 'vert 1resize ' . ((&columns * 119 + 360) / 720)
exe '2resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 2resize ' . ((&columns * 119 + 360) / 720)
exe '3resize ' . ((&lines * 46 + 96) / 193)
exe 'vert 3resize ' . ((&columns * 119 + 360) / 720)
exe '4resize ' . ((&lines * 48 + 96) / 193)
exe 'vert 4resize ' . ((&columns * 119 + 360) / 720)
exe '5resize ' . ((&lines * 63 + 96) / 193)
exe 'vert 5resize ' . ((&columns * 119 + 360) / 720)
exe '6resize ' . ((&lines * 63 + 96) / 193)
exe 'vert 6resize ' . ((&columns * 119 + 360) / 720)
exe '7resize ' . ((&lines * 63 + 96) / 193)
exe 'vert 7resize ' . ((&columns * 119 + 360) / 720)
exe '8resize ' . ((&lines * 95 + 96) / 193)
exe 'vert 8resize ' . ((&columns * 119 + 360) / 720)
exe '9resize ' . ((&lines * 95 + 96) / 193)
exe 'vert 9resize ' . ((&columns * 119 + 360) / 720)
exe 'vert 10resize ' . ((&columns * 119 + 360) / 720)
exe 'vert 11resize ' . ((&columns * 119 + 360) / 720)
exe 'vert 12resize ' . ((&columns * 120 + 360) / 720)
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
let s:l = 15 - ((14 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
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
let s:l = 10 - ((9 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 011|
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
let s:l = 16 - ((15 * winheight(0) + 23) / 46)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 16
normal! 0
lcd ~/davidvandebunte.gitlab.io
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/.gitlab-ci.yml", ":p")) | buffer ~/davidvandebunte.gitlab.io/.gitlab-ci.yml | else | edit ~/davidvandebunte.gitlab.io/.gitlab-ci.yml | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/.gitlab-ci.yml
endif
balt ~/davidvandebunte.gitlab.io/packaging/tag
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
let s:l = 31 - ((30 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 31
normal! 012|
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
let s:l = 1 - ((0 * winheight(0) + 31) / 63)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/jb/tar/jb-build", ":p")) | buffer ~/davidvandebunte.gitlab.io/jb/tar/jb-build | else | edit ~/davidvandebunte.gitlab.io/jb/tar/jb-build | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/jb/tar/jb-build
endif
balt ~/davidvandebunte.gitlab.io/BUILD
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
let s:l = 7 - ((6 * winheight(0) + 31) / 63)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 7
normal! 013|
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
let s:l = 12 - ((11 * winheight(0) + 31) / 63)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 12
normal! 0
lcd ~/davidvandebunte.gitlab.io
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
let s:l = 21 - ((20 * winheight(0) + 47) / 95)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 21
normal! 010|
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/build-notes", ":p")) | buffer ~/davidvandebunte.gitlab.io/build-notes | else | edit ~/davidvandebunte.gitlab.io/build-notes | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/build-notes
endif
balt ~/davidvandebunte.gitlab.io/packaging/tag
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
let s:l = 5 - ((4 * winheight(0) + 47) / 95)
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
let s:l = 22 - ((21 * winheight(0) + 95) / 191)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 22
normal! 017|
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
let s:l = 139 - ((138 * winheight(0) + 95) / 191)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 139
normal! 019|
wincmd w
argglobal
if bufexists(fnamemodify("~/davidvandebunte.gitlab.io/jb/tar/notes/zathura.md", ":p")) | buffer ~/davidvandebunte.gitlab.io/jb/tar/notes/zathura.md | else | edit ~/davidvandebunte.gitlab.io/jb/tar/notes/zathura.md | endif
if &buftype ==# 'terminal'
  silent file ~/davidvandebunte.gitlab.io/jb/tar/notes/zathura.md
endif
balt ~/davidvandebunte.gitlab.io/packaging/tag
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
let s:l = 73 - ((72 * winheight(0) + 95) / 191)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 73
normal! 039|
wincmd w
7wincmd w
exe '1resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 1resize ' . ((&columns * 119 + 360) / 720)
exe '2resize ' . ((&lines * 47 + 96) / 193)
exe 'vert 2resize ' . ((&columns * 119 + 360) / 720)
exe '3resize ' . ((&lines * 46 + 96) / 193)
exe 'vert 3resize ' . ((&columns * 119 + 360) / 720)
exe '4resize ' . ((&lines * 48 + 96) / 193)
exe 'vert 4resize ' . ((&columns * 119 + 360) / 720)
exe '5resize ' . ((&lines * 63 + 96) / 193)
exe 'vert 5resize ' . ((&columns * 119 + 360) / 720)
exe '6resize ' . ((&lines * 63 + 96) / 193)
exe 'vert 6resize ' . ((&columns * 119 + 360) / 720)
exe '7resize ' . ((&lines * 63 + 96) / 193)
exe 'vert 7resize ' . ((&columns * 119 + 360) / 720)
exe '8resize ' . ((&lines * 95 + 96) / 193)
exe 'vert 8resize ' . ((&columns * 119 + 360) / 720)
exe '9resize ' . ((&lines * 95 + 96) / 193)
exe 'vert 9resize ' . ((&columns * 119 + 360) / 720)
exe 'vert 10resize ' . ((&columns * 119 + 360) / 720)
exe 'vert 11resize ' . ((&columns * 119 + 360) / 720)
exe 'vert 12resize ' . ((&columns * 120 + 360) / 720)
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
