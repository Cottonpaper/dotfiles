# QTILE CONFIG
# github.com/Cottonpaper
# 8=====D 4 inch

import colors

from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

browser = "firefox"
mod = "mod4"
terminal = "alacritty"
runner = "rofi -show run"
music = "spotify-launcher"

wallpaper_path = "~/Wallpapers/003.jpg"
colors = colors.EverforestNight

keys = [

    # Actions
    Key([mod], "c", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch browser"),
    Key([mod], "p", lazy.spawn(runner), desc="Launch a program"),
    Key([mod], "s", lazy.spawn(music), desc="Launch spotify"),
    Key([mod], "d", lazy.spawn("discord"), desc="Launch discord"),
    Key([mod], "n", lazy.spawn("steam"), desc="Launch steam"),

    # Move Windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Change Window Sizes
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    # Layout
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "f", lazy.window.toggle_fullscreen(),
        desc="Toggle fullscreen on the focused window"),
    Key([mod], "t", lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window")
]

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length=14),
                widget.GroupBox(
                    disable_drag=True,
                    borderwidth=0,
                ),

                widget.Spacer(),
                # widget.TextBox(
                #     "",
                #     foreground='1db954',
                #     fontsize=22
                # ),
                # widget.Mpris2(
                #     format='{xesam:artist} - {xesam:title}',
                #     font='Circular Std Bold',
                #     foreground='1db954',
                #     paused_text='{xesam:artist} - {xesam:title}'
                # ),
                widget.Spacer(),

                widget.Net(
                    format='{down:.0f}{down_suffix}󱦳󱦲{up:.0f}{up_suffix}',
                    foreground='d699b6'
                ),
                widget.CPU(
                    format=' {load_percent}%',
                    foreground='a7c080'
                ),
                widget.Memory(
                    format=' {MemUsed:1.0f}/{MemTotal:1.0f}',
                    foreground='7fbbb3'
                ),
                widget.Clock(
                    format=" %m/%d",
                    foreground='e67e80'
                ),
                widget.Clock(
                    format=" %I:%M",
                    foreground='dbbc7f'
                ),
                widget.Systray(),
                widget.Spacer(14),
                widget.QuickExit(
                    countdown_start=4,
                    countdown_format='{}',
                    default_text='⏻'
                ),
                widget.Spacer(length=14)

            ],
            32,  # Bar Size
            margin=[14, 14, 0, 14],
            border_color=colors[3],
            border_width=0,
            opacity=0.90
        ),
        wallpaper=wallpaper_path,
        wallpaper_mode='stretch',
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
                desc="Switch to & move focused window to group {}".format(
                    i.name),
            ),
            # Move Window to Group(i)
            Key([mod, "control"], i.name, lazy.window.togroup(i.name),
                desc="move focused window to group {}".format(i.name))
        ]
    )

layouts = [
    layout.Columns(
        border_focus=colors[3],
        border_normal=colors[0],
        border_width=0,
        margin=14,
    ),
    layout.Max()
]

widget_defaults = dict(
    background=colors[0],
    foreground=colors[1],
    font="MartianMono Nerd Font",
    fontsize=18,
    padding=10,
)
extension_defaults = widget_defaults.copy()


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
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
            lazy.core.change_vt(vt).when(
                func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )
