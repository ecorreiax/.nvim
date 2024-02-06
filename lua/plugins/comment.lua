return {
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require('Comment').setup({
                padding = true,
                toggler = {
                    ---Line-comment toggle keymap
                    line = '<leader>cl',
                },
                opleader = {
                    ---Block-comment keymap
                    block = '<leader>cc',
                },
                extra = {
                    ---Add comment on the line above
                    above = '<leader>cO',
                    ---Add comment on the line below
                    below = '<leader>co',
                    ---Add comment at the end of line
                    eol = '<leader>cA',
                },
            })
        end
    }
}
