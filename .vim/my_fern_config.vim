" .............................................................................
" lambdalisue/fern.vim
" .............................................................................

" Disable netrw.
" let g:loaded_netrw  = 1
" let g:loaded_netrwPlugin = 1
" let g:loaded_netrwSettings = 1
" let g:loaded_netrwFileHandlers = 1

" Custom settings and mappings.
" let g:fern#disable_default_mappings = 1

noremap <silent> <leader>fo :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=
noremap <silent> <leader>ft :Fern . -drawer -width=35<CR><C-w>=

function! s:init_fern() abort
  echo "This function is called ON a fern buffer WHEN initialized"

  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> e <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> k <Plug>(fern-action-mark-toggle)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

