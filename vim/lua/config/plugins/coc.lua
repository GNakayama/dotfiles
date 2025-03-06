-- https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.lua

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.opt.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- COC configuration
-- Function to check backspace for tab completion
_G.check_backspace = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Tab completion
vim.keymap.set('i', '<TAB>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#next'](1)
  elseif _G.check_backspace() then
    return '<TAB>'
  else
    return vim.fn['coc#refresh']()
  end
end, {silent = true, noremap = true, expr = true})

vim.keymap.set('i', '<S-TAB>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#prev'](1)
  else
    return '<C-h>'
  end
end, {silent = true, noremap = true, expr = true})

-- Make <CR> auto-select the first completion item
vim.keymap.set('i', '<cr>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#confirm']()
  else
    return '<C-g>u<CR><c-r>=coc#on_enter()<CR>'
  end
end, {silent = true, noremap = true, expr = true})

-- Use <c-space> to trigger completion
if vim.fn.has('nvim') == 1 then
  vim.keymap.set('i', '<c-space>', vim.fn['coc#refresh'], {silent = true, expr = true})
else
  vim.keymap.set('i', '<c-@>', vim.fn['coc#refresh'], {silent = true, expr = true})
end

-- Use `[g` and `]g` to navigate diagnostics
vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})

-- GoTo code navigation
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', {silent = true})

-- Use K to show documentation in preview window
_G.show_documentation = function()
  if vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync('doHover')
  else
    vim.api.nvim_feedkeys('K', 'in', true)
  end
end

vim.keymap.set('n', 'K', ':lua show_documentation()<CR>', {silent = true})

-- Highlight the symbol and its references when holding the cursor
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.fn.CocActionAsync('highlight')
  end
})

-- Symbol renaming
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')

-- Formatting selected code
vim.keymap.set('x', '<leader>f', '<Plug>(coc-format-selected)')
vim.keymap.set('n', '<leader>f', '<Plug>(coc-format-selected)')

-- Setup formatexpr for specific filetypes
vim.api.nvim_create_augroup('CocGroup', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'CocGroup',
  pattern = {'typescript', 'json'},
  command = 'setl formatexpr=CocAction("formatSelected")'
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd('User', {
  group = 'CocGroup',
  pattern = 'CocJumpPlaceholder',
  command = 'call CocActionAsync("showSignatureHelp")'
})

-- Apply codeAction to the selected region
vim.keymap.set('x', '<leader>a', '<Plug>(coc-codeaction-selected)')
vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction-selected)')

-- Remap keys for applying codeAction to the current buffer
vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction-cursor)')
vim.keymap.set('n', '<leader>as', '<Plug>(coc-codeaction-source)')
vim.keymap.set('n', '<leader>qf', '<Plug>(coc-fix-current)')

-- Remap keys for applying refactor code actions
vim.keymap.set('n', '<leader>re', '<Plug>(coc-codeaction-refactor)', {silent = true})
vim.keymap.set('x', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', {silent = true})
vim.keymap.set('n', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', {silent = true})

-- Run the Code Lens action on the current line
vim.keymap.set('n', '<leader>cl', '<Plug>(coc-codelens-action)')

-- Map function and class text objects
vim.keymap.set('x', 'if', '<Plug>(coc-funcobj-i)')
vim.keymap.set('o', 'if', '<Plug>(coc-funcobj-i)')
vim.keymap.set('x', 'af', '<Plug>(coc-funcobj-a)')
vim.keymap.set('o', 'af', '<Plug>(coc-funcobj-a)')
vim.keymap.set('x', 'ic', '<Plug>(coc-classobj-i)')
vim.keymap.set('o', 'ic', '<Plug>(coc-classobj-i)')
vim.keymap.set('x', 'ac', '<Plug>(coc-classobj-a)')
vim.keymap.set('o', 'ac', '<Plug>(coc-classobj-a)')

-- Remap <C-f> and <C-b> to scroll float windows/popups
if vim.fn.has('nvim-0.4.0') == 1 or vim.fn.has('patch-8.2.0750') == 1 then
  vim.keymap.set('n', '<C-f>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return vim.fn['coc#float#scroll'](1)
    else
      return '<C-f>'
    end
  end, {silent = true, noremap = true, expr = true, nowait = true})
  
  vim.keymap.set('n', '<C-b>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return vim.fn['coc#float#scroll'](0)
    else
      return '<C-b>'
    end
  end, {silent = true, noremap = true, expr = true, nowait = true})
  
  vim.keymap.set('i', '<C-f>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return vim.fn['coc#float#scroll'](1)
    else
      return '<Right>'
    end
  end, {silent = true, noremap = true, expr = true, nowait = true})
  
  vim.keymap.set('i', '<C-b>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return vim.fn['coc#float#scroll'](0)
    else
      return '<Left>'
    end
  end, {silent = true, noremap = true, expr = true, nowait = true})
  
  vim.keymap.set('v', '<C-f>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return vim.fn['coc#float#scroll'](1)
    else
      return '<C-f>'
    end
  end, {silent = true, noremap = true, expr = true, nowait = true})
  
  vim.keymap.set('v', '<C-b>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return vim.fn['coc#float#scroll'](0)
    else
      return '<C-b>'
    end
  end, {silent = true, noremap = true, expr = true, nowait = true})
end

-- Use CTRL-S for selections ranges
vim.keymap.set('n', '<C-s>', '<Plug>(coc-range-select)', {silent = true})
vim.keymap.set('x', '<C-s>', '<Plug>(coc-range-select)', {silent = true})

-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command('Format', function()
  vim.fn.CocActionAsync('format')
end, {})

-- Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command('Fold', function(args)
  vim.fn.CocAction('fold', args.args)
end, {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command('OR', function()
  vim.fn.CocActionAsync('runCommand', 'editor.action.organizeImport')
end, {})

-- Add Neovim's native statusline support
vim.opt.statusline:prepend('%{coc#status()}%{get(b:,"coc_current_function","")}')

-- Mappings for CoCList
local opts = {silent = true, nowait = true}

vim.keymap.set('n', '<space>a', ':<C-u>CocList diagnostics<cr>', opts)
vim.keymap.set('n', '<space>e', ':<C-u>CocList extensions<cr>', opts)
vim.keymap.set('n', '<space>c', ':<C-u>CocList commands<cr>', opts)
vim.keymap.set('n', '<space>o', ':<C-u>CocList outline<cr>', opts)
vim.keymap.set('n', '<space>s', ':<C-u>CocList -I symbols<cr>', opts)
vim.keymap.set('n', '<space>j', ':<C-u>CocNext<CR>', opts)
vim.keymap.set('n', '<space>k', ':<C-u>CocPrev<CR>', opts)
vim.keymap.set('n', '<space>p', ':<C-u>CocListResume<CR>', opts)

