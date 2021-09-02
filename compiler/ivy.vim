" Highly-obtuse regexen for grepping through ivy_check errors.

" Allow a user to override all this.
if exists("current_compiler")
    finish
endif
let current_compiler = "ivy_check"

" Bootstrap the CompilerSet command for older Vims.
if exists(":CompilerSet") != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=ivy_check\ %\ \\\|\ grep\ ':\ error:\ '
CompilerSet errorformat=%f(%l):\ error:\ %m
