set nolist

"~~~~~~~~~~ VIMWIKI ~~~~~~~~~

" generate the date for vimwiki diary
" FORMAT: # WEEKDAY : DAYS SINCE STARTING 100 days of code : DATE
" EXAMPLE: # MON : DAY 60 : JULY 05, 2021
nnoremap <silent><leader>now :read !date +"\# \%a : DAY $((($(date +\%s) - $(date --date "2021-05-06" +\%s))/(3600*24))) : \%B \%d, \%Y" \| tr a-z A-Z<cr>
nnoremap <silent><leader>tm :read !date --date "1 day" +"\# \%a : DAY $((($(date --date "1 day" +\%s) - $(date --date "2021-05-06" +\%s))/(3600*24))) : \%B \%d, \%Y" \| tr a-z A-Z<cr>
nnoremap <silent><leader>time :read !date +"\%T \%p"<cr>

" days since starting 100 days of code
nnoremap <leader>code :read !echo DAY $((($(date +\%s) - $(date --date "2021-05-06" +\%s))/(3600*24)))<cr>
