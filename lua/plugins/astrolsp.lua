-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

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
      timeout_ms = 5000,
    },
    servers = { "gdscript", "gdshader_lsp" },
    ---@diagnostic disable: missing-fields
    config = {
      html = {
        filetypes = { "html", "htmldjango" },
      },
      qmlls = {
        cmd = { "qmlls", "-E" },
        filetypes = { "qml", "qtquick" },
        root_dir = require("lspconfig.util").root_pattern("qmlls.ini", ".git", "."),
      },
      vtsls = {
        on_attach = function(client, bufnr)
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
          typescript = {
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
