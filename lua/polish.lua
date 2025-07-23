function BrunoAutoCmd()
  local wkl = require "which-key"
  local fileTy = vim.api.nvim_buf_get_option(0, "filetype")

  if fileTy == "gitrebase" then
    wkl.add({
      {"R", "^dwireword <ESC>", desc = "Reword" },
      {"E", "^dwiedit <ESC>", desc = "Edit" },
      {"B", "Obreak<ESC>", desc = "Break" },
    })
  elseif fileTy == "gitcommit" then
    vim.opt.colorcolumn = { "51", "73" }
  end
end

vim.cmd "autocmd FileType * lua BrunoAutoCmd()"
