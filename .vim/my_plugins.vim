"""""""""""""""""""""""""""""""""
" Plugins and their configuration
"
" If your machine does not support plugins, 
" remove everything below this section.
"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""                           VIM PLUG

" Before using this, visit the github project for vim-plug for instructions about installing plugged.
" https://github.com/junegunn/vim-plug
" We need to run a command to Download plug.vim and put it in the "autoload" directory.
" We may need to toggle this on and off for installing plugins when behind a
" corporate firewall.
" git config --global http.sslVerify false
" git config --global http.sslVerify true 
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-rooter'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'

"   ==========================================================================
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
"   Using Coc language servers:
"   Once Coc.nvim has been installed, you need to install some language server extensions to provide intellisense support for JavaScript and Typescript projects. 
"   You can so so with :CocInstall.
"   :CocInstall coc-tsserver coc-json
"   With coc-tsserver, you get so many features that make writing, debugging and refactoring JavaScript or Typescript a breeze. 
"   Without configuring anything, auto-completion should just work and you can see function signatures and relevant suggestions as you type.

"   You can use the very nice :CocSearch to search and replace text across multiple files in the working directory.
"   Prerequisite for CocSearch: https://github.com/BurntSushi/ripgrep
"   Usage details -
"   :CocSearch searchPattern
"   This command will open a new bufferr with the results of your CocSearch.
"
"   Change and save:
"
"   Refactor session is started with searched patterns highlighted, just
"   change the text and save refactor buffer to make changes across all
"   related files. You can make any kind of changes, including add lines
"   and remove lines.
"
"   For more details - :help CocSearch
"   ==========================================================================

Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
"Plug 'vim-airline/vim-airline'
"vim lightline is an alternative to vim-airline. Look into it. Supposedly, lighlightline is minimalistic compared to vim-airline
Plug 'tpope/vim-unimpaired'
Plug 'liuchengxu/vim-which-key'
" Plug 'takac/vim-hardtime'
" Bulk rename files
Plug 'qpkorr/vim-renamer'

Plug 'sheerun/vim-polyglot'
" Look into the plugin "vim-polyglot". It seems to have references to a lot of language server packs.
" Even if you don't use vim-polyglot yourself, the language server packs that
" it is pointing to may be helpful.

"Prerequisites:
"brew install ctags-exuberant
"Use the ctags config from this repo: https://github.com/romainl/ctags-patterns-for-javascript
Plug 'ludovicchabant/vim-gutentags'
"Keeps your tags files up to date while you are working. 
"It updates the tag definitions as you save your work, so you don’t need to run ctags -R in the console.

" Navigate and manipulate files in a tree view - this is an alternative to NERDTree
" Plug 'lambdalisue/fern.vim'
" Make fern the default file explorer instead of netrw
" Plug 'lambdalisue/fern-hijack.vim'


"Plug 'ycm-core/YouCompleteMe'
"Compile YCM
"cd ~/.vim/bundle/YouCompleteMe
"python3 install.py --all
"You may have to install python3 and CMake

"If you see errors like this: E492: Not an editor command: ^M
"Goto the plugged folder:  ~/.vim/plugged  and run this command - find . | xargs dos2unix
"You may have to install the dos2unix package before running this.

call plug#end()
" After making changes to the list here, run the command ':PlugInstall' to get the latest updates.


"""""""""""""""""""""""""""""""""                                   TAGS
" This will look in the current directory for "tags",
" and work up the tree towards root until one is found.
" In other words, you can be anywhere in your source tree instead of just the root of it.
set tags=./tags;/         

"""""""""""""""""""""""""""""""""                                        FZF
    nnoremap <leader>cn :cnext <CR>
    nnoremap <leader>cp :cprevious <CR>

    "navigating between buffers
    nnoremap <leader>b :Buffers<CR>
    "use Ctrl-n and Ctrl-p to navigate up and down the list. 
    "To open buffers in split views, 
    "use Ctrl-v for vertical split and 
    "use Ctrl-x for horizontal split.

    "Since we have fzf, we do not need the plugin CtrlP for opening files by filename
    nnoremap <C-P> :Files<CR>
    nnoremap <leader>f :Files<CR>

"""""""""""""""""""""""""""""""""                           VIM WHICHKEY
    nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

""""""""""""""""""""""""""""""""""                          STATUS LINE

" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()


"What vim color schemes are installed?
"You can find your installed vim colorscheme files in the colors subdirectory of your vim installation directory.
"All the files end with the file extension .vim, and begin with the name of the colorscheme.
"In Linux, these are usually found here : /usr/share/vim/vim72/colors"
"The location might be different in Windows machines.

"------------------------------
" If Vim keeps complaining about not finding the color scheme at start-up,
" copy the gruvbox.vim file to Vim colors file.

" In Linux, it is usually at /usr/share/vim/vim82/colors
" In Linux, follow one of these two approaches.
" 1. Get gruvbox plug-in using a plugin manager; Go to /home/explorer436/.vim/plugged/gruvbox/colors/" and run this command: cp gruvbox.vim /usr/share/vim/vim82/colors
" Or just download the plugin from a browser and then copy the file from the
" downloaded folder to vim's colors folder.

" colo onedark

colo gruvbox
set bg=dark

" colo lucid
" colo landscape
" set bg=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""          Fern
" source ~/.vim/my_fern_config.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""          NERDTree
source ~/.vim/my_nerdtree_config.vim

"""""""""""""""""""""""""""""""""                                  EASYMOTION
source ~/.vim/my_easymotion_config.vim

""""""""""""""""""""""""""""""""""                          VIM HARDTIME
source ~/.vim/my_vim_hardtime_config.vim

""""""""""""""""""""""""""""""""                                      NETRW
" source ~/.vim/my_netrw_config.vim
