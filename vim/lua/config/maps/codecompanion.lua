require("config.helpers")

-- Expand 'cc' into 'CodeCompanion' in the command line
Map({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>")

-- Toggle Copilot suggestion
Map({ "n", "v" }, "<LocalLeader>c", "<cmd>Copilot suggestion toggle_auto_trigger<cr>")
