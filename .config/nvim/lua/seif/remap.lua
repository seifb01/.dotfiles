local nnoremap = require("seif.keymap").nnoremap
local inoremap = require("seif.keymap").inoremap

nnoremap("<leader>pv","<cmd>Ex<CR>")
nnoremap("<leader>wq","<cmd>wq<CR>")
nnoremap("<leader>ff","<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg","<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb","<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh","<cmd>Telescope help_tags<cr>")
nnoremap("<leader>fc","<cmd>Telescope git_commits<cr>")
nnoremap("<leader>f","<cmd>lua vim.lsp.buf.formatting()<cr>")

inoremap("(","()<left>")
inoremap("{","{}<left>")
inoremap("[","[]<left>")
inoremap("'","''<left>")
inoremap("\"","\"\"<left>")
