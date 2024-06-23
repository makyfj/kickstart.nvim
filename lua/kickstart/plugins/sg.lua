return {
  'sourcegraph/sg.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim', --[[ "nvim-telescope/telescope.nvim ]]
  },
  config = function(_, opts)
    require('sg').setup(opts)
  end,
}
