vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitrebase" },
  callback = function()
    local wkl = require "which-key"
    wkl.add({
      {"R", "^dwireword <ESC>", desc = "Reword" },
      {"E", "^dwiedit <ESC>", desc = "Edit" },
      {"B", "Obreak<ESC>", desc = "Break" },
    })
  end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit" , "jjdescription" },
  callback = function()
    vim.opt.colorcolumn = { "51", "73" }
  end
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.jjdescription" },
    callback = function()
        -- This name must match the 'filetype' from Step 1
        vim.bo.filetype = "jjdescription"
    end,
})

vim.filetype.add({
  extension = {
    jjdescription = "jjdescription",
  },
})
