" Match typenames.
syntax keyword ivyTypes bool int bv
hi def link ivyTypes Type

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
    \ field
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
    \ template
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
    \ process
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
    \ global
    \ common
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
    \ debug
    \ for
    \ subclass

hi def link ivyKeywords Keyword


" Match pound until the EOL as a comment.
" (I don't know why `commentstring` isn't picking this up?)
syntax match ivyComment "\#.*$"
hi def link ivyComment Comment


" Operators.  Boy it would have been nice if `syntax keyword` would
" have worked on these!
syntax match ivyOperator "\v\~"
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
syntax match ivyOperator "\v\;"
syntax match ivyOperator "\v\:"
syntax match ivyOperator "\v\-"
syntax match ivyOperator "\v\<"
syntax match ivyOperator "\v\="
syntax match ivyOperator "\v\{"
syntax match ivyOperator "\v\}"

" For some reason, the following reserved words are treated as "polymorphic
" symbols" in ivy/ivy_utils (along with a bunch of comparison operators).
syntax keyword ivyOperator
            \ bvand
            \ bvor
            \ bvnot
            \ cast

hi def link ivyOperator Operator


" Numbers
" TODO: what are IVy's numeric types?
syntax match ivyNumber "\v<\d+>"
hi def link ivyNumber Number

" Logical variables
"     'in Ivy, as in Prolog, identifiers beginning with capital letters are
"     logical variables, or place-holders.'
syntax match logicalVar "\v<\u(\d|\h)*>\a*"
hi def link logicalVar Identifier

" Quoted symbols
"     'A quoted symbol is a possibly-empty sequence of characters enclosed in
"     double quote characters (and not containing a double quote character).'
" (As a result, we don't have to match for an escaped double-quote character.)
syntax region quotedSymbol start=/\v"/ end=/\v"/
highlight link quotedSymbol String

" Native quote
" TODO: Not sure yet how <<<...>>> is used.  At least we might want to be able
" to fold them.
