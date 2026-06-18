{ pkgs, ... }:
{
  programs.neovim.configure.customRC = ''
    lua << EOF
      vim.opt.clipboard = "unnamedplus"
      vim.opt.cursorline = true
      vim.opt.expandtab = true
      vim.opt.mouse = "a"
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.scrolloff = 8
      vim.opt.shiftwidth = 2
      vim.opt.signcolumn = "yes"
      vim.opt.splitbelow = true
      vim.opt.splitright = true
      vim.opt.swapfile = false
      vim.opt.tabstop = 2
      vim.opt.termguicolors = true
      vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"
      vim.opt.undofile = true
      vim.opt.updatetime = 250

      vim.cmd.colorscheme("default")
      vim.g.mapleader = " "

      local builtin = require("telescope.builtin")
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("Comment").setup({})
      require("gitsigns").setup({})
      require("nvim-autopairs").setup({})
      require("which-key").setup({})

      vim.lsp.config.bashls = { cmd = { "bash-language-server" } }
      vim.lsp.config.dockerls = { cmd = { "dockerfile-language-server" } }
      vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false }
          }
        }
      }

      vim.lsp.config.nil_ls = {
        cmd = { "nil" },
        settings = {
          ["nil"] = {
            formatting = { command = { "${pkgs.nixfmt}/bin/nixfmt" } }
          }
        }
      }

      vim.lsp.config.yamlls = {
        cmd = { "yaml-language-server" },
        settings = {
          yaml = {
            schemaStore = { enable = true },
            validate = true
          }
        }
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
        end,
      })

      vim.api.nvim_create_autocmd({ "FileType", "BufEnter" }, {
        callback = function()
          local bufnr = vim.api.nvim_get_current_buf()
          local ok = pcall(vim.treesitter.get_parser, bufnr)
          if ok then
            pcall(vim.treesitter.start, bufnr)
          end
        end,
      })

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        })
      })

      require("bufferline").setup({
        options = {
          mode = "buffers",
          separator_style = "slant",
        }
      })

      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = "|",
          section_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        }
      })

      require("nvim-tree").setup({
        view = { width = 30 },
        renderer = { group_empty = true },
      })

      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git", ".cache", "result" },
        },
      })

      vim.lsp.enable({ "nil_ls", "lua_ls", "bashls", "dockerls", "yamlls" })

      vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
      vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
      vim.keymap.set("n", "<leader>dd", function() require("lazydocker").open() end, { desc = "LazyDocker" })
      vim.keymap.set("n", "<leader>dl", function() require("lazydocker").open() end, { desc = "LazyDocker logs" })
      vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "File tree" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
      vim.keymap.set("n", "<leader>gc", "<cmd>LazyGitCurrentFile<cr>", { desc = "LazyGit current file" })
      vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
      vim.keymap.set("n", "<leader>q", "<cmd>bdelete<cr>", { desc = "Close buffer" })
      vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
      vim.keymap.set("n", "<leader>x", "<cmd>xa<cr>", { desc = "Save all & quit" })
    EOF
  '';
}
