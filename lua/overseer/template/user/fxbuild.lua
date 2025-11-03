return {
  name = "fx build",
  builder = function()
    return {
      cmd = "fx build",
      components = {
        { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        "default",
      },
    }
  end,
}
