""""""""""""""""""""""""""""""""                                      NETRW
    let g:netrw_banner = 0                                           "disable banner
    let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'         "always show numbers
    let g:netrw_liststyle = 3                                        " tree-view
    let g:netrw_winsize = -28                                        " absolute width of netrw window
    nmap <buffer> r <Plug>(netrw-ctrl-l)
    " let g:netrw_sort_sequence = '[\/]$,*'                            " sort is affecting only: directories on the top, files below
    let g:netrw_browse_split = 0                                     " open files in a new window or tab instead of the default.  
                                                                     " When the option is one or two, the splitting will be taken
                                                                     " horizontally or vertically, respectively.  When the option is set to three, a
                                                                     " <cr> will cause the file to appear in a new tab.
    set autochdir                                                    " Change directory to the current buffer when opening files.

    function! ToggleVExplorer()
        if exists("t:expl_buf_num")
            let expl_win_num = bufwinnr(t:expl_buf_num)
            let cur_win_num = winnr()
    
            if expl_win_num != -1
                while expl_win_num != cur_win_num
                    exec "wincmd w"
                    let cur_win_num = winnr()
                endwhile
    
                close
            endif
    
            unlet t:expl_buf_num
        else
             Vexplore
             let t:expl_buf_num = bufnr("%")
        endif
    endfunction
    
    " Toggle Vexplore with <leader> fo
    nmap <leader>fo :call ToggleVExplorer()<CR>

    " Open file, but keep focus in Explorer
    autocmd filetype netrw nmap <c-a> <cr>:wincmd W<cr>
