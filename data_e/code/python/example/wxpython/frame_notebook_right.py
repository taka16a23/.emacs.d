#!/usr/bin/env python
# -*- coding: utf-8 -*-
import wx

def _main():
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test Frameme', size=(300, 300))

    notebook = wx.Notebook(frame, wx.ID_ANY, style=wx.NB_RIGHT)
    # notebook = wx.Notebook(frame, wx.ID_ANY, style=wx.NB_LEFT)
    # notebook = wx.Notebook(frame, wx.ID_ANY, style=wx.NB_BOTTOM)

    panel_0 = wx.Panel(notebook, wx.ID_ANY)
    panel_1 = wx.Panel(notebook, wx.ID_ANY)
    panel_2 = wx.Panel(notebook, wx.ID_ANY)

    panel_0.SetBackgroundColour("#FF0000")
    panel_1.SetBackgroundColour("#00FF00")
    panel_2.SetBackgroundColour("#0000FF")

    notebook.InsertPage(0, panel_0, "tab_0")
    notebook.InsertPage(1, panel_1, "tab_1")
    notebook.InsertPage(2, panel_2, "tab_2")

    frame.Show()
    app.MainLoop()

if __name__ == '__main__':
    _main()
