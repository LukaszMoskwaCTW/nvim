local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

local error_notifier = {
  show = function(opts)
    -- use opts.title and opts.body
  end,
  hide = function()
    -- hide the error when it's been resolved
  end,
}


format_on_save.setup({
  error_notifier = error_notifier,
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    css = formatters.lsp,
    html = formatters.lsp,
    java = formatters.lsp,
    javascript = formatters.lsp,
    json = formatters.lsp,
    lua = formatters.lsp,
    markdown = formatters.prettierd,
    openscad = formatters.lsp,
    python = formatters.black,
    rust = formatters.lsp,
    scad = formatters.lsp,
    scss = formatters.lsp,
    sh = formatters.shfmt,
    terraform = formatters.lsp,
    typescript = formatters.prettierd,
    typescriptreact = formatters.prettierd,
    -- vue = formatters.prettierd,
    yaml = formatters.lsp,
    dockerfile = formatters.docker,
    go = formatters.lsp

    -- Add your own shell formatters:
    -- vue = formatters.shell({
    --   cmd = {
    --     'prettier',
    --     '--config $(prettier --find-config-path %) --write',
    --     "%"
    --   }
    -- })


  },


})
