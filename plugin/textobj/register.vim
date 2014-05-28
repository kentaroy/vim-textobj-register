" textobj-register - Text objects for unnamed register

if exists('g:loaded_textobj_register')
    finish
endif

call textobj#user#plugin('register', {
\       '-': {
\           'select-a': 'ar', 'select-a-function': 'textobj#register#select_a',
\           'select-i': 'ir', 'select-i-function': 'textobj#register#select_i',
\       },
\   })

let g:loaded_textobj_register = 1
