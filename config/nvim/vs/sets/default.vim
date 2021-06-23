" When on, the title of the window will be set to the value of
" 'titlestring'
set title
set titlestring=\ %t\ %m\ %f

" Clipboard integration
set clipboard+=unnamedplus

" Enables mouse support
set mouse=a

" Use the popup menu also when there is only one match.
" Show extra information about the currently selected
" completion in the preview window.
set completeopt=menuone,noselect,preview

" Show the line number relative to the line with the cursor in front of
" each line.
set number relativenumber

" buffer becomes hidden when it is abandoned.
set hidden

" Ignore case in search patterns.  Also used when searching in the tags
" file.
set ignorecase

" Override the ignorecase option if the search pattern contains upper
" case characters.  Only used when the search pattern is typed and
" ignorecase option is on.
set smartcase

" While typing a search command, show where the pattern, as it was typed
" so far, matches. The matched string is highlighted. You can use the
" CTRL-G and CTRL-T keys to move to the next and previous match.
set incsearch

" Determine the behavior when part of a mapped key sequence has been received.
set timeoutlen=500

" Always show the signcolumn
set signcolumn=yes

" This option helps to avoid all the hit-enter prompts caused by file
" messages, don't give ins-completion-menu messages.  For example,
" "-- XXX completion (YYY)", "match 1 of 2", "The only match",
" "Pattern not found", "Back at original", etc.
set shortmess+=c

" If this many milliseconds nothing is typed the swap file will be
" written to disk (see crash-recovery).  Also used for the
" CursorHold autocommand event.
set updatetime=300

" Copy indent from current line when starting a new line. If
" you do not type anything on the new line except <BS> or CTRL-D and then type
" <Esc>, CTRL-O or <CR>, the indent is deleted again.
set autoindent

" Use tabs, it is better than space if you know how to use it
set noexpandtab

" Number of spaces to use for each step of (auto)indent.  Used for
" 'cindent', >>, <<, etc.
set shiftwidth=4

" Number of spaces that a <Tab> counts for while performing editing
" operations, like inserting a <Tab> or using <BS>.
set softtabstop=4

" Number of spaces that a <Tab> in the file counts for.
set tabstop=4

" When on, a <Tab> in front of a line inserts blanks according to
" shiftwidth.  tabstop or softtabstop is used in other places.  A
" <BS> will delete a shiftwidth worth of space at the start of the
" line.
set smarttab

" TODO: explain all
" set termguicolors
set noshowmode
set noshowcmd
set noruler
set splitbelow splitright
set nohlsearch
set nobackup
set nowritebackup
set noswapfile
set modelineexpr
set list
set listchars=tab:\|\ ,eol:¬,nbsp:␣,extends:…,precedes:<,extends:>,trail:·
set wildignore=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
