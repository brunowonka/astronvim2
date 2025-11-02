return {
  "mrcjkb/rustaceanvim",
  opts = {
    -- This 'server' table is passed directly to rust-analyzer
    server = {
      settings = {
        -- The key MUST be "rust-analyzer" (with a hyphen)
        ["rust-analyzer"] = {
          checkOnSave = false,
          completion = {
            autoimport = {
              enable = true
            }
          },
          cargo = {
            allFeatures = true,
          },
          files = {
            watcher = "server",
          },
          cachePriming = {
            enable = false,
          },
          server = {
            extraEnv = {
              CHALK_OVERFLOW_DEPTH = 2048,
            }
          },
          inlayHints = {
            type = {
              enabled = true,
            },
            parameter = {
              enabled = true,
            },
          },
        },
      },
    },
  },
}
