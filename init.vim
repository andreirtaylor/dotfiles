let mapleader = ","

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/andrei/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/andrei/.config/nvim')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('vim-airline/vim-airline')
call dein#add('tpope/vim-sensible')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-commentary')
call dein#add('Townk/vim-autoclose')
call dein#add('kchmck/vim-coffee-script')
call dein#add('elixir-lang/vim-elixir')
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-fugitive')
call dein#add('altercation/vim-colors-solarized')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('digitaltoad/vim-jade')
call dein#add('tpope/vim-surround')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
call dein#add('ervandew/supertab')
call dein#add('airblade/vim-gitgutter')
call dein#add('keith/tmux.vim')
" Golang bundles
call dein#add('fatih/vim-go')
call dein#add('Valloric/YouCompleteMe',{'build': './install.py --clang-completer --gocode-complete --tern-completer'})

" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" Install Bundles on startup
if dein#check_install()
  call dein#install()
endif

" Deoplete Settings
let g:deoplete#enable_at_startup = 1

"End dein Scripts-------------------------
set expandtab
set softtabstop=2
set shiftwidth=2
set noswapfile " do not keep swapfiles

" keep backups in the given backup directory
set backup
set backupdir=~/.vim-tmp
set writebackup " write a backup before overwriting a file

set noerrorbells visualbell t_vb= " disable beeping and window flashing on errors
set nu " add line numbers
set numberwidth=1
set list listchars=tab:>-,trail:␣
set scrolloff=10 " scroll up or down when the cursor less than 10 lines away from the top or bottom of the window
set timeoutlen=1000 ttimeoutlen=0 " remove timeout after pressing escape
set hlsearch " highlight search matches
set showcmd " show command in bottom bar

" Colorscheme configuration
set t_Co=256 " set the number of terminal colours
syntax enable
set background=dark

" Treat wrapped lines like separate lines when moving in normal mode
map j gj
map k gk

" restrict jsx to only .jsx files
" let g:jsx_pragma_required=1

command SP set paste
command NP set nopaste

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("find -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find -type f", ":sp")<cr>

" Remove trailing whitespace with Q
nnoremap <silent> Q :%s/[ \t]\+$//g<cr>

" GO SETTINGS
" Respect tabs in go
autocmd FileType go set noexpandtab
autocmd FileType go set softtabstop=8
autocmd FileType go set shiftwidth=8
" Dont show special chars for tabs
autocmd FileType go set nolist
au BufRead,BufNewFile  gtpl set filetype=html

" Sets how long tests will run before timing out
let g:go_test_timeout = '10s'
" gd (by default) will take you to the declaration of a function
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>f <Plug>(go-test-func)
autocmd FileType go nmap <leader>c <Plug>(go-coverage)
autocmd FileType go nmap <leader>n <Plug>(go-rename)
autocmd FileType go nmap <leader>q <Plug>(go-doc)
autocmd FileType go nmap <leader>i <Plug>(go-install)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" add/remove impors on save
let g:go_fmt_command = "goimports"

" vim-tmux-navigator
" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
" nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
" nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
" nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Helpful Key strokes
" "+y    copies to the system keyboard
