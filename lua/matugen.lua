 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#11131a',
    base01 = '#1d2026',
    base02 = '#272a31',
    base03 = '#8c909f',
    base04 = '#c2c6d5',
    base05 = '#e1e2eb',
    base06 = '#e1e2eb',
    base07 = '#e1e2eb',
    base08 = '#ffb4ab',
    base09 = '#f4aeff',
    base0A = '#b1c6f7',
    base0B = '#adc6ff',
    base0C = '#f4aeff',
    base0D = '#adc6ff',
    base0E = '#b1c6f7',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e1e2eb',          bg = '#11131a' })
  hi('TelescopeBorder',         { fg = '#8c909f',             bg = '#11131a' })
  hi('TelescopePromptNormal',   { fg = '#e1e2eb',          bg = '#11131a' })
  hi('TelescopePromptBorder',   { fg = '#8c909f',             bg = '#11131a' })
  hi('TelescopePromptPrefix',   { fg = '#adc6ff',             bg = '#11131a' })
  hi('TelescopePromptCounter',  { fg = '#c2c6d5',  bg = '#11131a' })
  hi('TelescopePromptTitle',    { fg = '#11131a',             bg = '#adc6ff' })
  hi('TelescopePreviewTitle',   { fg = '#11131a',             bg = '#b1c6f7' })
  hi('TelescopeResultsTitle',   { fg = '#11131a',             bg = '#f4aeff' })
  hi('TelescopeSelection',      { fg = '#e1e2eb',          bg = '#272a31' })
  hi('TelescopeSelectionCaret', { fg = '#adc6ff',             bg = '#272a31' })
  hi('TelescopeMatching',       { fg = '#adc6ff',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
