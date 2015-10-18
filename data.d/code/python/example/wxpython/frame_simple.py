#!/usr/bin/env python
# -*- coding: utf-8 -*-
import wx

def _main():
    app = wx.App()

    frame = wx.Frame(None, wx.ID_ANY, "test frame")
    frame.Show()

    app.MainLoop()

if __name__ == '__main__':
    _main()
