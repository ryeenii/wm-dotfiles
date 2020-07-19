--
--      ______
--     /      \
--    /        \
--  __| __  __ |__
-- /  \/  \/  \/  \ helpful functions!
-- \__/\__/\__/\__/ all the good stuff from beautiful
--    |  ^  ^  |    amongst some extra stuff is located here.
--    \________/
--       |  |
--      /    \
--     |      |
local btf = require('beautiful')
local grs = require('gears')

function set_wallpaper(s)
  if btf.wallpaper then
    if type(btf.wallpaper) == "function" then
      wp = btf.wallpaper(s)
    end
    gears.wallpaper.maximized(btf.wallpaper, s, true)
  end
end

function startup_error(m, s)
  local nty = require('naughty')
  nty.notification {
		 urgency = "critical",
		 title   = "oh hey, an error happened"..(s and " during startup. you might want to have a look." or ". you might want to have a look."),
		 message = m
  }
end

function sig_manage(c)
    client.focus = c
    c:raise()
end
