-- info que aparece em hover em outra tab caso queira
function Show_lsp_hover_in_new_tab()
	local params = vim.lsp.util.make_position_params()

	vim.lsp.buf_request(0, 'textDocument/hover', params, function(_, result, _, _)
		if not (result and result.contents) then
			print("No hover information available")
			return
		end

		local hover_content = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
		hover_content = vim.lsp.util.trim_empty_lines(hover_content)

		local buf = vim.api.nvim_create_buf(false, true)

		vim.api.nvim_buf_set_option(buf, 'modifiable', true)
		vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
		-- vim.api.nvim_set_option_value('modifiable', true,  {buf = buf})
		-- vim.api.nvim_set_option_value('buftype', 'nofile',  {buf = buf})

		vim.api.nvim_buf_set_lines(buf, 0, -1, false, hover_content)

		vim.cmd("tabnew")
		vim.api.nvim_set_current_buf(buf)
	end)
end

function Toggle_autocomplete()
	local cmp = require('cmp')
	local current_setting = cmp.get_config().completion.autocomplete
	if current_setting and #current_setting > 0 then
		cmp.setup({ completion = { autocomplete = false } })
		vim.notify('Autocomplete disabled')
	else
		cmp.setup({ completion = { autocomplete = { cmp.TriggerEvent.TextChanged } } })
		vim.notify('Autocomplete enabled')
	end
end

Diagnostic_state = true

function Toggle_diagnostics()
	Diagnostic_state = not Diagnostic_state
	if Diagnostic_state then
		vim.diagnostic.enable()
		print("Diagnostics enabled")
	else
		vim.diagnostic.enable(false)
		print("Diagnostics disabled")
	end
end

vim.keymap.set({ 'n' }, 'gr', ":lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
vim.keymap.set({ 'n' }, 'gd', ":tab split | lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.keymap.set({ 'n' }, 'gD', ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<A-k>', ":lua Show_lsp_hover_in_new_tab()<CR>", { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<A-t>', Toggle_autocomplete, { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<A-d>', Toggle_diagnostics, { noremap = true, silent = true })
vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<C-r>', vim.lsp.buf.rename, { noremap = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<A-l>', vim.lsp.buf.format, { noremap = true, silent = true })
