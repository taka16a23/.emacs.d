#!/usr/bin/env python
# -*- coding: utf-8 -*-
import wx

def _main():
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test Frameme', size=(570, 200))

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    button_1 = wx.Button(panel, wx.ID_ANY, 'botton1', size=(80, 30))
    button_2 = wx.Button(panel, wx.ID_ANY, 'botton2', size=(80, 30))
    button_3 = wx.Button(panel, wx.ID_ANY, 'botton3', size=(80, 30))
    button_4 = wx.Button(panel, wx.ID_ANY, 'botton4', size=(80, 30))
    button_5 = wx.Button(panel, wx.ID_ANY, 'botton5', size=(80, 30))
    button_6 = wx.Button(panel, wx.ID_ANY, 'botton6', size=(80, 30))
    button_7 = wx.Button(panel, wx.ID_ANY, 'botton7', size=(80, 30))

    layout = wx.BoxSizer(wx.HORIZONTAL)
    layout.Add(button_1, flag=wx.GROW)
    layout.Add(button_2, flag=wx.SHAPED)
    layout.Add(button_3, flag=wx.SHAPED|wx.ALIGN_TOP)
    layout.Add(button_4, flag=wx.SHAPED|wx.ALIGN_BOTTOM)
    layout.Add(button_5, flag=wx.SHAPED|wx.ALIGN_CENTER)
    layout.Add(button_6, flag=wx.SHAPED|wx.ALIGN_LEFT)
    layout.Add(button_7, flag=wx.SHAPED|wx.ALIGN_RIGHT)

    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()

if __name__ == '__main__':
    _main()
