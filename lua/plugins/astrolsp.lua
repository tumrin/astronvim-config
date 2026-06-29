---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      inlay_hints = true,
      signature_help = true,
    },
    formatting = {
      async = true,
    },
    servers = { "gdscript", "gdshader_lsp" },
    ---@diagnostic disable: missing-fields
    config = {
      eslint = {
        flags = {
          allow_incremental_sync = false,
          debounce_text_changes = 5000,
        },
        settings = {
          run = "onSave",
          runtime = "node",
          execArgv = "--max-old-space-size=8192",
        },
      },
      html = {
        filetypes = { "html", "htmldjango" },
      },
      qmlls = {
        cmd = { "qmlls", "-E" },
        filetypes = { "qml", "qtquick" },
        root_dir = require("lspconfig.util").root_pattern("qmlls.ini", ".git", "."),
      },
      vtsls = {
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        settings = {
          vtsls = {
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
          javascript = {
            format = { enable = false },
          },
          typescript = {
            format = { enable = false },
            tsserver = {
              maxTsServerMemory = 8192,
              nodePath = "node",
            },
          },
        },
      },
      ["rust-analyzer"] = {
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            cargo = {
              extraEnv = {
                CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev",
                RUSTFLAGS = "-Clinker=clang -Clink-arg=-fuse-ld=mold",
              },
              extraArgs = { "--profile", "rust-analyzer" },
              features = "all",
            },
            procMacro = {
              ignored = {
                leptos_macro = {
                  "server",
                },
              },
            },
          },
        },
      },
    },
    mappings = {
      n = {
        ["<leader>fs"] = {
          function() require("snacks.picker").lsp_workspace_symbols() end,
          desc = "LSP Symbols",
        },
        ["<leader>fS"] = {
          function() require("snacks.picker").lsp_symbols() end,
          desc = "Symbols",
        },
      },
    },
  },
}
