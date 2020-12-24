# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Screen, Key
from libqtile.config import EzKey as EKey
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

# CUSTOM IMPORTS
from extra.covid import get_url, get_data

mod = "mod4"
terminal = "alacritty"
browser = "brave"
app_launcher = "dmenu_run"

keys = [
    # Switch between windows in current stack pane
    EKey("M-k", lazy.layout.down()),
    EKey("M-j", lazy.layout.up()),

    # Move windows up or down in current stack
    EKey("M-C-k", lazy.layout.shuffle_down()),
    EKey("M-C-j", lazy.layout.shuffle_up()),

    # Switch window focus to other pane(s) of stack
    EKey("M-<space>", lazy.layout.next()),

    # Swap panes of split stack
    EKey("M-S-<space>", lazy.layout.rotate()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    EKey("M-S-<Return>", lazy.layout.toggle_split()),
    EKey("M-<Return>", lazy.spawn(terminal)),

    # Toggle between different layouts and kill window
    EKey("M-<Tab>", lazy.next_layout()),
    # kill current focus window
    EKey("M-w", lazy.window.kill()),

    # restart and shutdown qtile (EzKey)
    EKey("M-C-r", lazy.restart()),
    EKey("M-C-q", lazy.shutdown()),

    # spawn a command (EzKey)
    EKey("M-r", lazy.spawn(app_launcher)),

    # spawn a web browser (+ other websites) 
    EKey("M-b", lazy.spawn(browser)),
    EKey("M-S-g", lazy.spawn(browser + " github.com")),
    EKey("M-S-y", lazy.spawn(browser + " youtube.com")),

    # FIXING SPECIAL KEYS
    # built in volume keys working
    EKey("<XF86AudioMute>", lazy.spawn("amixer set Master playback toggle")),
    EKey("<XF86AudioLowerVolume>", lazy.spawn("amixer set Master playback 2%-")),
    EKey("<XF86AudioRaiseVolume>", lazy.spawn("amixer set Master playback 2%+")),

    # built in brightness keys
    EKey("<XF86MonBrightnessUp>", lazy.spawn("xbacklight -inc 10")),
    EKey("<XF86MonBrightnessDown>", lazy.spawn("xbacklight -dec 10"))
]

groups = [Group(i) for i in "asdfuiop"]

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
    layout.Max(
        margin = 2
    ),
    layout.MonadTall(
        margin = 2
    ),
    layout.MonadWide(
        margin = 2
    ),
    # layout.Stack(
    #     num_stacks = 2,
    #     margin = 5
    # ),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),

                # showing current volume as an emoji
                widget.Volume(emoji=True),

                # spacer to split the screen
                widget.Spacer(length=bar.STRETCH),

                # showing network state and speed
                widget.Net(),
                widget.Sep(foreground="00FFFF", markup=False, padding=15, size_percent=100),

                # showing memory use state
                widget.Memory(format="RAM {MemUsed}MB/{MemTotal}MB"),
                widget.MemoryGraph(),

                # showing CPU state
                widget.Sep(foreground="00FFFF", markup=False, padding=15, size_percent=100),
                widget.CPU(format="CPU {load_percent}%"),
                widget.CPUGraph(),

                # showing battery state
                widget.Sep(foreground="00FFFF", markup=False, padding=15, size_percent=100),
                widget.BatteryIcon(),
                widget.Battery(discharge_char="", charge_char="↑", format="{char} {percent:2.0%} - {hour:d}:{min:02d} remaining", update_interval=30),

                # idk what this is for honestly
                widget.Sep(foreground="00FFFF", markup=False, padding=15, size_percent=100),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                
                # showing datetime
                widget.Systray(),
                widget.Clock(format='%X %Z %a %d %b %Y'),
            ],
            24,
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
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
