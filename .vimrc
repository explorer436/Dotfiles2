" If you want to use this vimrc settings in a machine, 

" either put this line in your .vimrc file : source /home/explorer436/Downloads/GitRepositories/thoughts-notes/my-vim-notes/vimrcFiles/my_vimrc.vim
" or copy paste everything starting from the line below.


" DEBUGGING START UP ISSUES IN WINDOWS MACHINES:
" If there is a black screen that is flashing, try to read the message it is
" printing on the flashing black screen.
" The message usually maps to the comments on one of the lines in your vimrc
" file.
" Identify the line and disable it.

"""""""""""""""""""""""""""""""""                                        Use Vim settings, rather then Vi settings. 
"""""""""""""""""""""""""""""""""                                          This setting must be as early as possible, as it has side effects.
	set nocompatible

"""""""""""""""""""""""""""""""""                                        SET SPACE BAR AS THE LEADER KEY
	let mapleader = " "

"""""""""""""""""""""""""""""""""                                        TABS
    set guitablabel=%N:%M%t " Show tab numbers on each tab

    "open a new empty tab
    nnoremap <leader>tn :tabnew<CR>              

    "close the tab and all windows in it
    nnoremap <leader>tc :tabc<CR>               

"""""""""""""""""""""""""""""""""                                        Run internal vim terminal at current file's directory
    map <F6> :let $VIM_DIR=expand('%:p:h')<CR>:terminal<CR>cd $VIM_DIR<CR> 

"""""""""""""""""""""""""""""""""                                        Move 1 more lines up or down in normal and visual selection modes.

    " Disabling this in normal mode because it is messing with Vim's default behaviour for J (join lines)
    " nnoremap K :m .-2<CR>==
    " nnoremap J :m .+1<CR>==

    " Enabling this only in visual mode. Select the lines and use shift K or shift J to move them up or down.
    vnoremap K :m '<-2<CR>gv=gv
    vnoremap J :m '>+1<CR>gv=gv

"""""""""""""""""""""""""""""""""                                        SEARCH FOR SOMETHING AND REPLACE IT IN THE CURRENT BUFFER
    " Press * to search for the term under the cursor or a visual selection and
    " then press a key below to replace all instances of it in the current file.
    "nnoremap <Leader>r :%s///g<Left><Left>
    "nnoremap <Leader>rc :%s///gc<Left><Left><Left>
    nnoremap <Leader>r :%s///gc<Left><Left><Left>

"""""""""""""""""""""""""""""""""                                        Changing grep defaults
    if executable("ag")
        "Prerequisite: the silver searcher
        set grepprg=ag\ --vimgrep\ --smart-case\ --follow
    endif
    if executable("rg")
        "Prerequisite: https://github.com/BurntSushi/ripgrep
        set grepprg=rg\ --vimgrep\ --smart-case\ --follow
    endif

""""""""""""""""""""""""""""""""                                      SPLITS
    " Jump between splits in a window
    "move cursor to the window on the left
    nnoremap <leader>h :wincmd h<CR>                                     
    "move cursor to the window on the bottom
    nnoremap <leader>j :wincmd j<CR>                                     
    "move cursor to the window on the top
    nnoremap <leader>k :wincmd k<CR>                                     
    "move cursor to the window on the right
    nnoremap <leader>l :wincmd l<CR>                                     

""""""""""""""""""""""""""""""""                                    INCREASE/DECREASE WINDOW HEIGHT
    "height increase by 10
    nnoremap <Leader>hi :resize +10<CR>         
    "height decrease by 10
    nnoremap <Leader>hd :resize -10<CR>         

    " INCREASE/DECREASE WINDOW WIDTH
    "width increase by 10
    nnoremap <Leader>wi :vertical resize +10<CR> 
    "width decrease by 10
    nnoremap <Leader>wd :vertical resize -10<CR> 

"------------------------------
 
	filetype indent plugin on " Attempt to determine the type of a file 
                              " based on its name and possibly its contents.
                              " Use this to allow intelligent auto-indenting for each filetype,
                              " and for plugins that are filetype specific.

 
    syntax on " Enable color syntax highlighting - wherever applicable
              " Basic highlighting for a lot of languages.
              " If you want more highlighting for your language,
              " you may have to download additional stuff.
	
	" Vim with default settings does not allow easy switching between multiple files
	" in the same editor window. Users can use multiple split windows or multiple
	" tab pages to edit multiple files, but it is still best to enable an option to
	" allow easier switching between files.
	"
	" When off a buffer is unloaded when it is |abandon|ed.  When on a
	" buffer becomes hidden when it is |abandon|ed.  If the buffer is still
	" displayed in another window, it does not become hidden, of course.
    " It which allows you to re-use the same window 
    " and switch from an unsaved buffer without saving it first. Also allows
	" you to keep an undo history for multiple files when re-using the same window
	" in this way. Note that using persistent undo also lets you undo in multiple
	" files even in the same window, but is less efficient and is actually designed
	" for keeping undo history after closing Vim entirely. Vim will complain if you
	" try to quit without saving, and swap files will keep you safe if your computer
	" crashes.
	" Note that not everyone likes working this way (with the hidden option).
	" Alternatives include using tabs or split windows instead of re-using the same
	" window as mentioned above, and/or either of the following options:
	" set confirm
	" set autowriteall"
	set hidden	

    "File find options in addition to `hidden`
"    set path+=**  " Search all subdirectories and recursively
"    set wildmenu
     set wildignore+=**/node_modules/**
    "set wildignore=*/node_modules/*,*/target/*,*/tmp/*"

    "Set default font in mac vim and gvim
    " set guifont=Inconsolata\ for\ Powerline:h24
    set cursorline    " highlight the current line
    set visualbell    " stop that ANNOYING beeping
    "set wildmenu
    set wildmode=list:longest,full

    set autoread                           " Reload files changed outside vim

    " This line has a tendency to cause flashes in Windows machines. 
    " You may have to disable this line.
    au FocusGained,BufEnter * :silent! !   " Trigger autoread when changing buffers or coming back to vim in terminal.

	set bs=indent,eol,start " allow backspacing over everything in insert mode
	set ai                  " always set autoindenting on
	"set backup             " keep a backup file
	set viminfo='20,\"50    " read/write a .viminfo file, don't store more than 50 lines of registers
	set history=50          " keep 50 lines of command line history
	set ruler               " show the cursor position all the time
	"set guicursor=         " what does this do?
	"set noshowmatch        " When a bracket is inserted, briefly jump to the matching one.
    set laststatus=2        " Always display the status line

   "Hybrid Line Numbers - 
   "Enabling both the absolute and relative line numbers at the same time 
   "sets up the hybrid line number mode.  
   "Hybrid line numbering is the same as the relative line numbering 
   "with the only difference being that the current line 
   "shows its absolute line number instead of showing 0.
	set relativenumber       " shows relative line numbers
	set number               " shows line numbers

	"set hlsearch               " When there is a previous search pattern, highlight all its matches.
	"set nohlsearch             " opposite of set hlsearch
	set noerrorbells            " will not make error sounds when we go to the end of the line, etc.
	set tabstop=4 softtabstop=4            " tabstop means it is only 4 characters long. softtabstop means it is only 4 spaces long.
	set shiftwidth=4            " every time we hit tab, it shifts the characters by 4 spaces instead of 8.
	set expandtab               " convert it from tab character to spaces
	set smartindent             " vim tires its best to indent the code for us
	"set nowrap                 " if the line goes off the screen, keep going to the right instead of showing it on the next line on the screen.
	set ignorecase              " Ignore case in search patterns.  Also used when searching in the tags file.
	"set smartcase              " it ewill do case sensitive searching until we put in a capital letter.
	set noswapfile              " do not create vim.swap files all throughout the project.
	"set nobackup               " it will not create backup files. If you use this, make sure you also use the undodir and undofile.
	"set undodir=~/.vim/undodir            " what does this do?
	"set undofile               " what does this do?
	set incsearch               " turns on incremental search
	"set termguicolors          " what does this do?
	"set scrolloff=8            " what does this do?
	"set cmdheight=2            " Give more space for displaying messages. 
	"set updatetime=50          " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
	"set shortmess+=c           " Don't pass messages to |ins-completion-menu|.
	"set colorcolumn=80          " shows a line at the 80 column of the page
	"highlight ColorColumn ctermbg=0 guibg=lightgrey            " the color that needs to be used for the 80 column line	

    " Vim's default updatetime 4000ms is not good for async update
    "The delay for a lot of async operations is governed by Vim's updatetime option; the default value is 4000, i.e. 4 seconds.
    "Reduce it to 100ms (add set updatetime=100 to your vimrc). 
    "Note updatetime also controls the delay before vim writes its swap file (see :help updatetime).
    set updatetime=100

"""""""""""""""""""""""""""""""""                                   GIT PATH
if has('win32')
    let $PATH .= ';' . 'C:/Program Files (x86)/Git/bin'
endif
if has('win64')
    let $PATH .= ';' . 'C:/Program Files/Git/bin/'
endif


"""""""""""""""""""""""""""""""""
" Plugins and their configuration
"
" If your machine does not support plugins, 
" remove everything below this section.
"""""""""""""""""""""""""""""""""
source ~/.vim/my_plugins.vim

