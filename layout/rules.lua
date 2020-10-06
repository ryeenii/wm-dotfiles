local awf = require("awful")
local rld = require("ruled")
local btf = require("beautiful")
local kys = require("keys")
rld.client.append_rule = {
    {
        rule = { },
        properties = {
            border_width = btf.border_width,
            border_color = btf.border_color,
            focus = awf.client.focus.filter,
            raise = true,
            keys = clkeys,
            buttons = clbuttons,
            screen = awf.screen.focused,
            placement = awf.placement.no_overlap+awf.placement.no_offscreen
        }
    },
    {
        rule_any = {
            instance = {"copyq","floating_terminal","Devtools", "MultiMC", "steam"},
            class = {"Gpick","Lxappearance","Nm-connection-editor","File-roller","fst"},
            role = {"AlarmWindow","pop-up","GtkFileChooserDialog","conversation"},
            type = {"dialog"}
        },
        properties = { floating = true }
    }
}
