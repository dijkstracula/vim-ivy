" Vimscript to be executed when an IVy file is sourced.

setlocal commentstring=#\ %s

" NB: in the Emacs major mode, `ivy-indent-offset` is 4, so we'll go with that
" here.
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

compiler ivy

" Run ivy_check on save. (Maybe this should be an option?)
" NBT: Disabling for the moment as it's synchronous and annoying...
"autocmd BufWritePost <buffer> make
