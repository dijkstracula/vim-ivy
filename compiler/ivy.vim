" Highly-obtuse regexen for grepping through ivy_check errors.

let s:cpo_save = &cpo
set cpo&vim

" Allow a user to override all this.
if exists("current_compiler")
    finish
endif
let current_compiler = "ivyc"

" Bootstrap the CompilerSet command for older Vims.
if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

" 
let s:path = expand('<sfile>:p:h') . '/doit.sh'

execute 'CompilerSet makeprg=' .. s:path .. '\ ' .. expand('%:p')

CompilerSet errorformat =%f(%l):\ error:\ %m
CompilerSet errorformat+=\ line\ %l:\ error:\ %m

