from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

import subprocess

mod = "mod4"
terminal = "kitty"

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
        desc="Spawn Brave"
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
]

groups = [
    Group(
        name="web",
        position=1,
        layout="max",
        matches=[Match(wm_class=["Brave-browser"])],
        spawn=["brave-browser"],
        exclusive=True,
    ),
    Group(
        name="dev",
        matches=[Match(wm_class=["kitty", "Code"])],
        position=2,
    ),
    Group(
        name="write",
        layout="max",
        matches=[Match(wm_class=["obsidian", "starc.AppImage"])],
        exclusive=True,
        position=3,
    ),
    Group(
        name="chat",
        position=4,
        matches=[Match(wm_class=["Telegram", "discord"])],
        layout="max",
        spawn=["telegram-desktop", "discord"],
    ),
    Group(
        name="ent",
        position=5,
        layout="max",
        matches=[Match(wm_class=["vlc"])],
        exclusive=True,
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
        border_focus="#6E6C7E",
        border_normal="#161320",
        border_on_single=True
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

def psmq():
    psmq = str(subprocess.check_output("shuf -n1 ~/.config/qtile/small_quotes.txt", shell=True))
    psmq = psmq[2:-3:]
    psmq = psmq.replace("\\", "")
    return psmq

screens = [
    Screen(
        wallpaper='~/.config/qtile/img/walps/cavera.jpg',
        wallpaper_mode='fill',
        top=bar.Bar(
            [
                widget.Image(
                    background="11111be6",
                    # filename="~/.config/qtile/img/macchiato_squircle.png",
                    filename="~/.config/qtile/img/1.png",
                    margin=5
                ),
                widget.Prompt(
                    fontsize=14,
                    foreground="161320",
                    background="DDB6F2"
                ),
                widget.GroupBox(
                    borderwidth=5,
                    active="bac2de",
                    inactive="6c7086",
                    background="11111be6",
                    disable_drag=False,
                    font="CaskaydiaCove Nerd Font Mono",
                    highlight_method="line",
                    highlight_color="181825e6",
                    this_current_screen_border="cba6f7"
                ),
                widget.TaskList(
                    urgent_alert_method="text",
                    font="CaskaydiaCove Nerd Font Mono",
                    fontsize=14,
                    margin=0,
                    max_title_width=150,
                    padding=6,
                    icon_size=0,
                    border="11111be6",
                    foreground="f2cdcd",
                    borderwidth=0,
                    highlight_method="block",
                    center_aligned=True
                ),
                widget.TextBox(
                    psmq(),
                    font="CaskaydiaCove Nerd Font Mono Italic",
                    foreground="161320",
                    background="cba6f7e6"
                ),
                widget.Wttr(
                    location={"Vijayawada": "VIJ"},
                    format='VJ: %t',
                    foreground="161320",
                    background="fab387e6"
                ),
                widget.NvidiaSensors(
                    format="NV: {temp}°C",
                    foreground="161320",
                    background="f9e2afe6"
                ),
                widget.Battery(
                    foreground="161320",
                    background="a6e3a1e6",
                    low_background="F28FAD",
                    low_foreground="161320",
                    low_percentage=0.2,
                    format="{percent:2.0%}{char}",
                    full_char="-f",
                    discharge_char="-d",
                    charge_char="-c"
                ),
                widget.Volume(
                    fmt='V: {}',
                    background="94e2d5e6",
                    foreground="161320"
                ),
                widget.Clock(
                    format="%dth %B, %I:%M %p",
                    foreground="161320",
                    background="74c7ece6"
                ),
                widget.Systray(
                    background="302D4100"
                ),
                widget.Sep(
                    foreground="302D4100",
                    background="302D4100",
                    padding=5
                ),
                widget.QuickExit(
                    fmt="[X]",
                    foreground="161320",
                    background="f38ba8e6"
                ),
            ],
            30,
            background="11111b00",
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
subprocess.run("xfce4-power-manager &", shell=True)
subprocess.run("nm-applet &", shell=True)
subprocess.run("picom &", shell=True)

