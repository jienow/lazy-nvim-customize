-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  -- 如果存在懒按键处理器就不要创建按键映射？
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- better up/down
map({ "i", "v" }, "jk", "<esc>", { silent = true, desc = "exit insert" })

map({ "n", "v" }, "H", "^", { silent = true, desc = "line left" })
map({ "n", "v" }, "L", "$", { silent = true, desc = "line right" })
map({ "n", "v" }, "vv", "<c-v>", { silent = true, desc = "line right" })
