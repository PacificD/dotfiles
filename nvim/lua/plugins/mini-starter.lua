return {
  {
    "nvim-mini/mini.starter",
    version = false,
    event = "VimEnter",
    opts = { items = {} },
    config = function(_, opts)
      local logo = table.concat({
        "██████╗░░█████╗░░█████╗░██╗███████╗██╗░█████╗░██████╗░",
        "██╔══██╗██╔══██╗██╔══██╗██║██╔════╝██║██╔══██╗██╔══██╗",
        "██████╔╝███████║██║░░╚═╝██║█████╗░░██║██║░░╚═╝██║░░██║",
        "██╔═══╝░██╔══██║██║░░██╗██║██╔══╝░░██║██║░░██╗██║░░██║",
        "██║░░░░░██║░░██║╚█████╔╝██║██║░░░░░██║╚█████╔╝██████╔╝",
      }, "\n")
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end
      local starter = require("mini.starter")

      opts.evaluate_single = true
      opts.header = logo
      opts.items = {
        new_section("Find file", LazyVim.pick(), "Telescope"),
        new_section("Recent files", LazyVim.pick("oldfiles"), "Telescope"),
        new_section("Grep text", LazyVim.pick("live_grep"), "Telescope"),
        new_section("init.lua", "e $MYVIMRC", "Config"),
        new_section("Lazy", "Lazy", "Config"),
        new_section("New file", "ene | startinsert", "Built-in"),
        new_section("Quit", "qa", "Built-in"),
        new_section("Session restore", [[lua require("persistence").load()]], "Session"),
      }
      opts.content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
      }

      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniStarterOpened",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      starter.setup(opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function(ev)
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          starter.config.footer = string.rep(" ", 8)
            .. "⚡ Neovim loaded "
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"
          if vim.bo[ev.buf].filetype == "ministarter" then
            pcall(starter.refresh)
          end
        end,
      })
    end,
  },
}
