if exists("syntax_on")
	syntax reset
endif
hi clear
set background=light
let colors_name = "mylight"

" TODO: this needs to be revisited
" http://stackoverflow.com/questions/2211477/how-can-i-use-variables-to-dry-up-vim-colorthemes
command! -nargs=+ Hi call CustomHighlighter(<f-args>)
function! CustomHighlighter(name, ...)
    let colour_order = ['ctermfg', 'ctermbg']
    let command = 'hi ' . a:name
    if (len(a:000) < 1) || (len(a:000) > (len(colour_order)))
        echoerr "No colour or too many colours specified"
    else
        for i in range(0,len(a:000)-1)
            let command .= ' ' . colour_order[i] . '=' . a:000[i]
        endfor
        exe command
    endif
endfunc 

let darkgrey=237
let lightgrey=249
let offwhite=255
let offblack=239
let white=15
let black=0

hi clear Cursorline
hi Cursorline ctermfg=232 ctermbg=250

hi Normal	   ctermfg=0          ctermbg=231
hi ErrorMsg	   ctermfg=white        ctermbg=darkred
hi Visual	   ctermfg=black        ctermbg=grey
hi VisualNOS	   ctermfg=244          ctermbg=black
hi Todo		   ctermfg=red          ctermbg=255
hi Search	   ctermfg=237          ctermbg=249
hi IncSearch	   ctermfg=237          ctermbg=249

hi SpecialKey	   ctermfg=darkcyan     ctermbg=cyan
hi Directory       ctermfg=darkblue     ctermbg=231
hi Title	   ctermfg=magenta      ctermbg=231
hi WarningMsg      ctermfg=202          ctermbg=231
hi WildMenu        ctermfg=yellow       ctermbg=black
hi ModeMsg	   ctermfg=0          ctermbg=231
hi MoreMsg         ctermfg=0  	ctermbg=231
hi Question        ctermfg=231          ctermbg=0
hi NonText         ctermfg=251          ctermbg=231

hi StatusLine	   ctermfg=0          ctermbg=231
hi StatusLineNC	   ctermfg=251          ctermbg=231
hi VertSplit	   ctermfg=black        ctermbg=gray

hi Folded	   ctermfg=darkgrey     ctermbg=231
hi FoldColumn	   ctermfg=darkgrey     ctermbg=231
hi LineNr	   ctermfg=249          ctermbg=231

hi DiffAdd	guibg=darkblue	ctermbg=darkblue term=none cterm=none
hi DiffChange	guibg=darkmagenta ctermbg=magenta cterm=none
hi DiffDelete	ctermfg=blue ctermbg=cyan gui=bold guifg=Blue guibg=DarkCyan
hi DiffText	cterm=bold ctermbg=red gui=bold guibg=Red

hi Cursor	ctermfg=5               ctermbg=231
hi lCursor	ctermfg=13              ctermbg=231

hi Comment          ctermfg=black       ctermbg=231
hi Constant	    ctermfg=0         ctermbg=231
hi Special	    ctermfg=0         ctermbg=231
hi Identifier	    ctermfg=0         ctermbg=231
hi Statement	    ctermfg=0         ctermbg=231
hi PreProc	    ctermfg=0         ctermbg=231
hi type		    ctermfg=0         ctermbg=231
hi Underlined	    cterm=underline
hi Ignore	    ctermfg=231         ctermbg=0

" suggested by tigmoid, 2008 Jul 18
hi Pmenu guifg=#c0c0c0 guibg=#404080
hi PmenuSel guifg=#c0c0c0 guibg=#2050d0
hi PmenuSbar guifg=blue guibg=darkgray
hi PmenuThumb guifg=#c0c0c0
