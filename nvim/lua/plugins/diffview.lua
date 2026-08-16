return {
  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewFileHistory",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    -- Diffview: open the working-tree diff, browse file history, or close the view.
    -- <leader>gc replaces LazyVim's Telescope "Git Commits" mapping.
    keys = {
      { "<leader>go", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
      { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Diffview Close" },
    },
    opts = {},
  },
}
