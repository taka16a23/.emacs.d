#!/usr/bin/env python
# -*- coding: utf-8 -*-
import wx

def _main():
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test Frameme', size=(400, 200))

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    button_1 = wx.Button(panel, wx.ID_ANY, 'botton1')
    button_2 = wx.Button(panel, wx.ID_ANY, 'botton2')
    button_3 = wx.Button(panel, wx.ID_ANY, 'botton3')

    box = wx.StaticBox(panel, wx.ID_ANY, 'title')

    layout = wx.StaticBoxSizer(box, wx.HORIZONTAL)
    layout.Add(button_1)
    layout.Add(button_2)
    layout.Add(button_3)

    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()

if __name__ == '__main__':
    _main()