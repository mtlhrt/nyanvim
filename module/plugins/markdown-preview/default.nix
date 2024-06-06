{
  plugins.markdown-preview.enable = true;
  extraConfigLua = ''
    vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
      pattern = {"*.md"},
      callback = function ()
        vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<cr>")
      end
    })
  '';
}
