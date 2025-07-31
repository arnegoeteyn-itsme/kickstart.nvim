-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'sindrets/diffview.nvim',
  },
  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
  {
    'rmagatti/auto-session',
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
      -- log_level = 'debug',
    },
  },
  {
    'diepm/vim-rest-console',
    ft = 'http',
    init = function()
      -- Filetype detection

      vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead', 'BufReadPost' }, {

        pattern = '*.http',

        callback = function()
          vim.bo.syntax = 'rest'

          vim.bo.filetype = 'rest'
        end,
      })

      -- Global settings

      vim.g.vrc_trigger = '<leader>vrc'

      vim.g.vrc_curl_opts = {

        ['-L'] = '',

        ['-i'] = '',

        ['-s'] = '',

        ['-k'] = '',
      }
    end,

    config = function()
      -- Buffer-local setting: set default response content type

      vim.api.nvim_create_autocmd('FileType', {

        pattern = 'rest',

        callback = function()
          vim.b.vrc_response_default_content_type = 'application/json'
        end,
      })
    end,
  },
}
