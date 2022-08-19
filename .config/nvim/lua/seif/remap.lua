local nnoremap = require("seif.keymap").nnoremap

nnoremap("<leader>pv","<cmd>Ex<CR>")
nnoremap("<leader>wq","<cmd>wq<CR>")
nnoremap("<leader>ff","<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg","<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb","<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh","<cmd>Telescope help_tags<cr>")
nnoremap("<leader>fc","<cmd>Telescope git_commits<cr>")
