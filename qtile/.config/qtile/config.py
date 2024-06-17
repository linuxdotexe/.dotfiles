from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from colors import colors

import subprocess

# TODO: write a better comment
# incase you want to fetch colors from the internet, uncomment below code.

# from ColorScheme import ColorScheme
# your_theme_name = "Gotham"
# CS = ColorScheme()
# try:
#     CS.set_colors_from_theme(your_theme_name)
# except Exception as e:
#     CS = ColorScheme()

mod = "mod4"
terminal = "kitty"

img_folder = "~/.config/qtile/img/"

walp = img_folder + "walps/neo2.png"
logo = img_folder + "logo.png"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key(
        [mod], "v",
        lazy.hide_show_bar("top"),
        desc="Hide top bar",
    ),
    Key(
        [mod], "Tab", 
        lazy.layout.next(), 
        desc="Move window focus to other window"
    ),
    Key(
        [mod], "d",
        lazy.screen.next_group(),
        desc="Move to next group"
    ),
    Key(
        [mod], "a",
        lazy.screen.prev_group(),
        desc="Move to prev group"
    ),
    
    Key(
        [mod], "Escape",
        lazy.screen.toggle_group(),
        desc="Toggle group"
    ),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [mod, "shift"], "h", 
        lazy.layout.grow_left(), 
        desc="Grow window to the left"
    ),
    Key(
        [mod, "shift"], "l",
        lazy.layout.grow_right(),
        desc="Grow window to the right"
    ),
    Key(
        [mod, "shift"], "j", 
        lazy.layout.grow_down(), 
        desc="Grow window down"
    ),
    Key(
        [mod, "shift"], "k",
        lazy.layout.grow_up(),
        desc="Grow window up"
    ),
    Key(
        [mod], "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes"
    ),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"], "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key(
        [mod], "Return", 
        lazy.spawn(terminal), 
        desc="Launch terminal"
    ),
    # Toggle between different layouts as defined below
    # Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key(
        [mod], "w",
        lazy.window.kill(),
        desc="Kill focused window"
    ),
    Key(
        [mod, "control"], "r",
        lazy.reload_config(),
        desc="Reload the config"
    ),
    Key(
        [mod, "control"], "q",
        lazy.shutdown(),
        desc="Shutdown Qtile"
    ),
    Key(
        [mod], "l",
        lazy.spawn("gnome-screensaver-command -l"),
        desc="Spawn a command using a prompt widget"
    ),
    Key(
        [mod], "space",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"
    ),
    # Minimize focused window - xdotool
    Key(
        [mod], "m",
        lazy.spawn("bash -c 'xdotool windowminimize $(xdotool getactivewindow)'"),
        desc="Minimize window"
    ),
    # Volume controls
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("bash -c 'pamixer -i 5; notify-send VOLUME $(pamixer --get-volume) -t 250'"),
        desc="Inc volume"
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("bash -c 'pamixer -d 5; notify-send VOLUME $(pamixer --get-volume) -t 250'"),
        desc="Dec volume"
    ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("bash -c 'pamixer -t; notify-send MUTE $(pamixer --get-mute) -t 500'"),
        desc="Toggle Mute"
    ),
    Key(
        [mod], "b",
        lazy.spawn("brave-browser"),
        desc="Spawn Browser"
    ),
    # Screen lock
    Key(
        [mod], "l",
        lazy.spawn("betterlockscreen --lock"),
        desc="Lock screen"
    ),
    # Full screen, bar still visible. Love this change.
    Key(
        [mod], "f",
        lazy.next_layout(),
        desc="Toggle fullscreen"
    ),
    Key(
        [mod], "s",
        lazy.spawn('bash -c ~/.local/bin/starc.AppImage'),
        desc="open starc"
    ),
]

groups = [
    Group(
        name="web",
        layout="max",
        matches=[Match(wm_class=["firefox", "Brave-browser"])],
        spawn=["brave-browser"],
    ),
    Group(
        name="dev",
        matches=[Match(wm_class=["kitty", "Code"])],
    ),
    Group(
        name="prod",
        layout="max",
        matches=[Match(wm_class=["Todoist"])],
        spawn=["todoist"],
    ),
    Group(
        name="write",
        layout="max",
        matches=[Match(wm_class=["obsidian", "starc.AppImage"])],
        exclusive=True,
    ),
    Group(
        name="ent",
        layout="max",
    ),
]

# Allow MODKEY+[0 through 9] to bind to groups, see https://docs.qtile.org/en/stable/manual/config/groups.html
# MOD4 + index Number : Switch to Group[index]
# MOD4 + shift + index Number : Send active window to another Group

from libqtile.dgroups import simple_key_binder
dgroups_key_binder = simple_key_binder("mod4")

layouts = [
    layout.Columns(
        margin=4,
        border_width=2,
        border_focus=colors["base"],
        border_normal=colors["mantle"],
        border_on_single=False,
        margin_on_single=False
    ),
    layout.Max(),
]

widget_defaults = dict(
    font="CaskaydiaCove Nerd Font Mono Medium",
    fontsize=14,
    padding=5,
    rounded=False,
)
extension_defaults = widget_defaults.copy()

BAR_BG = colors["crust"]
screens = [
    Screen(
        wallpaper=walp,
        wallpaper_mode='fill',
        top=bar.Bar(
            [
                widget.Image(
                    background=BAR_BG,
                    filename=logo,
                    margin=5
                ),
                widget.Prompt(
                    fontsize=14,
                    foreground=colors["mantle"],
                    background=colors["green"]
                ),
                widget.GroupBox(
                    borderwidth=5,
                    active=colors["text"],
                    inactive=colors["overlay"],
                    background=BAR_BG,
                    disable_drag=False,
                    font="CaskaydiaCove Nerd Font Mono",
                    highlight_method="line",
                    highlight_color=BAR_BG,
                    hide_unused=True,
                    this_current_screen_border=colors["yellow"]
                ),
                widget.TaskList(
                    urgent_alert_method="text",
                    font="CaskaydiaCove Nerd Font Mono",
                    fontsize=14,
                    margin=0,
                    max_title_width=150,
                    padding=6,
                    icon_size=0,
                    border=BAR_BG,
                    foreground=colors["yellow"],
                    borderwidth=0,
                    highlight_method="block",
                    center_aligned=True
                ),
                widget.Battery(
                    foreground=colors["crust"],
                    background=colors["green"],
                    low_background=colors["red"],
                    low_foreground=colors["crust"],
                    low_percentage=0.2,
                    format="{char} {percent:2.0%}",
                    full_char="󰂅",
                    discharge_char="󱟞",
                    charge_char="󰚥"
                ),
                widget.Volume(
                    fmt='󰕾 {}',
                    background=colors["blue"],
                    foreground=colors["crust"],
                ),
                widget.Clock(
                    format="%dth %b, %Y",
                    foreground=colors["crust"],
                    background=colors["yellow"]
                ),
                widget.Clock(
                    format="%I:%M %p",
                    foreground=colors["crust"],
                    background=colors["teal"],
                ),
                widget.Systray(
                    background=BAR_BG,
                ),
                widget.Sep(
                    foreground=colors["crust"],
                    background=BAR_BG,
                    padding=5
                ),
                widget.QuickExit(
                    fmt="[X]",
                    foreground=colors["crust"],
                    background=colors["red"]
                ),
            ],
            30,
            background=colors["crust"],
        ),
    ),
]

# dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
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

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# Auto Start
subprocess.run("nm-applet &", shell=True)
subprocess.run("picom &", shell=True)

