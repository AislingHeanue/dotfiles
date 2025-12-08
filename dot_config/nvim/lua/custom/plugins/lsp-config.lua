---@module "snacks"
return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { 'williamboman/mason.nvim', config = true }, -- Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    -- Useful status updates for LSP.
    -- `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim',       opts = {} },
    -- Allows extra capabilities provided by nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
    -- {
    --   'artemave/workspace-diagnostics.nvim',
    --   keys = {
    --     { '<leader>l', function() require('workspace-diagnostics').populate_workspace_diagnostics() end, desc = 'Lint Workspace', mode = 'n' }
    --   }
    --
    -- },
    -- 'nvim-java/nvim-java'
  },
  config = function()
    -- Brief aside: **What is LSP?**
    -- LSP is an initialism you've probably heard, but might not understand what it is.
    -- LSP stands for Language Server Protocol. It's a protocol that helps editors
    -- and language tooling communicate in a standardized fashion.
    -- In general, you have a "server" which is some tool built to understand a particular
    -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
    -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
    -- processes that communicate with some "client" - in this case, Neovim!
    -- LSP provides Neovim with features like:
    --  - Go to definition
    --  - Find references
    --  - Autocompletion
    --  - Symbol Search
    --  - and more!
    -- Thus, Language Servers are external tools that must be installed separately from
    -- Neovim. This is where `mason` and related plugins come into play.
    -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
    -- and elegantly composed help section, `:help lsp-vs-treesitter`
    --  This function gets run when an LSP attaches to a particular buffer.
    --    That is to say, every time a new file is opened that is associated with
    --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
    --    function will be executed to configure the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map('gd', function() Snacks.picker.lsp_definitions() end, '[G]oto [D]efinition')
        -- Find references for the word under your cursor.
        map('gD', function() Snacks.picker.lsp_references() end, '[G]oto References')
        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', function() Snacks.picker.lsp_implementations() end, '[G]oto [I]mplementation')
        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('gt', function() Snacks.picker.lsp_type_definitions() end, '[G]oto Type [D]efinition')
        --  Symbols are things like variables, functions, types, etc.
        map('<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, '[S]ymbols in workspace')
        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rs', vim.lsp.buf.rename, '[S]ymbol')
        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ea', vim.lsp.buf.code_action, 'Preform code [A]ction under cursor', { 'n', 'x' })
        -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        -- The following code creates a keymap to toggle inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map(
            '<leader>th',
            function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end,
            '[T]oggle Inlay [H]ints')
        end
        -- Document highlighting (ie finding and highlighting matches on text cursor hover)
        -- is covered by snacks/words.
      end,
    })

    -- LSP servers and clients are able to communicate to each other what features they support.
    --  By default, Neovim doesn't support everything that is in the LSP specification.
    --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
    --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    local servers = {
      'gopls',
      'pyright',
      'docker_compose_language_service',
      'dockerls',
      'golangci_lint_ls',
      'helm_ls',
      'sqlls',
      'terraformls',
      'bzl', -- starlark
      'jqls',
      'jdtls',
      'marksman', -- markdown
      'yamlls',
      'jsonls',
      'bashls',
      'vtsls',
      'vue_ls',
      'lua_ls',
    }
    require('mason').setup()
    local ensure_installed = servers or {}
    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    vim.list_extend(ensure_installed, {})
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    require('mason-lspconfig').setup()
    vim.lsp.config('vtsls', {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              {
                name = '@vue/typescript-plugin',
                location = "/usr/lib/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
                languages = { "vue" },
                configNamespace = 'typescript',
              }
            }
          }
        }
      },
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    })
    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Replace',
          },
          -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          diagnostics = { disable = { 'missing-fields' } },
        },
      },
    })
    vim.lsp.config('yamlls', {
      settings = {
        yaml = {
          customTags = {
            "!fn",
            "!And",
            "!If",
            "!Not",
            "!Equals",
            "!Or",
            "!FindInMap sequence",
            "!Base64",
            "!Cidr",
            "!Ref",
            "!Ref Scalar",
            "!Sub",
            "!GetAtt",
            "!GetAZs",
            "!ImportValue",
            "!Select",
            "!Split",
            "!Join sequence"
          }
        }
      }
    })
    -- require('lspconfig').golangci_lint_ls.setup({
    --   init_options = {
    --     command = { "golangci-lint", "run", "--output.json.path", "stdout", "--issues-exit-code=1", "--show-stats=false" }
    --   },
    --   on_attach = function(client, bufnr)
    --     require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
    --   end
    -- })
  end
}
