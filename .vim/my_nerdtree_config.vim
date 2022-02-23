"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""          NERDTree
let NERDTreeHijackNetrw = 1
let g:NERDTreeAutoDeleteBuffer = 1               " Automatically delete the buffer of the file you just deleted with NERDTree:
let g:NERDTreeMinimalUI = 1                      " Change to minimal UI
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeQuitOnOpen = 1                     " Quit NERDTree after open file
let g:NERDTreeShowHidden = 1                     " Show hidden files on NERDTree
let g:NERDTreeShowLineNumbers = 1                " Show line numbers on NERDTree
let g:nerdtree_tabs_open_on_gui_startup = 0      " Do not show NERDTree on startup
let g:NERDTreeWinSize = 60                       "increase the size of the NerdTree width
let g:NERDSpaceDelims = 1

" Auto close NERDTree if it is the only left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" find the current buffer in NerdTree
nmap <leader>fo :NERDTreeFind<CR>

"open nerdtree on the left
nmap <leader>ft :call ToggleNERDTree()<CR>

function! ToggleNERDTree()
  NERDTreeToggle
  silent NERDTreeMirror
endfunction

" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

