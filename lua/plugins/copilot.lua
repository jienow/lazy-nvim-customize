return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {

      suggestion = {
        enabled = true, -- 启用代码建议
        auto_trigger = true, -- 自动触发建议
        hide_during_completion = true,
        keymap = {
          accept = "<M-l>", -- 接受建议的快捷键
          next = "<M-]>", -- 下一个建议
          prev = "<M-[>", -- 上一个建议
        },
      },
      panel = { enabled = false }, -- 禁用Copilot面板
      filetypes = { markdown = true, help = true }, -- 启用特定文件类型的支持
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require("copilot_cmp")
      copilot_cmp.setup(opts)
      -- 将Copilot附加到补全源
      LazyVim.lsp.on_attach(function()
        copilot_cmp._on_insert_enter({})
      end, "copilot")
    end,
    specs = {
      {
        "hrsh7th/nvim-cmp",
        optional = true,
        opts = function(_, opts)
          table.insert(opts.sources, 1, {
            name = "copilot",
            group_index = 1,
            priority = 100,
          })
        end,
      },
    },
  },
}
