return {
  'makyfj/kznllm.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function(self)
    local kznllm = require 'kznllm'
    local utils = require 'kznllm.utils'
    local spec_anthropic = require 'kznllm.specs.anthropic'
    local spec_groq = require 'kznllm.specs.openai'
    utils.TEMPLATE_DIRECTORY = vim.fn.expand(self.dir) .. '/templates'

    local function llm_buffer_anthropic()
      kznllm.invoke_llm_buffer_mode({
        system_prompt_template = spec_anthropic.PROMPT_TEMPLATES.BUFFER_MODE_SYSTEM_PROMPT,
        user_prompt_template = spec_anthropic.PROMPT_TEMPLATES.BUFFER_MODE_USER_PROMPT,
      }, spec_anthropic.make_job)
    end

    local function llm_project_anthropic()
      kznllm.invoke_llm_project_mode({
        system_prompt_template = spec_anthropic.PROMPT_TEMPLATES.PROJECT_MODE_SYSTEM_PROMPT,
        user_prompt_template = spec_anthropic.PROMPT_TEMPLATES.PROJECT_MODE_USER_PROMPT,
      }, spec_anthropic.make_job)
    end

    local function llm_replace_anthropic()
      kznllm.invoke_llm_replace_mode({
        system_prompt_template = spec_anthropic.PROMPT_TEMPLATES.REPLACE_MODE_SYSTEM_PROMPT,
        user_prompt_template = spec_anthropic.PROMPT_TEMPLATES.REPLACE_MODE_USER_PROMPT,
      }, spec_anthropic.make_job)
    end

    local function llm_buffer_groq()
      kznllm.invoke_llm_buffer_mode({
        system_prompt_template = spec_groq.PROMPT_TEMPLATES.BUFFER_MODE_SYSTEM_PROMPT,
        user_prompt_template = spec_groq.PROMPT_TEMPLATES.BUFFER_MODE_USER_PROMPT,
      }, spec_groq.make_job)
    end

    local function llm_project_groq()
      kznllm.invoke_llm_project_mode({
        system_prompt_template = spec_groq.PROMPT_TEMPLATES.PROJECT_MODE_SYSTEM_PROMPT,
        user_prompt_template = spec_groq.PROMPT_TEMPLATES.PROJECT_MODE_USER_PROMPT,
      }, spec_groq.make_job)
    end

    local function llm_replace_groq()
      kznllm.invoke_llm_replace_mode({
        system_prompt_template = spec_groq.PROMPT_TEMPLATES.REPLACE_MODE_SYSTEM_PROMPT,
        user_prompt_template = spec_groq.PROMPT_TEMPLATES.REPLACE_MODE_USER_PROMPT,
      }, spec_groq.make_job)
    end

    vim.keymap.set({ 'n', 'v' }, '<leader>kab', llm_buffer_anthropic, { desc = 'Send current selection to LLM ANTHROPIC llm_buffer' })
    vim.keymap.set({ 'n', 'v' }, '<leader>kar', llm_replace_anthropic, { desc = 'Send current selection to LLM ANTHROPIC llm_replace' })
    vim.keymap.set({ 'n', 'v' }, '<leader>kap', llm_project_anthropic, { desc = 'Send current selection to LLM ANTHROPIC llm_project' })

    vim.keymap.set({ 'n', 'v' }, '<leader>kgb', llm_buffer_groq, { desc = 'Send current selection to LLM GROQ llm_buffer' })
    vim.keymap.set({ 'n', 'v' }, '<leader>kgr', llm_replace_groq, { desc = 'Send current selection to LLM GROQ llm_replace' })
    vim.keymap.set({ 'n', 'v' }, '<leader>kgp', llm_project_groq, { desc = 'Send current selection to LLM GROQ llm_project' })
  end,
}
