-- vim ui2
require('vim._core.ui2').enable({
    enable = true,
    msg = {
        target = "cmd",
        pager = { height = 0.5 },
        dialog = { height = 0.5 },
        cmd    = { height = 0.5 },
        msg   = { height = 0.5, timeout = 4500 },
    },
})

require("myconfig.core")
require("myconfig.pack")

vim.api.nvim_create_user_command("PackList", function()
  for _, plugin in ipairs(vim.pack.get()) do
    print(plugin.spec.name)
  end
end, {})
--test
