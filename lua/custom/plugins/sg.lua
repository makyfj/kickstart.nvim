return {
  'sourcegraph/sg.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', --[[ "nvim-telescope/telescope.nvim ]]
  },
  config = function(_, opts)
    require('sg').setup {
      chat = {
        default_model = 'anthropic/claude-3-5-sonnet-20240620',
      },
    }
  end,
  cmd = { 'CodyAsk', 'CodyChat', 'CodyToggle', 'CodyTask', 'CodyTaskView' },
  keys = {
    {
      '<leader>sF',
      function()
        require('sg.extensions.telescope').fuzzy_search_results()
      end,
      desc = 'sourcegraph-fuzzy-search',
    },
    { '<leader>cc', '<cmd>CodyChat<CR>', desc = 'cody-chat', mode = { 'n', 'x' } },
    {
      '<leader>cxs',
      function()
        vim.ui.input({ prompt = 'Enter your query: ' }, function(input)
          if input then
            -- Call your CodyAsk function with the input
            vim.cmd(':CodyAsk ' .. input)
          end
        end)
      end,

      desc = 'cody-ask',
      mode = { 'n', 'x', 'v' },
    },
    {
      '<leader>cd',
      function()
        vim.ui.input({ prompt = 'Enter your prompt: ' }, function(input)
          if input then
            vim.cmd(':CodyTask ' .. input)
          end
        end)
      end,
      desc = 'cody-task',
      mode = { 'n', 'x', 'v' },
    },
    { '<leader>cn', '<cmd>CodyTaskNext<CR>', desc = 'cody-task-next', mode = { 'n', 'x' } },
    { '<leader>cp', '<cmd>CodyTaskPrev<CR>', desc = 'cody-task-prev', mode = { 'n', 'x' } },
    { '<leader>ct', '<cmd>CodyToggle<CR>', desc = 'cody-toggle', mode = { 'n', 'x' } },
    { '<leader>cv', '<cmd>CodyTaskView<CR>', desc = 'cody-task-view', mode = { 'n', 'x' } },
    { '<leader>cy', '<cmd>CodyTaskAccept<CR>', desc = 'cody-task-accept', mode = { 'n', 'x' } },
    {
      '<leader>sL',
      function()
        vim.ui.input({ prompt = 'Enter your link: ' }, function(input)
          if input then
            -- Call your CodyAsk function with the input
            vim.cmd(':SourcegraphLink ' .. input)
          end
        end)
      end,
      desc = 'sourcegraph-link',
      mode = { 'n', 'x', 'v' },
    },
    { '<leader>sg', '<cmd>SourcegraphSearch<CR>', desc = 'sourcegraph-search' },
  },
}
