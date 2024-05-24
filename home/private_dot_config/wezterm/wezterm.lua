local wezterm = require 'wezterm'
local mux = wezterm.mux

local config = wezterm.config_builder()

config.initial_cols = 252
config.initial_rows = 105

-- doesn't work 🤷‍♂️
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 800 -- ms
--config.force_reverse_video_cursor = true

config.window_background_opacity = 0.75
config.macos_window_background_blur = 15
config.colors = {
  background = "#222222",

  cursor_bg = '#e3871c',
  cursor_fg = 'black',
  cursor_border = '#e3871c',
  compose_cursor = '#52ad70',

  selection_bg = "#9b608f",
  selection_fg = "black",

  ansi = {
    "#000000",
    "#ec392c",
    "#b3e438",
    "#fea525",
    "#cfa3ff",
    "#fd4285",
    "#76dff3",
    "#f4f4f4",
  },
  brights = {
    "#676767",
    "#ff6d67",
    "#c5fa42",
    "#fdd361",
    "#b6b9ff",
    "#ff76ff",
    "#5ffdff",
    "#fffeff",
  }
}

config.font = wezterm.font_with_fallback {
  'OperatorMono Nerd Font',
  'Operator Mono',
  'Consolas',
  'Monaco'
}
config.font_size = 12
config.line_height = 1.15
-- config.cell_width = 1.05

config.cursor_blink_rate = 0

config.keys = {
  { mods = 'SUPER',       key = 'd', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { mods = 'SUPER|SHIFT', key = 'D', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { mods = 'ALT',         key = 'l', action = wezterm.action.ShowLauncher },

  -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
  {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
  -- Make Option-Right equivalent to Alt-f; forward-word
  {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
}

wezterm.on('gui-startup', function()
  local _, pane1, window = mux.spawn_window {}
  local _, pane2, _ = window:spawn_tab {}
  local _, pane3, _ = window:spawn_tab {}
  local _, pane4, _ = window:spawn_tab {}
  local _, pane5, _ = window:spawn_tab {}
  local _, pane6, _ = window:spawn_tab {}
  local _, pane7, _ = window:spawn_tab {}
  local _, pane8, _ = window:spawn_tab {}
  local _, pane9, _ = window:spawn_tab {}
  pane1:activate()
end)

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local zoomed = ''
  if tab.active_pane.is_zoomed then
    zoomed = wezterm.nerdfonts.cod_zoom_in
  end

  -- local domain = wezterm.mux.get_domain():name()

  local index = ''
  if #tabs > 1 then
    index = string.format('%d: ', tab.tab_index + 1)
  end

  return zoomed ..
      index ..
      tab.active_pane.title ..
      ' (' .. tab.active_pane.foreground_process_name:match("([^/\\]+)$") .. ')'
end)


-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return tab_info.tab_index + 1 .. ': ' .. title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.tab_index + 1 .. ': ' .. tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = ' ' .. tab_title(tab) .. ' '

    local has_unseen_output = false
    for _, pane in ipairs(tab.panes) do
      if pane.has_unseen_output then
        has_unseen_output = true
        break
      end
    end
    if has_unseen_output then
      return {
        { Foreground = { Color = 'Orange' } },
        { Text = title },
      }
    end
    return title
  end
)

local function get_last_folder_segment(cwd)
  if cwd == nil then
    return "N/A" -- or some default value you prefer
  end

  -- Strip off 'file:///' if present
  local pathStripped = cwd:match("^file:///(.+)") or cwd
  -- Normalize backslashes to slashes for Windows paths
  pathStripped = pathStripped:gsub("\\", "/")
  -- Split the path by '/'
  local path = {}
  for segment in string.gmatch(pathStripped, "[^/]+") do
    table.insert(path, segment)
  end
  return path[#path] -- returns the last segment
end

config.status_update_interval = 1000
wezterm.on('update-status', function(window, pane)
  -- Each element holds the text for a cell in a "powerline" style << fade
  local cells = {}

  -- Figure out the cwd and host of the current pane.
  -- This will pick up the hostname for the remote host if your
  -- shell is using OSC 7 on the remote host.
  local cwd_uri = pane:get_current_working_dir()
  if cwd_uri then
    local cwd = ''
    local hostname = ''

    if type(cwd_uri) == 'userdata' then
      -- Running on a newer version of wezterm and we have
      -- a URL object here, making this simple!

      cwd = cwd_uri.file_path
      hostname = cwd_uri.host or wezterm.hostname()
    else
      -- an older version of wezterm, 20230712-072601-f4abf8fd or earlier,
      -- which doesn't have the Url object
      cwd_uri = cwd_uri:sub(8)
      local slash = cwd_uri:find '/'
      if slash then
        hostname = cwd_uri:sub(1, slash - 1)
        -- and extract the cwd from the uri, decoding %-encoding
        cwd = cwd_uri:sub(slash):gsub('%%(%x%x)', function(hex)
          return string.char(tonumber(hex, 16))
        end)
      end
    end

    -- Remove the domain name portion of the hostname
    local dot = hostname:find '[.]'
    if dot then
      hostname = hostname:sub(1, dot - 1)
    end
    if hostname == '' then
      hostname = wezterm.hostname()
    end

    --table.insert(cells, cwd)
    table.insert(cells, hostname)
  end

  -- I like my date/time in this style: "Wed 3 Mar 08:14"
  local date = wezterm.strftime '%a %-d %b %H:%M'
  table.insert(cells, date)

  -- An entry for each battery (typically 0 or 1 battery)
  for _, b in ipairs(wezterm.battery_info()) do
    if tostring(b.state_of_charge) ~= "nan" then
      table.insert(cells, string.format('%s %.0f%%', wezterm.nerdfont.md_battery, b.state_of_charge * 100))
    end
  end

  -- The powerline < symbol
  -- local LEFT_ARROW = utf8.char(0xe0b3)
  -- The filled in variant of the < symbol
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Color palette for the backgrounds of each cell
  local colors = {
    '#3c1361',
    '#52307c',
    '#663a82',
    '#7c5295',
    '#b491c8',
  }

  -- Foreground color for the text across the fade
  local text_fg = '#c0c0c0'

  -- The elements to be formatted
  local elements = {}
  -- How many cells have been formatted
  local num_cells = 0

  -- Translate a cell into elements
  local function push(text, is_last)
    local cell_no = num_cells + 1
    table.insert(elements, { Foreground = { Color = text_fg } })
    table.insert(elements, { Background = { Color = colors[cell_no] } })
    table.insert(elements, { Text = ' ' .. text .. ' ' })
    if not is_last then
      table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
      table.insert(elements, { Text = SOLID_LEFT_ARROW })
    end
    num_cells = num_cells + 1
  end

  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, #cells == 0)
  end

  window:set_right_status(wezterm.format(elements))
end)

return config
