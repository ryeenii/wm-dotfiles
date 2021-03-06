--      ______           ________________________________________
--     /      \        //                                        \\
--    /        \       ||   ***reenii's main awesome config***   ||
--  __| __  __ |__     ||  "aka most readable and fun WM that i  ||
-- /  \/  \/  \/  \    ||ever used so far. qtile doesn't counts."||
-- \__/\__/\__/\__/    \\________________________________________//
--    |  .   . |       || done in XX/XX/XXXX on a Lenovo G40-80  ||
--    \________/       //----------------------------------------\\
--       |  |          ||  huge thanks to everyone that helped   ||
--      /    \         || me while i was making in this project! ||
--     |      |        \\________________________________________//


-- section 1                     ||
-- default configs and libraries ||
-- ______________________________//

-- easy-to-access variables
local vrs = require('vars')
-- default awesome libraries
local nty = require('naughty')
local btf = require('beautiful')
-- helpful functions
local fct = require('functions')

-- section 2 ||
-- signals   ||
-- __________//

btf.init(vrs.themeDir .. "theme.lua")
nty.connect_signal("request::display_error", startup_error)
client.connect_signal("manage", sig_manage)

-- section 3     ||
-- load the rest ||
-- ______________//

local layout = require('layout')
local keys = require('keys')
local widgets = require('widgets')
