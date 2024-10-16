local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch("([^/]+)") do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        -- theme = "tokyonight",
        theme = "kanagawa",
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(mode)
              return mode:sub(1, 1)
            end,
          },
        },
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_y = {
          {
            function()
              local venv = get_venv("CONDA_DEFAULT_ENV") or get_venv("VIRTUAL_ENV") or "NO ENV"
              return " " .. venv
            end,
            cond = function()
              return vim.bo.filetype == "python"
            end,
          },
        },
      },
      -- tabline = {
      -- 	lualine_b = { {
      -- 		"filename",
      -- 		path = 1,
      -- 	} },
      -- },
    })
  end,
}
