" Match typenames.
syntax keyword ivyTypes bool int bv
highlight link ivyTypes Type

" Match reserved words.
syntax keyword ivyKeywords 
    \ relation 
    \ individual 
    \ function 
    \ axiom 
    \ conjecture 
    \ schema 
    \ instantiate 
    \ instance 
    \ derived 
    \ concept 
    \ init 
    \ action 
    \ method 
    \ state 
    \ assume 
    \ assert 
    \ set 
    \ null 
    \ old 
    \ from 
    \ update 
    \ params 
    \ in 
    \ match 
    \ ensures 
    \ requires 
    \ modifies 
    \ true 
    \ false 
    \ fresh 
    \ module 
    \ object 
    \ class 
    \ type 
    \ if 
    \ else 
    \ local 
    \ let 
    \ call 
    \ entry 
    \ macro 
    \ interpret 
    \ forall 
    \ exists 
    \ returns 
    \ mixin 
    \ execute 
    \ before 
    \ after 
    \ isolate 
    \ with 
    \ export 
    \ delegate 
    \ import 
    \ using 
    \ include 
    \ progress 
    \ rely 
    \ mixord 
    \ extract 
    \ destructor 
    \ some 
    \ maximizing 
    \ minimizing 
    \ private 
    \ implement 
    \ property 
    \ while 
    \ invariant 
    \ struct 
    \ definition 
    \ ghost 
    \ alias 
    \ trusted 
    \ this 
    \ var 
    \ attribute 
    \ variant 
    \ of 
    \ scenario 
    \ proof 
    \ named 
    \ fresh 
    \ temporal 
    \ globally 
    \ eventually 
    \ decreases 
    \ specification 
    \ implementation 
    \ ensure 
    \ require 
    \ around 
    \ parameter 
    \ apply 
    \ theorem 
    \ showgoals 
    \ defergoal 
    \ spoil 
    \ explicit 
    \ thunk 
    \ isa 
    \ autoinstance 
    \ constructor 
    \ finite 
    \ tactic 
    \ unfold 
    \ forget 

highlight link ivyKeywords Keyword

" Match pound until the EOL as a comment.
" (I don't know why `commentstring` isn't picking this up?)
syntax match ivyComment "\v#.*$"
highlight link ivyComment Comment

" Operators.  Boy it would have been nice if `syntax keyword` would
" have worked on these!
syntax match ivyOperator "\v~"
syntax match ivyOperator "\v\,"
syntax match ivyOperator "\v\+"
syntax match ivyOperator "\v\*"
syntax match ivyOperator "\v\/"
syntax match ivyOperator "\v\<\="
syntax match ivyOperator "\v\>"
syntax match ivyOperator "\v\>\="
syntax match ivyOperator "\v\*\>"
syntax match ivyOperator "\v\("
syntax match ivyOperator "\v\)"
syntax match ivyOperator "\v\|"
syntax match ivyOperator "\v\&"
syntax match ivyOperator "\v\~\="
syntax match ivyOperator "\v:\="
syntax match ivyOperator "\v\-\>"
syntax match ivyOperator "\v\<\-\>"
syntax match ivyOperator "\v\.\.\."
syntax match ivyOperator "\v\.\."
syntax match ivyOperator "\v\$"
syntax match ivyOperator "\v\^"

" Larger matches should come before smaller ones so the tokenizer can
" greedily eat as much as it can; so, this is slightly out of order from
" ivy_lexer.py unfortunately.
syntax match ivyOperator "\v;"
syntax match ivyOperator "\v:"
syntax match ivyOperator "\v\-"
syntax match ivyOperator "\v\<"
syntax match ivyOperator "\v\="
syntax match ivyOperator "\v\{"
syntax match ivyOperator "\v\}"

highlight link ivyOperator Operator

" The big hunk ol' meat: the indentation function.
" Currently only handles curly braces but the emacs mode also indents
" on square ones (I think?).
setlocal indentexpr=IvyIndent()

function! IvyIndent()
  let line = getline(v:lnum)
  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

  if previous =~ "{" && previous !~ "}" && line !~ "}" && line !~ ":$"
    return indent(previousNum) + &tabstop
  endif

  ...
endfunction

