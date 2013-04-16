"Syntax highlighting for the Nube Config File
"
"Author:    Zachary Stigall
"Email:     zirrostig <at> lanfort.org
"Date:      2013 April 16
"License:   Vim

if exists("b:current_syntax")
    finish
endif

"Keywords
syn keyword nube_root       appearance behavior panels          nextgroup=nube_section
syn keyword nube_panels     top left right bottom               nextgroup=nube_section
syn keyword nube_widget     widget                              nextgroup=nube_section

"Identifiers
"if has("multi_byte")
"    syn match nube_ident
"else
syn match nube_ident    '[A-Za-z_][A-Za-z0-9_$.-]*'             nextgroup=nube_ident,nube_section

"Comments
syn keyword nube_todo       TODO FIXME XXX NOTE                 contained
syn match nube_comment      '#.*$'                              contains=nube_todo,@spell
syn match nube_comment      '\/\/.*$'                           contains=nube_todo,@spell
syn match nube_comment      '--.*$'                             contains=nube_todo,@spell
syn region nube_comment_ml  start='\/\*' end='\*\/'             contains=nube_todo,@spell

"Numbers/Hex
syn match nube_num          '[-+]\?\d*\.\?\d\+'
syn match nube_hex          '#\([0-9A-Fa-f]\{2\}\)\+'

"Regions
syn region nube_section     start=/{/ end=/}/                   fold transparent contained keepend
syn region nube_str         start=/['"]/ end=/['"]/ skip=/\v\\./ contains=nube_hex,@spell


"Highlighting
hi link nube_root       Structure
hi link nube_panels     Structure
hi link nube_widget     Structure
hi link nube_ident      Identifier
hi link nube_comment    Comment
hi link nube_comment_ml Comment
hi link nube_num        Number
hi link nube_hex        Number
hi link nube_str        String
hi link nube_todo       Todo
