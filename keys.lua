--  ____________________________________
-- | [_] [_] [_] [_] [_] [_] [_] [][][] |
-- | [__][][][][][][][][][][___] [][][] | keybinds/keyboard shortcuts
-- | [___][][][][][][][][][____]        | what is even a mouse anymore?
-- | [__][][][][][][][][][][___]   []   | i honestly don't know.
-- | [_][_][_][_______][][][___] [][][] |
-- \____________________________________/

-- main libraries
local awf = require('awful')
local grs = require('gears')
local swt = require('awesome-switcher')
local vrs = require('vars')
-- since most of the keys are case sensitive, let's lowercase them down for easy usage
local modKey = "Mod4"
local altKey = "Mod1"
local ctrl = "Control"
local shift = "Shift"
local term = "urxvt"
--   _________
-- //  __  _  \\ (there was an attempt² trying to make a globe)
-- || /  /\_/ || global keys. most of the average use keys
-- || \_/  __ || are on this section.
-- ||     /_/ ||
-- \\_________//
glkeys = grs.table.join (
  awf.key({modKey, shift}, "Up",
    awf.client.swap.bydirection("up"),
    {description = "swap positions according to direction given [up]", group = "window"}
  ),
  awf.key({modKey, shift}, "Left",
    awf.client.swap.bydirection("left"),
    {description = "swap positions according to direction given [left]", group = "window"}
  ),
  awf.key({modKey, shift}, "Down",
    awf.client.swap.bydirection("down"),
    {description = "swap positions according to direction given [down]", group = "window"}
  ),
  awf.key({modKey, shift}, "Right",
    awf.client.swap.bydirection("right"),
    {description = "swap positions according to direction given [right]", group = "window"}
  ),
  awf.key({altKey}, "Tab",
    swt.switch( 1, "Mod1", "Alt_L", "Shift", "Tab"),
    {description = "window switcher", group = "window"}
  ),
  awf.key({modKey}, "Return",
    awf.spawn(term),
    {description = "open a terminal", group = "launcher"}
  ),
  awf.key({modKey, shift}, "D",
    awf.spawn(rofi),
    {description = "run prompt (xdg mode)", group = "launcher"}
  ),
  awf.key({modKey}, "D",
    awf.spawn(rofiRun),
    {description = "run prompt", group = "launcher"}
  ),
  awf.key({modKey, shift}, "E",
    awf.spawn(rofiEmoji),
    {description = "emoji prompt", group = "launcher"}
  )
)
for i = 1, 9 do
  glkeys = grs.table.join(globalkeys,
                          awf.key({modKey}, "#" .. i + 9,
                            function()
                              local scr = awf.screen.focused()
                              local tag = scr.tags[i]
                              if tag then
                                tag:view_only()
                              end
                            end,
                            {description = "view tag", group = "tag"}
                          ),
                          awf.key({ modKey, "Shift" }, "#" .. i + 9,
                            function ()
                              if client.focus then
                                local tag = client.focus.screen.tags[i]
                                if tag then
                                  client.focus:move_to_tag(tag)
                                end
                              end
                            end,
                            {description = "move focused client to tag #"..i, group = "tag"}
                          )
  )
end
clbuttons = grs.table.join(
    awf.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awf.button({ modKey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
          if c.maximized == true then   c.maximized = false end
        awf.mouse.client.move(c)
    end),
    awf.button({ modKey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awf.mouse.client.resize(c)
    end)
)