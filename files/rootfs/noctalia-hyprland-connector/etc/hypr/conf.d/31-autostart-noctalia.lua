-- THIS FILE SHOULD NOT BE MODIFIED
-- All user settings should go to ~/.config/hypr/conf.d/*.lua

-- Basic Hyprland config
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
   hl.exec_cmd("noctalia")
   hl.exec_cmd("sh -c 'until noctalia msg plugins enable nzlov/daily-wallpaper; do sleep 1; done'")
end)
