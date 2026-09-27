-- Compatibility fix for nvim-treesitter's archived "master" branch on Neovim 0.12.
--
-- Neovim 0.12 always passes query captures to predicates and directives as a
-- list of nodes (`table<integer, TSNode[]>`). The directives below, which ship
-- with nvim-treesitter master, expect a single node instead. As a result,
-- files with injected languages (markdown, html, bash, ruby, php, hcl, hurl)
-- fail with:
--
--   attempt to call method 'range' (a nil value)
--
-- This re-registers the affected directives with list-aware handlers.
-- Delete this file after switching nvim-treesitter to its "main" branch.

local query = vim.treesitter.query

---@param value TSNode|TSNode[]|nil
---@return TSNode|nil
local function first_node(value)
	if type(value) == "table" then
		return value[1]
	end
	return value
end

local html_script_type_languages = {
	["importmap"] = "json",
	["module"] = "javascript",
	["application/ecmascript"] = "javascript",
	["text/ecmascript"] = "javascript",
}

local language_aliases = {
	ex = "elixir",
	pl = "perl",
	sh = "bash",
	uxn = "uxntal",
	ts = "typescript",
}

---@param alias string
---@return string
local function language_from_info_string(alias)
	return vim.filetype.match({ filename = "a." .. alias })
		or language_aliases[alias]
		or alias
end

query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
	local node = first_node(match[pred[2]])
	if not node then
		return
	end
	local alias = vim.treesitter.get_node_text(node, bufnr):lower()
	metadata["injection.language"] = language_from_info_string(alias)
end, { force = true })

query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
	local node = first_node(match[pred[2]])
	if not node then
		return
	end
	local value = vim.treesitter.get_node_text(node, bufnr)
	local configured = html_script_type_languages[value]
	if configured then
		metadata["injection.language"] = configured
	else
		local parts = vim.split(value, "/")
		metadata["injection.language"] = parts[#parts]
	end
end, { force = true })

query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
	local id = pred[2]
	local node = first_node(match[id])
	if not node then
		return
	end
	local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
	metadata[id] = metadata[id] or {}
	metadata[id].text = text:lower()
end, { force = true })
