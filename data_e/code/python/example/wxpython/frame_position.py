#!/usr/bin/env python
# -*- coding: utf-8 -*-
import wx

def _main():
    app = wx.App()

    frame = wx.Frame(None, wx.ID_ANY, "test frame", pos=(0, 0))
    frame.Show()
    # show the Center
    # frame.Centre()
    app.MainLoop()

if __name__ == '__main__':
    _main()
