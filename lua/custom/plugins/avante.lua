return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  opts = {
    provider = 'groq', -- "claude" or "openai" or "azure" or "deepseek" or "groq"
    windows = {
      width = 40,
    },
  },
  build = 'make',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'grapp-dev/nui-components.nvim',
      dependencies = {
        'MunifTanjim/nui.nvim',
      },
    },
    'nvim-lua/plenary.nvim',
    { -- Optional
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
}
