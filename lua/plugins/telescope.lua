return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader><leader>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>bb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        local function git_diff_files()
            local cmd = "git diff --name-only develop"
            local result = vim.fn.systemlist(cmd)
            local files = {}
            for _, line in ipairs(result) do
                table.insert(files, line)
            end
            require('telescope.builtin').find_files({
                prompt_title = 'Git Diff Files',
                cwd = vim.fn.getcwd(),
                search_dirs = files,
            })
        end
        vim.keymap.set('n', '<leader>pd', git_diff_files, {})
    end
}
