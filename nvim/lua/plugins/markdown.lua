vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }
require('render-markdown').setup {}

vim.keymap.set("n", "<leader>h", function()
  local line = vim.api.nvim_get_current_line()

  -- Toggle unchecked -> checked
  if line:find("^%s*%- %[%s%]") then
    line = line:gsub("%[%s%]", "[x]", 1)

  -- Toggle checked -> unchecked
  elseif line:find("^%s*%- %[x%]") then
    line = line:gsub("%[x%]", "[ ]", 1)

  -- No checkbox: prepend one after indentation
  else
    local indent = line:match("^(%s*)")
    local text = line:sub(#indent + 1)
    line = indent .. "- [ ] " .. text
  end

  vim.api.nvim_set_current_line(line)
end, { desc = "Insert/toggle Markdown checkbox" })
