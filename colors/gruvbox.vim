" gruvbox.vim - Gruvbox colorscheme for Vim
" Maintainer: Romain Augier <contact@romainaugier.com>
" License: MIT
" Version: 1.0

" Initialization {{{
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "gruvbox"

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif
" }}}

" Configuration {{{
if !exists('g:gruvbox_bold')
  let g:gruvbox_bold = 1
endif

if !exists('g:gruvbox_italic')
  let g:gruvbox_italic = 1
endif

if !exists('g:gruvbox_underline')
  let g:gruvbox_underline = 1
endif

if !exists('g:gruvbox_undercurl')
  let g:gruvbox_undercurl = 1
endif

if !exists('g:gruvbox_strikethrough')
  let g:gruvbox_strikethrough = 1
endif

if !exists('g:gruvbox_inverse')
  let g:gruvbox_inverse = 1
endif

if !exists('g:gruvbox_contrast_dark')
  let g:gruvbox_contrast_dark = 'medium'
endif

if !exists('g:gruvbox_contrast_light')
  let g:gruvbox_contrast_light = 'medium'
endif

if !exists('g:gruvbox_invert_selection')
  let g:gruvbox_invert_selection = 0
endif

if !exists('g:gruvbox_invert_signs')
  let g:gruvbox_invert_signs = 0
endif

if !exists('g:gruvbox_invert_tabline')
  let g:gruvbox_invert_tabline = 0
endif

if !exists('g:gruvbox_transparent_mode')
  let g:gruvbox_transparent_mode = 0
endif

if !exists('g:gruvbox_italic_comments')
  let g:gruvbox_italic_comments = 1
endif

if !exists('g:gruvbox_italic_strings')
  let g:gruvbox_italic_strings = 1
endif

if !exists('g:gruvbox_italic_operators')
  let g:gruvbox_italic_operators = 0
endif
" }}}

" Palette {{{
let s:gb = {}

" Dark colors
let s:gb.dark0_hard = '#1d2021'
let s:gb.dark0 = '#282828'
let s:gb.dark0_soft = '#32302f'
let s:gb.dark1 = '#3c3836'
let s:gb.dark2 = '#504945'
let s:gb.dark3 = '#665c54'
let s:gb.dark4 = '#7c6f64'

" Light colors
let s:gb.light0_hard = '#f9f5d7'
let s:gb.light0 = '#fbf1c7'
let s:gb.light0_soft = '#f2e5bc'
let s:gb.light1 = '#ebdbb2'
let s:gb.light2 = '#d5c4a1'
let s:gb.light3 = '#bdae93'
let s:gb.light4 = '#a89984'

" Bright colors
let s:gb.bright_red = '#fb4934'
let s:gb.bright_green = '#b8bb26'
let s:gb.bright_yellow = '#fabd2f'
let s:gb.bright_blue = '#83a598'
let s:gb.bright_purple = '#d3869b'
let s:gb.bright_aqua = '#8ec07c'
let s:gb.bright_orange = '#fe8019'

" Neutral colors
let s:gb.neutral_red = '#cc241d'
let s:gb.neutral_green = '#98971a'
let s:gb.neutral_yellow = '#d79921'
let s:gb.neutral_blue = '#458588'
let s:gb.neutral_purple = '#b16286'
let s:gb.neutral_aqua = '#689d6a'
let s:gb.neutral_orange = '#d65d0e'

" Faded colors
let s:gb.faded_red = '#9d0006'
let s:gb.faded_green = '#79740e'
let s:gb.faded_yellow = '#b57614'
let s:gb.faded_blue = '#076678'
let s:gb.faded_purple = '#8f3f71'
let s:gb.faded_aqua = '#427b58'
let s:gb.faded_orange = '#af3a03'

let s:gb.gray = '#928374'
" }}}

" Setup Colors {{{
function! s:GetColors()
  let l:colors = {}

  if &background == 'dark'
    " Dark mode colors with contrast
    if g:gruvbox_contrast_dark == 'soft'
      let l:colors.bg0 = s:gb.dark0_soft
    elseif g:gruvbox_contrast_dark == 'hard'
      let l:colors.bg0 = s:gb.dark0_hard
    else
      let l:colors.bg0 = s:gb.dark0
    endif

    let l:colors.bg1 = s:gb.dark1
    let l:colors.bg2 = s:gb.dark2
    let l:colors.bg3 = s:gb.dark3
    let l:colors.bg4 = s:gb.dark4
    let l:colors.fg0 = s:gb.light0
    let l:colors.fg1 = s:gb.light1
    let l:colors.fg2 = s:gb.light2
    let l:colors.fg3 = s:gb.light3
    let l:colors.fg4 = s:gb.light4
    let l:colors.red = s:gb.bright_red
    let l:colors.green = s:gb.bright_green
    let l:colors.yellow = s:gb.bright_yellow
    let l:colors.blue = s:gb.bright_blue
    let l:colors.purple = s:gb.bright_purple
    let l:colors.aqua = s:gb.bright_aqua
    let l:colors.orange = s:gb.bright_orange
  else
    " Light mode colors with contrast
    if g:gruvbox_contrast_light == 'soft'
      let l:colors.bg0 = s:gb.light0_soft
    elseif g:gruvbox_contrast_light == 'hard'
      let l:colors.bg0 = s:gb.light0_hard
    else
      let l:colors.bg0 = s:gb.light0
    endif

    let l:colors.bg1 = s:gb.light1
    let l:colors.bg2 = s:gb.light2
    let l:colors.bg3 = s:gb.light3
    let l:colors.bg4 = s:gb.light4
    let l:colors.fg0 = s:gb.dark0
    let l:colors.fg1 = s:gb.dark1
    let l:colors.fg2 = s:gb.dark2
    let l:colors.fg3 = s:gb.dark3
    let l:colors.fg4 = s:gb.dark4
    let l:colors.red = s:gb.faded_red
    let l:colors.green = s:gb.faded_green
    let l:colors.yellow = s:gb.faded_yellow
    let l:colors.blue = s:gb.faded_blue
    let l:colors.purple = s:gb.faded_purple
    let l:colors.aqua = s:gb.faded_aqua
    let l:colors.orange = s:gb.faded_orange
  endif

  let l:colors.neutral_red = s:gb.neutral_red
  let l:colors.neutral_green = s:gb.neutral_green
  let l:colors.neutral_yellow = s:gb.neutral_yellow
  let l:colors.neutral_blue = s:gb.neutral_blue
  let l:colors.neutral_purple = s:gb.neutral_purple
  let l:colors.neutral_aqua = s:gb.neutral_aqua
  let l:colors.gray = s:gb.gray

  return l:colors
endfunction

let s:colors = s:GetColors()
" }}}

" Color Mapping {{{
" Map hex colors to terminal color numbers
let s:cterm_colors = {
  \ '#1d2021': '234', '#282828': '235', '#32302f': '236',
  \ '#3c3836': '237', '#504945': '239', '#665c54': '241',
  \ '#7c6f64': '243', '#f9f5d7': '230', '#fbf1c7': '229',
  \ '#f2e5bc': '228', '#ebdbb2': '223', '#d5c4a1': '250',
  \ '#bdae93': '248', '#a89984': '246', '#fb4934': '167',
  \ '#b8bb26': '142', '#fabd2f': '214', '#83a598': '109',
  \ '#d3869b': '175', '#8ec07c': '108', '#fe8019': '208',
  \ '#cc241d': '124', '#98971a': '106', '#d79921': '172',
  \ '#458588': '66',  '#b16286': '132', '#689d6a': '72',
  \ '#d65d0e': '166', '#9d0006': '88',  '#79740e': '100',
  \ '#b57614': '136', '#076678': '24',  '#8f3f71': '96',
  \ '#427b58': '66',  '#af3a03': '130', '#928374': '245'
  \ }

function! s:GetCterm(hex)
  return get(s:cterm_colors, a:hex, 'NONE')
endfunction
" }}}

" Highlight Function {{{
function! s:HL(group, fg, bg, attr)
  let l:cmd = 'hi ' . a:group

  if !empty(a:fg)
    let l:cmd .= ' guifg=' . a:fg
    if has('gui_running') || &termguicolors
      " Only add ctermfg if not in GUI mode
    else
      let l:cmd .= ' ctermfg=' . s:GetCterm(a:fg)
    endif
  endif

  if !empty(a:bg)
    if g:gruvbox_transparent_mode && (a:bg == s:colors.bg0 || a:bg == s:colors.bg1)
      let l:cmd .= ' guibg=NONE ctermbg=NONE'
    else
      let l:cmd .= ' guibg=' . a:bg
      if has('gui_running') || &termguicolors
        " Only add ctermbg if not in GUI mode
      else
        let l:cmd .= ' ctermbg=' . s:GetCterm(a:bg)
      endif
    endif
  endif

  if !empty(a:attr)
    let l:cmd .= ' gui=' . a:attr . ' cterm=' . a:attr
  endif

  execute l:cmd
endfunction
" }}}

" Highlights {{{

" UI Elements
call s:HL('Normal', s:colors.fg1, g:gruvbox_transparent_mode ? '' : s:colors.bg0, '')
call s:HL('NormalFloat', s:colors.fg1, g:gruvbox_transparent_mode ? '' : s:colors.bg1, '')
call s:HL('CursorLine', '', s:colors.bg1, '')
call s:HL('CursorColumn', '', s:colors.bg1, '')
call s:HL('ColorColumn', '', s:colors.bg1, '')
call s:HL('Conceal', s:colors.blue, '', '')
call s:HL('CursorLineNr', s:colors.yellow, s:colors.bg1, '')
call s:HL('LineNr', s:colors.bg4, '', '')
call s:HL('SignColumn', '', g:gruvbox_transparent_mode ? '' : s:colors.bg1, '')
call s:HL('Folded', s:colors.gray, s:colors.bg1, g:gruvbox_italic_comments ? 'italic' : '')
call s:HL('FoldColumn', s:colors.gray, g:gruvbox_transparent_mode ? '' : s:colors.bg1, '')
call s:HL('MatchParen', '', s:colors.bg3, g:gruvbox_bold ? 'bold' : '')
call s:HL('Visual', '', s:colors.bg3, g:gruvbox_invert_selection ? 'inverse' : '')
call s:HL('Search', s:colors.yellow, s:colors.bg0, g:gruvbox_inverse ? 'inverse' : '')
call s:HL('IncSearch', s:colors.orange, s:colors.bg0, g:gruvbox_inverse ? 'inverse' : '')
call s:HL('StatusLine', s:colors.fg1, s:colors.bg2, '')
call s:HL('StatusLineNC', s:colors.fg4, s:colors.bg1, '')
call s:HL('VertSplit', s:colors.bg3, g:gruvbox_transparent_mode ? '' : s:colors.bg0, '')
call s:HL('WildMenu', s:colors.blue, s:colors.bg2, g:gruvbox_bold ? 'bold' : '')
call s:HL('Directory', s:colors.green, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('Title', s:colors.green, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('ErrorMsg', s:colors.bg0, s:colors.red, g:gruvbox_bold ? 'bold' : '')
call s:HL('MoreMsg', s:colors.yellow, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('ModeMsg', s:colors.yellow, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('Question', s:colors.orange, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('WarningMsg', s:colors.red, '', g:gruvbox_bold ? 'bold' : '')

" Pmenu
call s:HL('Pmenu', s:colors.fg1, s:colors.bg2, '')
call s:HL('PmenuSel', s:colors.bg2, s:colors.blue, g:gruvbox_bold ? 'bold' : '')
call s:HL('PmenuSbar', '', s:colors.bg2, '')
call s:HL('PmenuThumb', '', s:colors.bg4, '')

" TabLine
call s:HL('TabLineFill', s:colors.bg4, s:colors.bg1, g:gruvbox_invert_tabline ? 'inverse' : '')
call s:HL('TabLineSel', s:colors.green, s:colors.bg1, g:gruvbox_invert_tabline ? 'inverse' : '')
call s:HL('TabLine', s:colors.bg4, s:colors.bg1, g:gruvbox_invert_tabline ? 'inverse' : '')

" Syntax
call s:HL('Comment', s:colors.gray, '', g:gruvbox_italic_comments ? 'italic' : '')
call s:HL('Todo', s:colors.bg0, s:colors.yellow, g:gruvbox_bold ? 'bold' : '')
call s:HL('Error', s:colors.red, '', g:gruvbox_bold && g:gruvbox_inverse ? 'bold,inverse' : g:gruvbox_bold ? 'bold' : g:gruvbox_inverse ? 'inverse' : '')
call s:HL('Statement', s:colors.red, '', '')
call s:HL('Conditional', s:colors.red, '', '')
call s:HL('Repeat', s:colors.red, '', '')
call s:HL('Label', s:colors.red, '', '')
call s:HL('Exception', s:colors.red, '', '')
call s:HL('Operator', s:colors.orange, '', g:gruvbox_italic_operators ? 'italic' : '')
call s:HL('Keyword', s:colors.red, '', '')
call s:HL('Identifier', s:colors.blue, '', '')
call s:HL('Function', s:colors.green, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('PreProc', s:colors.aqua, '', '')
call s:HL('Include', s:colors.aqua, '', '')
call s:HL('Define', s:colors.aqua, '', '')
call s:HL('Macro', s:colors.aqua, '', '')
call s:HL('PreCondit', s:colors.aqua, '', '')
call s:HL('Constant', s:colors.purple, '', '')
call s:HL('Character', s:colors.purple, '', '')
call s:HL('String', s:colors.green, '', g:gruvbox_italic_strings ? 'italic' : '')
call s:HL('Boolean', s:colors.purple, '', '')
call s:HL('Number', s:colors.purple, '', '')
call s:HL('Float', s:colors.purple, '', '')
call s:HL('Type', s:colors.yellow, '', '')
call s:HL('StorageClass', s:colors.orange, '', '')
call s:HL('Structure', s:colors.aqua, '', '')
call s:HL('Typedef', s:colors.yellow, '', '')
call s:HL('Special', s:colors.orange, '', '')
call s:HL('SpecialChar', s:colors.orange, '', '')
call s:HL('Tag', s:colors.orange, '', '')
call s:HL('Delimiter', s:colors.orange, '', '')
call s:HL('SpecialComment', s:colors.gray, '', '')
call s:HL('Debug', s:colors.red, '', '')
call s:HL('Underlined', s:colors.blue, '', g:gruvbox_underline ? 'underline' : '')
call s:HL('Ignore', '', '', '')
call s:HL('Cursor', '', '', g:gruvbox_inverse ? 'inverse' : '')

" Diff
call s:HL('DiffAdd', '', s:colors.bg1, '')
call s:HL('DiffChange', '', s:colors.bg2, '')
call s:HL('DiffDelete', '', s:colors.bg1, '')
call s:HL('DiffText', s:colors.bg0, s:colors.yellow, '')

" Spell
let s:spell_attr = g:gruvbox_undercurl ? 'undercurl' : 'underline'
exe 'hi SpellBad cterm=' . s:spell_attr . ' gui=' . s:spell_attr . ' guisp=' . s:colors.red . ' ctermfg=' . s:GetCterm(s:colors.red)
exe 'hi SpellCap cterm=' . s:spell_attr . ' gui=' . s:spell_attr . ' guisp=' . s:colors.blue . ' ctermfg=' . s:GetCterm(s:colors.blue)
exe 'hi SpellLocal cterm=' . s:spell_attr . ' gui=' . s:spell_attr . ' guisp=' . s:colors.aqua . ' ctermfg=' . s:GetCterm(s:colors.aqua)
exe 'hi SpellRare cterm=' . s:spell_attr . ' gui=' . s:spell_attr . ' guisp=' . s:colors.purple . ' ctermfg=' . s:GetCterm(s:colors.purple)

" Diagnostics
call s:HL('DiagnosticError', s:colors.red, '', '')
call s:HL('DiagnosticWarn', s:colors.yellow, '', '')
call s:HL('DiagnosticInfo', s:colors.blue, '', '')
call s:HL('DiagnosticHint', s:colors.aqua, '', '')

" Git
call s:HL('GitSignsAdd', s:colors.green, '', '')
call s:HL('GitSignsChange', s:colors.orange, '', '')
call s:HL('GitSignsDelete', s:colors.red, '', '')

" HTML
call s:HL('htmlTag', s:colors.aqua, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('htmlEndTag', s:colors.aqua, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('htmlTagName', s:colors.blue, '', '')
call s:HL('htmlArg', s:colors.orange, '', '')
call s:HL('htmlSpecialChar', s:colors.red, '', '')
call s:HL('htmlLink', s:colors.fg4, '', g:gruvbox_underline ? 'underline' : '')

" Markdown
call s:HL('markdownH1', s:colors.green, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('markdownH2', s:colors.green, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('markdownH3', s:colors.yellow, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('markdownH4', s:colors.yellow, '', g:gruvbox_bold ? 'bold' : '')
call s:HL('markdownH5', s:colors.yellow, '', '')
call s:HL('markdownH6', s:colors.yellow, '', '')
call s:HL('markdownCode', s:colors.aqua, '', '')
call s:HL('markdownCodeBlock', s:colors.aqua, '', '')
call s:HL('markdownCodeDelimiter', s:colors.aqua, '', '')
call s:HL('markdownBlockquote', s:colors.gray, '', '')
call s:HL('markdownListMarker', s:colors.gray, '', '')
call s:HL('markdownOrderedListMarker', s:colors.gray, '', '')
call s:HL('markdownRule', s:colors.gray, '', '')
call s:HL('markdownHeadingRule', s:colors.gray, '', '')
call s:HL('markdownLinkText', s:colors.gray, '', g:gruvbox_underline ? 'underline' : '')
call s:HL('markdownUrl', s:colors.purple, '', '')

" }}}

" Terminal Colors {{{
if has('nvim')
  let g:terminal_color_0 = s:colors.bg0
  let g:terminal_color_1 = s:colors.neutral_red
  let g:terminal_color_2 = s:colors.neutral_green
  let g:terminal_color_3 = s:colors.neutral_yellow
  let g:terminal_color_4 = s:colors.neutral_blue
  let g:terminal_color_5 = s:colors.neutral_purple
  let g:terminal_color_6 = s:colors.neutral_aqua
  let g:terminal_color_7 = s:colors.fg4
  let g:terminal_color_8 = s:colors.gray
  let g:terminal_color_9 = s:colors.red
  let g:terminal_color_10 = s:colors.green
  let g:terminal_color_11 = s:colors.yellow
  let g:terminal_color_12 = s:colors.blue
  let g:terminal_color_13 = s:colors.purple
  let g:terminal_color_14 = s:colors.aqua
  let g:terminal_color_15 = s:colors.fg1
elseif has('terminal')
  let g:terminal_ansi_colors = [
    \ s:colors.bg0,
    \ s:colors.neutral_red,
    \ s:colors.neutral_green,
    \ s:colors.neutral_yellow,
    \ s:colors.neutral_blue,
    \ s:colors.neutral_purple,
    \ s:colors.neutral_aqua,
    \ s:colors.fg4,
    \ s:colors.gray,
    \ s:colors.red,
    \ s:colors.green,
    \ s:colors.yellow,
    \ s:colors.blue,
    \ s:colors.purple,
    \ s:colors.aqua,
    \ s:colors.fg1
    \ ]
endif
" }}}
