" The big hunk ol' meat: the indentation function.
" Seems slightly flaky with nvim, still, for reasons I gotta
" still grok.
setlocal indentexpr=IvyIndent()

function! IvyIndent() abort
    let prevlnum = prevnonblank(v:lnum - 1)

    let thisl = substitute(getline(v:lnum), '\v#.*$', '', '')
    let prevl = substitute(getline(prevlnum), '\v#.*$', '', '')

    let ind = indent(prevlnum)
    if prevl =~ '[[{]\s*$'
        " previous line opened a block
        let ind += shiftwidth()
    endif
    if thisl =~ '^\s*[]}]'
        " this line closed a block
        let ind -= shiftwidth()
    endif

    return ind

endfunction
