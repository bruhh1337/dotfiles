return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<C-e>"] = { "hide", "fallback" },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },
    signatrue = {
      enabled = true,
      window = {
        show_documentation = false,
      }
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      trigger = {
        show_on_insert_on_trigger_character = false,
        show_on_accept_on_trigger_character = false,
        show_on_blocked_trigger_character = { "{", "(", ")", "}" },
      },
      documentation = { auto_show = true, auto_show_delay_ms = 0 },
      menu = {
        auto_show = true,
        scrollbar = false,
        draw = {
          columns = {
            { "kind_icon" },
            { "label",             "label_description", gap = 1 },
            { "kind",              gap = 1 },
            { "label_description", gap = 1 },
            { "source_name",       gap = 1 },
          },
          components = {
            kind_icon = {
              ellipsis = false,
              width = { fill = true },
              text = function(ctx)
                local kind_icons = {
                  Function = "λ", -- Lambda symbol for functions
                  Method = "∂", -- Lambda symbol for methods
                  Field = "󰀫", -- Lambda symbol for methods
                  Variable = "󰀫", -- Lambda symbol for methods
                  Property = "󰀫", -- Lambda symbol for methods
                  Keyword = "k", -- Lambda symbol for methods
                  Struct = "Π", -- Lambda symbol for methods
                  Enum = "τ", -- Lambda symbol for methods
                  EnumMember = "τ", -- Lambda symbol for methods
                  Snippet = "⊂",
                  Text = "τ",
                  Module = "⌠",
                  Constructor = "∑",
                }

                local icon = kind_icons[ctx.kind]
                if icon == nil then
                  icon = ctx.kind_icon
                end
                return icon
              end,
            },
          },
        },
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
}
