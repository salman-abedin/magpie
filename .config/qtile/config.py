from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from subprocess import check_output

mod = "mod4"

keys = [
    Key([mod], "m", lazy.next_layout()),
    Key([mod], "semicolon", lazy.window.kill()),

    Key([mod], "j", lazy.screen.prev_group()),
    Key([mod], "k", lazy.screen.next_group()),

    Key([mod], "l", lazy.layout.next()),
    Key([mod], "h", lazy.layout.prev()),
    Key([mod, "mod1"], "l", lazy.layout.grow_right()),
    Key([mod, "mod1"], "h", lazy.layout.grow_left()),

    Key([mod], "q", lazy.restart()),

    Key([mod], "e", lazy.spawn('insertemoji')),
    Key([mod], "i", lazy.spawn('unipass fetch')),
    Key([mod, 'shift'], "i", lazy.spawn('unipass add')),
    Key([mod], "n", lazy.spawn('pkill -f dunst')),
    Key([mod], "p", lazy.spawn('scratchpad')),
    Key([mod], "r", lazy.spawn('amenu -l')),
    Key([mod], "t", lazy.spawn('alacritty -e tmux')),
    Key([mod], "u", lazy.spawn('unimark')),
    Key([mod], "w", lazy.spawn('set-bg -s')),

    Key([mod], "Return", lazy.spawn(r'tmux new-session -d \; switch-client')),


    #  Key([], "F3", lazy.spawn('backlight --down')),
    #  Key([], "F4", lazy.spawn('backlight --up')),

    #  Key([], "F5", lazy.spawn('setplayer --vol toggle')),
    #  Key([], "F6", lazy.spawn('setplayer --vol down')),
    #  Key([], "F7", lazy.spawn('setplayer --vol up')),

    Key([mod], "backslash", lazy.spawn('setplayer --vol toggle')),
    Key([mod], "bracketleft", lazy.spawn('setplayer --vol down')),
    Key([mod], "bracketright", lazy.spawn('setplayer --vol up')),

    Key([mod], "s", lazy.spawn('record -d')),
    #  Key([mod], "s", lazy.spawn('record -s')),
    #  Key([mod], "f", lazy.spawn('xdotool sleep 0.25 key F11')),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    #  Key([mod], "b", lazy.spawn('xdotool sleep 0.25 key F11')),

    # Switch between windows
    #  Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    #  Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    #  Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    #  Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    #  # Move windows between left/right columns or move up/down in current stack.
    #  # Moving out of range in Columns layout will create new column.
    #  Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
    #  desc="Move window to the left"),
    #  Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
    #  desc="Move window to the right"),
    #  Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
    #  desc="Move window down"),
    #  Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    #  # Grow windows. If current window is on the edge of screen and direction
    #  # will be to screen edge - window would shrink.
    #  Key([mod, "control"], "j", lazy.layout.grow_down(),
    #  desc="Grow window down"),
    #  Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    #  Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    #  Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    #  Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    #  Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    #  Key([mod], "m", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),



]

groups = [
    Group(
        '1',
        label='🏠'
    ),
    Group(
        '2',
        label='🕸',
        matches=[
            Match(wm_class=["Brave-browser"]),
            Match(wm_class=["firefox"]),
            Match(wm_class=["Vncviewer"]),
            Match(wm_class=["Tk"]),
        ]
    ),
    Group(
        '3',
        label='💼'
    ),
    Group(
        '4',
        label='🧪', 
        matches=[
            Match(wm_class=["terminal.exe"]),
            Match(wm_class=["VirtualBox Manager"]),
        ]
    ),
]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.Max(),

    layout.Columns(
    ),

    #  layout.Stack(num_stacks=2),
    #  layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    #  layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    #  layout.Zoomy(),
]

widget_defaults = dict(
    #  font='Share',
    #  font='Share bold',
    font='Share',
    fontsize=20,
    padding=10,
    #  foreground='#000000',
    #  foreground='#abb2bf',
    foreground='#dfbf8e',  # gruvbox
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                #  widget.WindowCount(fmt='📝 {}'),
                #  widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Sep(),
                widget.GenPollText(update_interval=5, func=lambda: check_output('panel -s'.split()).decode("utf-8")),
                widget.Sep(),
                #  widget.Prompt(),
                #  widget.WindowName(),
                #  widget.Chord(
                #  chords_colors={
                #  'launch': ("#ff0000", "#ffffff"),
                #  },
                #  name_transform=lambda name: name.upper(),
                #  ),
                #  widget.TextBox("default config", name="default"),
                #  widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                #  widget.Systray(),
                #  widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
                #  widget.QuickExit(),

                widget.Spacer(bar.STRETCH),
                widget.GenPollText(update_interval=60, func=lambda: check_output('panel -t'.split()).decode("utf-8")),

                widget.Spacer(bar.STRETCH),
                widget.Sep(),
                widget.Volume(fmt='🎧 {}'),
                widget.Sep(),
                widget.GenPollText(update_interval=60, func=lambda: check_output('panel -d'.split()).decode("utf-8")),
                widget.Sep(),
                widget.Systray(),
            ],
            30,
            background="#282828",  # gruvbox
            #  background="#000000",
            #  background="#1e2127",
            #  background="#dddddddd",
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[


    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry

    Match(wm_class='amenu'),
    Match(wm_class='scratchpad'),

])
auto_fullscreen = Truetion = "smart"
focus_on_window_activation = "smart"
reconfigure_screens = True
reconfigure_screens = True
