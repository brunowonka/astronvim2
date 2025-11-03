return {
  name = "fx clippy",
  builder = function()
    return {
      cmd = "fx",
      args = { "clippy", "//src/connectivity/network/netstack3:bin" },
      components = {
        { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        "default",
      },
    }
  end,
}
