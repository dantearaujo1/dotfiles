-- Pull in the wezterm API
local wezterm = require 'wezterm'
local wsl_domains = wezterm.default_wsl_domains()

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Palenight (Gogh)'
config.font = wezterm.font 'JetBrains Mono'
config.default_cwd = os.getenv("HOME")
-- config.default_wsl_domains = wsl_domains

-- if wezterm.target_triple == "x86_64-pc-windows-msvc" then
--     config.default_prog = {
--         "nu"
--     }
-- end
--
-- if wezterm.target_triple == "x86_64-unknown-linux-gnu" then
--     config.default_prog = {
--         "/home/mib/.rustup/bin/nu"
--   }
-- end

-- and finally, return the configuration to wezterm
return config
