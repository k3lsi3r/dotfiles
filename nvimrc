let mapleader = " "
let g:netrw_dirhistmax = 0 " Don't create netrw_dirhist..
set iskeyword+=- " Make words separated by - treated as a whole symbol (like _)

" Include plugs
if filereadable(expand("~/dotfiles/nvim.bundles"))
  source ~/dotfiles/nvim.bundles
endif

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Tabs..
set tabstop=2
set expandtab
set shiftround
set shiftwidth=2

" Put new windows right and below when splitting
set splitbelow
set splitright

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
hi ColorColumn ctermbg=blue guibg=blue

set autowriteall " Autowrite always (even :qall, :exit etc)
set history=100  " Don't store really old commands
set nojoinspaces " Don't use double spaces after join commands

" Simple autocomplete using vim builtin
function! CleverTab(reverse)
  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
    return "\<Tab>"
  elseif a:reverse
    return "\<C-P>"
  else
    return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab(0)<CR>
inoremap <S-Tab> <C-R>=CleverTab(1)<CR>

" FZF files
nmap <C-p> :Files<CR>
nmap <C-t> :Tags<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" TODO spelling zg and zw mark words as good/wrong in spellfile
" :set spell will highlight misspelled words
" set spellfile=$HOME/.vim-spell-en.utf-8.add
" " Autocomplete with dictionary words when spell check is on
" set complete+=kspell

" TODO Colors/Theme
if (has("termguicolors"))
  " set termguicolors " uncomment this to make this set term gui colors..
endif
" colorscheme OceanicNext

" TODO Syntax
syntax enable
" function! MyOnBattery()
"   return readfile('/sys/class/power_supply/AC/online') == ['0']
" endfunction

" " only run neomake after normal mode writes when plugged into AC power 
" if MyOnBattery()
"   call neomake#configure#automake('w')
" else
"   call neomake#configure#automake('nw', 1000)
" endif

" Rust formatting
let g:rustfmt_autosave = 1

" Always use vertical diffs
set diffopt+=vertical

" <leader>h to remove search highlights
nnoremap <silent> <leader>h :nohlsearch<Bar>:echo<CR>

" relative numbers with absolute number of current line
set relativenumber
set number