# QTILE CONFIG
# github.com/Cottonpaper
# 8=====D 4 inch

import colors

from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
terminal = "alacritty"
wallpaper_path = "~/Downloads/22.png"
runner = "rofi -show run"
colors = colors.GruvboxDark

keys = [

    # Actions
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Move Windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Change Window Sizes
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    # Layout
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key(
        [mod], "f", lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window",
    ),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),

    Key([mod], "p", lazy.spawn(runner), desc="Spawn a command using a prompt widget"),
]

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length = 6),
                widget.GroupBox(
                    disable_drag = True,
                    borderwidth = 0,
                    ),

                widget.Spacer(),

                widget.CPU(
                    format = 'CPU = {load_percent}% ',
                    ),
                widget.Sep(linewidth = 2),

                widget.Memory(
                    format = '{MemUsed: .0f}{mm} /{MemTotal: .0f}{mm} '
                    ),
                widget.Sep(linewidth = 2),

                widget.Systray(),
                widget.Sep(linewidth = 2),

                widget.Clock(format=" %m-%d-%Y %I:%M "),

                widget.Spacer(length = 6),
            ],
            32, # Bar Size
            margin = [14, 14, 0, 14],
            border_color = '#89b482',
            border_width = 2,
            opacity = 0.90
        ),
        wallpaper = wallpaper_path,
        wallpaper_mode = 'stretch',
    ),
]

groups = [Group(i) for i in "12345"]
for i in groups:
    keys.extend(
        [
            # Switch to Group(i)
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # Move Window and Switch to Group(i)
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Move Window to Group(i)
            Key([mod, "control"], i.name, lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name))
        ]
    )

layouts = [
    layout.Columns(
        border_focus = colors[18],
        border_normal = colors[0],
        border_width = 3,
        margin = 14,
        ),
    layout.Max()
]

widget_defaults = dict(
    background = '1d2021',
    foreground = colors[10],
    font = "IBM Plex Mono Bold",
    fontsize = 16,
    padding = 6,
)
extension_defaults = widget_defaults.copy()


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = True
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None

# Add key bindings to switch VTs in Wayland.
# We can't check qtile.core.name in default config as it is loaded before qtile is started
# We therefore defer the check until the key binding is run by using .when(func=...)
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )
