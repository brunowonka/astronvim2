-- ~/.config/nvim/after/syntax/jjdescription.lua

-- Ensure syntax is on
vim.cmd("syntax enable")

-- Enable spellchecking if the feature is available
if vim.fn.has("spell") == 1 then
  vim.cmd("syn spell toplevel")
end

-- Highlight first line summary, and error on overflow
-- vim.cmd() is used to execute Vimscript commands.
-- We must escape the backslash in Lua strings, so \%^ becomes \\%^
vim.cmd("syn match jjDescriptionFirstLine \"^\\%^.*\" nextgroup=jjDescriptionBlank skipnl")

-- ---
-- Handle Summary Length
-- ---

-- Get the configured summary length from a global variable.
-- We can write this logic directly in Lua.
local summary_length = vim.g.jjdescription_summary_length

-- If the variable isn't set, default to 50 (like the original script)
if summary_length == nil then
  summary_length = 50
end

if summary_length < 0 then
  -- A negative value means highlight the entire line (no overflow)
  vim.cmd('syn match jjDescriptionSummary "^.*$" contained containedin=jjDescriptionFirstLine nextgroup=jjDescriptionOverflow contains=@Spell')
elseif summary_length > 0 then
  -- A positive value highlights up to the specified length.
  -- We use Lua's string concatenation (..) to build the command.
  -- The Vim regex atom \%< must be escaped as \\%< in the Lua string.
  vim.cmd(
    'syn match jjDescriptionSummary "^.*\\%<' .. (summary_length + 1) .. 'v." contained containedin=jjDescriptionFirstLine nextgroup=jjDescriptionOverflow contains=@Spell'
  )
end

-- This highlights any characters *after* the summary length limit
vim.cmd('syn match jjDescriptionOverflow ".*" contained contains=@Spell')
vim.cmd('syn match jjDescriptionComment "^JJ:.*" contains=@Spell')

-- Highlight non-empty second line as an error
-- This is triggered by `nextgroup=jjDescriptionBlank` on the first line.
-- \+ must be escaped as \\+
vim.cmd('syn match jjDescriptionBlank "^.\\+" contained contains=@Spell')

-- ---
-- Link Highlight Groups
-- ---
vim.cmd("hi def link jjDescriptionSummary Keyword")
vim.cmd("hi def link jjDescriptionBlank Error")
vim.cmd("hi def link jjDescriptionComment Comment")

-- uncomment the following if you want characters beyond length 50 to be highlighted
vim.cmd("hi def link jjDescriptionOverflow Error")
