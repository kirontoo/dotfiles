let g:vimwiki_list = [{'path': '~/my_site/',
        \ 'template_path': '~/public_html/templates/',
        \ 'template_default': 'def_template',
        \ 'template_ext': '.html'}]

let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.template_path = '~/vimwiki/templates/'
let wiki_1.template_ext = '.md'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let wiki_1.index = 'index'
let wiki_1.auto_tags = 1
let wiki_1.auto_diary_index = 1

let wiki_2 = {}
let wiki_2.path = '~/vimwiki/journal'
let wiki_2.template_path = '~/vimwiki/templates/'
let wiki_2.template_ext = '.md'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'
let wiki_2.auto_diary_index = 1

let g:vimwiki_list = [wiki_1, wiki_2]

" let g:vimwiki_list = [
"     \ {'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md',},
"     \ {'path': '~/vimwiki/journal/', 'syntax': 'markdown', 'ext': '.md', 'index': 'index'}
"     \]


    " let wiki_1 = {}
    " let wiki_1.path = '~/my_docs/'
    " let wiki_1.html_template = '~/public_html/template.tpl'
    " let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_ext2syntax = {'.md': 'markdown'}
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_global_ext = 1
