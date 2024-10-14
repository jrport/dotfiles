function Grep_file(open_func)
	local search_term = vim.fn.input("What to search: ")
	if search_term == "" then
		print("No file to search")
		return
	end

	local cmd = string.format("grep -R -n -i %s .", vim.fn.shellescape(search_term))

	local results = vim.fn.systemlist(cmd)

	if #results == 0 then
		print("No results for '" .. file_name .. "'")
		return
	end

	vim.ui.select(results, {
		prompt = "Select a file to open:",
		format_item = function(item)
			local file, line, content = item:match("([^:]+):(%d+):(.+)")
			return string.format("%s (line %s): %s", file, line, content)
		end,
	}, function(choice)
		local file, line = choice:match("([^:]+):(%d+):")
		print(file)
		if file and line then
			open_func(file, tonumber(line))
		end
	end)
end

function Find_file(open_func)
	local file_name = vim.fn.input("Search file: ")
	if file_name == "" then
		print("No file to search")
		return
	end

	local results = vim.fn.system(
		string.format("find . -type f -iname '*%s*'", file_name)
	)

	-- options
	local files = vim.split(results, "\n")

	-- remove empty lines
	files = vim.tbl_filter(function(file) return file ~= "" end, files)

	if #files == 0 then
		print("No results for'" .. file_name .. "'")
		return
	end

	vim.ui.select(files, {
		prompt = "Select a file to open:",
		format_item = function(item)
			return item
		end,
	}, function(choice)
		if choice == nil then
	             print("No selection")
		     return
		end
		open_func(choice)
	end)
end

function Open_file_in_new_tab()
	Find_file(
		function(choice)
			vim.cmd("tabnew " .. choice)
		end
	)
end

function Open_file_in_current_buffer()
	Find_file(
		function(choice)
			vim.cmd("edit" .. vim.fn.fnameescape(choice))
		end
	)
end

function Grep_in_cur_buffer()
	Grep_file(
		function(choice)
			vim.cmd("edit" .. vim.fn.fnameescape(choice))
		end
	)
end

function Jump_line()
	local line_number = vim.fn.input("Target line: ")
	if line_number == "" then
		print("No line to jump given")
		return
	end

	vim.cmd(line_number)
end

function Scribble_stuff()
	local path = "/tmp/"
	local filename = vim.fn.input("File name: ")

	if filename == "" then
		print("No file name given.")
		return
	end

	local file_path = path..filename
	local fd = io.open(file_path, "w")

	if fd then
		io.close(fd)
		vim.cmd("edit"..file_path)
		print("File"..file_path.." Created")
		return
	else
		print("Error on file creation")
	end
end

function HelpSelected()
	local s_start = vim.fn.getpos("'<")
	local s_end = vim.fn.getpos("'>")
	local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_start[2], false)
	local selected_text = string.sub(lines[1], s_start[3], s_end[3])
	vim.cmd("tab help "..selected_text)
end

function InsertGoErr()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_lines(0, row - 1, row, false, { "if err != nil {" })
  vim.api.nvim_buf_set_lines(0, row, row, false, { "" })
  vim.api.nvim_buf_set_lines(0, row, row, false, { "}" })
end

-- Map the function to a key combination if you want
K('n', '<A-e>', ':lua InsertGoErr()<CR>', { noremap = true, silent = true })
K('v', '<leader>h', ':lua HelpSelected()<CR>', { noremap = true, silent = true })
K("n", "<A-j>", Jump_line)
K("n", "<leader>tb", Scribble_stuff)
