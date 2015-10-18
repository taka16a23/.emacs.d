#!/usr/bin/env python
# -*- coding: utf-8 -*-
import wx

def _main():
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test Frameme', size=(600, 300))

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    button_0 = wx.Button(panel, wx.ID_ANY, "button0", size=(30, 30))
    button_1 = wx.Button(panel, wx.ID_ANY, "button1", size=(30, 30))
    button_2 = wx.Button(panel, wx.ID_ANY, "button2", size=(30, 30))
    button_3 = wx.Button(panel, wx.ID_ANY, "button3", size=(30, 30))
    button_4 = wx.Button(panel, wx.ID_ANY, "button4", size=(30, 30))
    button_5 = wx.Button(panel, wx.ID_ANY, "button5", size=(30, 30))
    button_6 = wx.Button(panel, wx.ID_ANY, "button6", size=(30, 30))
    button_7 = wx.Button(panel, wx.ID_ANY, "button7", size=(30, 30))
    button_8 = wx.Button(panel, wx.ID_ANY, "button8", size=(30, 30))

    layout = wx.GridSizer(3, 3)

    layout.Add(button_0)
    layout.Add(button_1)
    layout.Add(button_2, flag=wx.GROW)
    layout.Add(button_3, flag=wx.SHAPED)
    layout.Add(button_4, flag=wx.SHAPED|wx.ALIGN_TOP)
    layout.Add(button_5, flag=wx.SHAPED|wx.ALIGN_BOTTOM)
    layout.Add(button_6, flag=wx.SHAPED|wx.ALIGN_CENTER)
    layout.Add(button_7, flag=wx.SHAPED|wx.ALIGN_LEFT)
    layout.Add(button_8, flag=wx.SHAPED|wx.ALIGN_RIGHT)

    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()

if __name__ == '__main__':
    _main()
