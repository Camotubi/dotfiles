"Plug-in install
call plug#begin('~/.config/plugged')
    "Tags manager
    Plug 'ludovicchabant/vim-gutentags'
    "File explorer
    Plug 'scrooloose/nerdtree' 
    Plug 'Xuyuanp/nerdtree-git-plugin'
    "Git diff on files
    Plug 'jisaacks/GitGutter'
    "Git wrapper
    "Plug 'tpope/vim-fugitive'
    "Vim status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    "repeat map as a whole, not just last native map
    Plug 'tpope/vim-repeat'
    Plug 'vim-pandoc/vim-pandoc', {'for' : 'md'}
    Plug 'vim-pandoc/vim-pandoc-syntax', {'for':'md'}
    "Plug 'Valloric/MatchTagAlways'
    "Colorscheme
    Plug 'cocopon/iceberg.vim'
    " Indenting line
    Plug 'Yggdroot/indentLine'
    Plug 'sheerun/vim-polyglot'
    Plug 'vim-syntastic/syntastic'
    Plug 'artur-shaik/vim-javacomplete2',{'for':'java'}
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'padawan-php/deoplete-padawan', {  'for':['php','blade'],'do': 'composer install' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'Shougo/denite.nvim'
    " For func argument completion
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
call plug#end() 
"Vim Base plugin
filetype plugin on
set tabstop=4
" Speed up renderin
set lazyredraw
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
""hybrid lines
set relativenumber
set number
"pandoc Languages
let pandoc#spell#default_langs = ["es","en"]
"airline fonts
let g:airline_powerline_fonts = 1
"colors
colorscheme iceberg
"open nerdtree on startup
autocmd VimEnter * NERDTree
"change buffer without saving
:set hid
"indentation
:set smartindent
:set autoindent 
"Fold config
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

"ignore files from gitignore by ctrlp
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:mta_filetypes = {
            \ 'html' : 1,
            \ 'xhtml' : 1,
            \ 'xml' : 1,
            \ 'jinja' : 1,
            \ 'blade' : 1,
            \}
" Denite
" denite

if has('nvim')
    " reset 50% winheight on window resize
    augroup deniteresize
        autocmd!
        autocmd VimResized,VimEnter * call denite#custom#option('default',
                    \'winheight', winheight(0) / 2)
    augroup end

    call denite#custom#option('default', {
                \ 'prompt': '❯'
                \ })

    ""call denite#custom#var('file_rec', 'command',
    ""    \ ['rg', '--files', '--glob', '!.git', ''])
    call denite#custom#var('grep', 'command', ['rg'])
    call denite#custom#var('grep', 'default_opts',
                \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
    call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
                \'noremap')
    call denite#custom#map('normal', '<Esc>', '<NOP>',
                \'noremap')
    call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
                \'noremap')
    call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
                \'noremap')
    call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
                \'noremap')
    call denite#custom#var('file_rec', 'command',
                \ ['ag', '--follow', '--nocolor', '--nogroup', '--ignore', '*.pyc', '-g', ''])
    call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
                \ [ '.git/', '.ropeproject/', '__pycache__/',
                \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
endif

nnoremap <C-p> :<C-u>Denite file_rec<CR>
nnoremap <leader>s :<C-u>Denite buffer<CR>
nnoremap <leader><Space>s :<C-u>DeniteBufferDir buffer<CR>
nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader><Space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <leader>d :<C-u>DeniteBufferDir file_rec<CR>

hi link deniteMatchedChar Special

" denite-extra

nnoremap <leader>o :<C-u>Denite location_list -mode=normal -no-empty<CR>
nnoremap <leader>hs :<C-u>Denite history:search -mode=normal<CR>
nnoremap <leader>hc :<C-u>Denite history:cmd -mode=normal<CR><Paste>

"deoplete
"
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'tag']
" javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
"neosnippet
let g:neosnippet#enable_completed_snippet = 1
" Functions 

" Toggle between relative numbers, normal numbers and no numbers
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        if(&relativenumber != 1 && &number == 1)
            set nonumber
        else
            set relativenumber
        endif
    endif
endfunc
nnoremap <leader>nt :call NumberToggle()<cr>
