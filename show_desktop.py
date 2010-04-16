#!/usr/bin/env python
import time
import wnck

screen = wnck.screen_get_default()
if screen:
  screen.toggle_showing_desktop(1)
  time.sleep(2)
  screen.toggle_showing_desktop(0)

