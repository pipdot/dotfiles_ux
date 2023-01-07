#!/usr/bin/python

# deeply inspired by https://github.com/swaywm/sway/issues/2859
# This script requires i3ipc-python package (install it from a system package manager
# or pip).
# It makes inactive windows transparent. Use `transparency_val` variable to control
# transparency strength in range of 0…1.

import sys
import signal
import argparse

import i3ipc

class LastMode:
    value = None

class LastFocused:
    window = None

class OpacityUnfocused:
    value = None

class OpacityFocused:
    value = None


def apply_opacity(window, o):
    window.command('opacity {}'.format(o))

def clear_opacity(ipc):
    for workspace in ipc.get_tree().workspaces():
        for w in workspace:
            apply_opacity(w, 1)

def windows_apply(ipc):
    for window in ipc.get_tree():
        if window.focused:
            apply_opacity(window, OpacityFocused.value)
            LastFocused.window = window
        else:
            apply_opacity(window, OpacityUnfocused.value)

def on_window_focus(ipc, focused):
    if focused.container.id != LastFocused.window.id:
        windows_apply(ipc)
        LastFocused.window = focused.container

def on_mode(ipc, data):
    # Disable transparency on 'opaque' mode.
    if data.change == args.opaque_mode:
        LastMode.value = data.change
        clear_opacity(ipc)
    else:
        OpacityFocused.value = args.focused
        OpacityUnfocused.value = args.unfocused
        if LastMode.value == args.opaque_mode:
            windows_apply(ipc)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
            '--focused',
            '-f', help='focused window opacity value between 0 and 1',
            type=str,
            default='1'
            )
    parser.add_argument(
            '--unfocused',
            '-u', help='unfocused window opacity value between 0 and 1',
            type=str,
            default='0.5'
            )

    parser.add_argument(
            '--opaque_mode',
            '-m', help='optional mode for disabling transparency',
            type=str,
            default=None
            )
    args = parser.parse_args()
    ipc  = i3ipc.Connection()

    OpacityFocused.value = args.focused
    OpacityUnfocused.value = args.unfocused
    windows_apply(ipc)
    for sig in [signal.SIGINT, signal.SIGTERM]:
        def clean_up():
            clear_opacity(ipc)
            ipc.main_quit()
            sys.exit(0)
        signal.signal(sig, lambda signal_, frame_: clean_up())
    ipc.on("window::focus", on_window_focus)
    ipc.on("mode", on_mode)
    ipc.main()
