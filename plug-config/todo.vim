" let g:todo_existing_date = 'r'
" let g:todo_load_python = 1

" Use todo#Complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete

" Auto complete projects
au filetype todo imap <buffer> + +<C-X><C-O>

" Auto complete contexts
au filetype todo imap <buffer> @ @<C-X><C-O>

" to avoid seeing the preview window
" au filetype todo setlocal completeopt-=preview

" Open preview window even with one completion
" au filetype todo setlocal completeopt+=menuone

" Options are top, lastdue, notoverdue, bottom
" let g:TodoTxtSortDueDateCursorPos = "top"

" Add date when inserting new todo
let g:Todo_txt_prefix_creation_date=1
