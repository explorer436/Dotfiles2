"""""""""""""""""""""""""""""""""                                  EASYMOTION

    "Minimal but useful vimrc config for easymotion
    let g:EasyMotion_do_mapping = 0 " Disable default mappings
    
    " Turn on case-insensitive feature
    let g:EasyMotion_smartcase = 1
    
    " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " `s{char}{label}`
    nmap s <Plug>(easymotion-overwin-f)
    " or
    " `s{char}{char}{label}`
    " Need one more keystroke, but on average, it may be more comfortable.
    " nmap s <Plug>(easymotion-overwin-f2)
    
    " jump to line
    nmap <Leader>jl <Plug>(easymotion-overwin-line)
    " jump to word
    nmap <Leader>jw <Plug>(easymotion-overwin-w)
    
    " Gif config
    map  / <Plug>(easymotion-sn)
    omap / <Plug>(easymotion-tn)
    
    " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
    " Without these mappings, `n` & `N` works fine. (These mappings just provide
    " different highlight method and have some other features )
    map  n <Plug>(easymotion-next)
    map  N <Plug>(easymotion-prev)

