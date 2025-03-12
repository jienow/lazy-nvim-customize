return {
  {
    "akinsho/toggleterm.nvim",
    -- config = true,
    -- cmd = "ToggleTerm",
    -- build = ":ToggleTerm",
    -- keys = { { "<c-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" } },
    opts = {
      size = 10,
      open_mapping = [[|]],
      start_in_insert = true,
      direction = "float",
      shell = "pwsh.exe",
      float_opts = {
        border = "curved",
        width = math.ceil(vim.o.columns * 0.8),
        height = math.ceil(vim.o.columns * 0.2),
      },
    },
  },
}
