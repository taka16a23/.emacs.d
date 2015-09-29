#!/usr/bin/env python
# -*- coding: utf-8 -*-
import wx

def _main():
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test Frameme', size=(300, 200))

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    inner_panel_0 = wx.Panel(panel, wx.ID_ANY)
    inner_panel_1 = wx.Panel(panel, wx.ID_ANY)
    inner_panel_2 = wx.Panel(panel, wx.ID_ANY)

    inner_panel_0.SetBackgroundColour("#FF0000")
    inner_panel_1.SetBackgroundColour("#00FF00")
    inner_panel_2.SetBackgroundColour("#0000FF")

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(inner_panel_0, proportion=1, flag=wx.EXPAND|wx.TOP, border=10)
    layout.Add(inner_panel_1, proportion=1, flag=wx.EXPAND|wx.LEFT, border=10)
    layout.Add(inner_panel_2, proportion=1, flag=wx.EXPAND|wx.ALL, border=10)


    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()

if __name__ == '__main__':
    _main()
