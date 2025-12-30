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

    -- Set the wrap limit to 72 characters
    vim.opt_local.textwidth = 72

    -- Enable automatic wrapping:
    -- t: auto-wrap text using textwidth
    -- c: auto-wrap comments (usually applies if there are comment chars)
    -- r: continue comments after Enter
    -- q: allow formatting of comments with "gq"
    -- n: recognize numbered lists
    -- j: remove comment leader when joining lines
    vim.opt_local.formatoptions:append("tcrqnj")

    -- Optional: enable spell checking for commit messages
    vim.opt_local.spell = true
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
