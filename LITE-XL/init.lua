-- Modified init.lua config file
-- https://github.com/partiallywritten/configs-and-guides/tree/main/LITE-XL

local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

-- change these if needed
local user_font = "/home/hirusha/.local/share/fonts/Fira_Code/FiraCode-Medium.ttf"


-- configs
config.fps = 30 
config.transitions = false

-- font stuff
style.font = renderer.font.load(user_font, 12, { antialiasing = "grayscale", hinting = "slight" })
style.code_font = style.font

-- launch in an acceptable window
system.set_window_mode("fullscreen")


------------------------------ Themes ----------------------------------------

-- light theme:
core.reload_module("colors.tokyo-night")

--------------------------- Key bindings -------------------------------------

-- key unbinds to avoid conflicits
keymap.unbind("ctrl+shift+p", "core:find-command")

-- key bindings:
keymap.add { ["ctrl+t"] = "terminal:swap-drawer" }
keymap.add { ["ctrl+shift+t"] = "terminal:open-tab" }
keymap.add { ["ctrl+q"] = "core:find-command" }


------------------------------ Plugins ----------------------------------------

-- disable plugin loading setting config entries:

-- disable plugin detectindent, otherwise it is enabled by default:
-- config.plugins.detectindent = false

---------------------------- Miscellaneous -------------------------------------

-- modify list of files to ignore when indexing the project:
config.ignore_files = {
   -- folders
   "^%.svn/",        "^%.git/",   "^%.hg/",        "^CVS/", "^%.Trash/", "^%.Trash%-.*/",
   "^node_modules/", "^%.cache/", "^__pycache__/",
   -- files
   "%.pyc$",         "%.pyo$",       "%.exe$",        "%.dll$",   "%.obj$", "%.o$",
   "%.a$",           "%.lib$",       "%.so$",         "%.dylib$", "%.ncb$", "%.sdf$",
   "%.suo$",         "%.pdb$",       "%.idb$",        "%.class$", "%.psd$", "%.db$",
   "^desktop%.ini$", "^%.DS_Store$", "^%.directory$",
}
