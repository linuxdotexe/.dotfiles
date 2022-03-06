from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

mod = "mod4"
terminal = "alacritty"

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "Tab", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod], "d", lazy.screen.next_group(), desc="Move to next group"),
    Key([mod], "a", lazy.screen.prev_group(), desc="Move to prev group"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
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
    # Open applications
    Key([mod], "t", lazy.spawn("telegram-desktop"), desc="Spawn Telegram"),
    Key([mod], "b", lazy.spawn("google-chrome-stable"), desc="Spawn Chrome"),
    # Minimize focused window - xdotool
    Key([mod, "control"], "m", lazy.spawn("bash -c 'xdotool windowminimize $(xdotool getactivewindow)'"), desc="Spawn Telegram"),
    # Volume controls
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5"), desc="Inc volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5"), desc="Dec volume"),
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t"), desc="Toggle Mute"),
    # Screen lock
    Key([mod], "l", lazy.spawn("betterlockscreen --lock blur"), desc="Lock screen"),
    Key([mod], "e", lazy.spawn("pcmanfm"), desc="Open file manager"),

]
groups = [Group(i) for i in "12345"]

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
    layout.Columns(margin=4, border_width=2, border_focus="#44475a", border_normal="#13141f", border_on_single=True),
    layout.Max(),
]

widget_defaults = dict(
    font="sans",
    fontsize=14,
    padding=4,
    background="13141f",
    rounded=False,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Image(filename="~/Downloads/img/logo.png", margin=5),
                widget.GroupBox(active="bd93f9", inactive="6272a4", disable_drag=True, fontsize=18, hide_unused=True, highlight_method="block", this_current_screen_border="282a36"),
                widget.Prompt(foreground="13141f", background="FF79C6"),
                widget.TaskList(margin=0,max_title_width=150,padding=5,icon_size=0,border="282a36",foreground="f8f8f2",borderwidth=0,highlight_method="block",rounded=False),
                widget.Battery(foreground="13141f",background="FFB86C",low_background="FF5555",low_foreground="13141f",low_percentage=0.2,format="{percent:2.0%}"),
                widget.Volume(background="FF79C6",foreground="13141f"),
                widget.Clock(format="%I:%M %p",foreground="13141f", background="BD93F9"),
                widget.Systray(background="282A36"),
                widget.Sep(foreground="282a36",background="282a36", padding=5),
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
