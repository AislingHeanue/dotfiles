vim.keymap.set({ 'n' }, '<leader>d', function() vim.cmd.RustLsp('renderDiagnostic') end,
	{ silent = true, desc = 'Show highlighted Rust [D]iagnostics' })
