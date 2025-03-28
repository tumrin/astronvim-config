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
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
      signature_help = true,
    },
    formatting = {
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
      },
      disabled = { -- disable formatting capabilities for the listed language servers
      },
      timeout_ms = 1000, -- default format timeout
    },
    servers = { "gdscript", "gdshader_lsp" },
    ---@diagnostic disable: missing-fields
    config = {
      html = {
        filetypes = { "html", "htmldjango" },
      },
      vtsls = {
        settings = {
          typescript = {
            tsserver = {
              maxTsServerMemory = 8192,
            },
          },
          vtsls = {
            experimental = {
              completion = {
                enableServerSideFuzzyMatch = true,
              },
            },
          },
        },
      },
      rust_analyzer = {
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
    handlers = {
      gdscript = function() require("lspconfig").gdscript.setup {} end,
      gdshader_lsp = function() require("lspconfig").gdshader_lsp.setup {} end,
    },
    mappings = {
      n = {
        grr = {
          function() require("telescope.builtin").lsp_references() end,
        },
      },
    },
  },
}
