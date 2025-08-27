vim.lsp.start({
    name = "jai",
    cmd = { "/Users/oliverandreasthunaes/Jails/bin/jails" },
    root_dir = vim.fn.getcwd(), -- Use PWD as project root dir.
})
