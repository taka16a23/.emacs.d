#!/usr/bin/env python
# -*- coding: utf-8 -*-
import wx

def _main():
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test Frameme', size=(300, 300))

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    button_0 = wx.Button(panel, wx.ID_ANY, "0")
    button_1 = wx.Button(panel, wx.ID_ANY, "1")
    button_2 = wx.Button(panel, wx.ID_ANY, "2")
    button_3 = wx.Button(panel, wx.ID_ANY, "3")

    layout = wx.GridSizer(2, 2)

    layout.Add(button_0, flag=wx.EXPAND|wx.TOP, border=10)
    layout.Add(button_1, flag=wx.EXPAND|wx.LEFT, border=10)
    layout.Add(button_2, flag=wx.EXPAND|wx.RIGHT, border=10)
    layout.Add(button_3, flag=wx.EXPAND|wx.ALL, border=10)

    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()

if __name__ == '__main__':
    _main()
