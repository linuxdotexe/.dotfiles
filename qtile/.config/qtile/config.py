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
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod], "d", lazy.screen.next_group(), desc="Move to next group"),
    Key([mod], "a", lazy.screen.prev_group(), desc="Move to prev group"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "shift"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "shift"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "shift"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "shift"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    # Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "space", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    # Minimize focused window - xdotool
    Key([mod, "control"], "m", lazy.spawn("bash -c 'xdotool windowminimize $(xdotool getactivewindow)'"), desc="Spawn Telegram"),
    # Volume controls
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5"), desc="Inc volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5"), desc="Dec volume"),
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t"), desc="Toggle Mute"),
    Key([mod], "b", lazy.spawn("google-chrome-stable --enable-features=WebUIDarkMode --force-dark-mode"), desc="Toggle Mute"),
    # Screen lock
    Key([mod], "l", lazy.spawn("betterlockscreen --lock"), desc="Lock screen"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen"),
]
groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend(
        [
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

layouts = [
    layout.Columns(margin=4, border_width=2, border_focus="#6E6C7E", border_normal="#161320", border_on_single=True),
    layout.Max(),
]

widget_defaults = dict(
    font="CaskaydiaCove Nerd Font Mono Medium",
    fontsize=14,
    padding=4,
    background="161320",
    rounded=False,
)
extension_defaults = widget_defaults.copy()

kernel_info = str(subprocess.check_output("uname -r", shell=True))
kernel_info = kernel_info[2:-3:]

psmq = str(subprocess.check_output("shuf -n1 ~/.config/qtile/small_quotes.txt", shell=True))
psmq = psmq[2:-3:]
psmq = psmq.replace("\\", "")

screens = [
    Screen(
        wallpaper='~/.config/qtile/img/code.png',
        top=bar.Bar(
            [
                widget.Image(filename="~/.config/qtile/img/macchiato_squircle.png", margin=5),
                widget.Prompt(foreground="161320", background="DDB6F2"),
                widget.GroupBox(active="DDB6F2", inactive="6E6C7E", disable_drag=True, fontsize=18, hide_unused=True, highlight_method="block", this_current_screen_border="302D41"),
                widget.TaskList(margin=0,max_title_width=150,padding=5,icon_size=0,border="302D41",foreground="D9E0EE",borderwidth=0,highlight_method="block",rounded=False),
                widget.TextBox(psmq, foreground="161320", background="C9CBFF"),
                widget.TextBox(kernel_info, foreground="161320", background="ABE9B3"),
                widget.Battery(foreground="161320",background="F2CDCD",low_background="F28FAD",low_foreground="161320",low_percentage=0.2,format="{percent:2.0%}{char}", full_char="-f", discharge_char="-d", charge_char="-c"),
                widget.Volume(background="96CDF8",foreground="161320"),
                widget.Clock(format="%dth %B, %I:%M %p",foreground="161320", background="DDB6F2"),
                widget.Systray(background="302D41"),
                widget.Sep(foreground="302D41",background="302D41", padding=5),
            ],
            30,
        ),
    ),
]

dgroups_key_binder = None
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

