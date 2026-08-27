local mainMod = "SUPER"

-- Keybinds for special workspaces
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("sys"))
hl.bind(mainMod .. " + R", hl.dsp.workspace.toggle_special("radio"))
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + N", hl.dsp.workspace.toggle_special("nchat"))

-- Special workspace definitions
hl.workspace_rule({
  workspace = "special:sys",
  on_created_empty = "[float] alacritty -e bash -c 'btop; bash'"
})

hl.workspace_rule({
  workspace = "special:radio",
  on_created_empty = "[float] alacritty -e bash -c 'cliamp; bash'"
})

hl.workspace_rule({
  workspace = "special:music",
  on_created_empty = "[float] omarchy-launch-webapp 'https://music.youtube.com'"
})

hl.workspace_rule({
  workspace = "special:nchat",
  on_created_empty = "[float] omarchy-launch-webapp 'https://web.whatsapp.com'"
})

-- Window rules for sizing and centering
hl.window_rule({
  match = { class = "chrome-music.youtube.com__-Default" },
  float = true,
  size = {1200, 700},
  center = true
})

hl.window_rule({
  match = { class = "chrome-web.whatsapp.com__-Default" },
  float = true,
  size = {1200, 700},
  center = true
})
