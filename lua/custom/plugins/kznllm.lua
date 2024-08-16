return {
  'chottolabs/kznllm.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function(self)
    local kznllm = require 'kznllm'
    local utils = require 'kznllm.utils'
    local spec = require 'kznllm.specs.openai'
    utils.TEMPLATE_DIRECTORY = vim.fn.expand(self.dir) .. '/templates'

    local function llm_buffer()
      kznllm.invoke_llm_buffer_mode({
        system_prompt_template = spec.PROMPT_TEMPLATES.BUFFER_MODE_SYSTEM_PROMPT,
        user_prompt_template = spec.PROMPT_TEMPLATES.BUFFER_MODE_USER_PROMPT,
      }, spec.make_job)
    end

    local function llm_project()
      kznllm.invoke_llm_project_mode({
        system_prompt_template = spec.PROMPT_TEMPLATES.PROJECT_MODE_SYSTEM_PROMPT,
        user_prompt_template = spec.PROMPT_TEMPLATES.PROJECT_MODE_USER_PROMPT,
      }, spec.make_job)
    end

    local function llm_replace()
      kznllm.invoke_llm_replace_mode({
        system_prompt_template = spec.PROMPT_TEMPLATES.REPLACE_MODE_SYSTEM_PROMPT,
        user_prompt_template = spec.PROMPT_TEMPLATES.REPLACE_MODE_USER_PROMPT,
      }, spec.make_job)
    end

    vim.keymap.set({ 'n', 'v' }, '<leader>kg', llm_buffer, { desc = 'Send current selection to LLM llm_buffer' })
    vim.keymap.set({ 'n', 'v' }, '<leader>kr', llm_replace, { desc = 'Send current selection to LLM llm_replace' })
    vim.keymap.set({ 'n', 'v' }, '<leader>kp', llm_project, { desc = 'Send current selection to LLM llm_project' })
  end,
}
