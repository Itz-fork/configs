-- Modified init.lua config file
-- https://codeberg.org/partiallywritten/configs-and-guides/src/branch/main/LITE-XL
print(">>> Running @partiallywritten's init.lua")

local core = require "core"
local keymap = require "core.keymap"
local config = require "core.config"
local style = require "core.style"

-- helper function
--    func_def: lua function
--    func_args: expected function arguments in a table
--    default: default function arguments in a table that are guaranteed to work
local function safe_change(func_def, func_args, default_args)
   local success, result = pcall(func_def, table.unpack(func_args))
   if success then
      return result
   else
      core.log("Safe Change Error: " .. result)
      return func_def(table.unpack(default_args))
   end
end


-- configs
config.fps = 30 
config.transitions = false

-- font stuff
local user_font = "/home/hirusha/.local/share/fonts/Fira_Code/FiraCode-Medium.ttf"
style.font = safe_change(
      renderer.font.load,
      {user_font, 12, { antialiasing = "grayscale", hinting = "slight" } },
      {DATADIR .. "/fonts/FiraSans-Regular.ttf", 12, { antialiasing = "grayscale", hinting = "slight" } }
   )
style.code_font = style.font

-- launch in an acceptable window
system.set_window_mode("fullscreen")


------------------------------ Themes ----------------------------------------

safe_change(
   core.reload_module,
   { "colors.tokyo-night" },
   { "colors.summer" }
)

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
