#!/usr/bin/env python
# -*- coding: utf-8 -*-
import wx

def _main():
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test Frameme', size=(300, 300))

    notebook = wx.Notebook(frame, wx.ID_ANY)

    panel_0 = wx.Panel(notebook, wx.ID_ANY)
    panel_1 = wx.Panel(notebook, wx.ID_ANY)
    panel_2 = wx.Panel(notebook, wx.ID_ANY)

    panel_0.SetBackgroundColour('#FF0000')
    panel_1.SetBackgroundColour('#00FF00')
    panel_2.SetBackgroundColour('#0000FF')

    notebook.InsertPage(0, panel_0, 'tab_0')
    notebook.InsertPage(1, panel_1, 'tab_1')
    notebook.InsertPage(2, panel_2, 'tab_2')

    image_list = wx.ImageList(16,16)
    icon = wx.Icon('Web Browser.ico', wx.BITMAP_TYPE_ICO)
    image_list.AddIcon(icon)
    notebook.AssignImageList(image_list)

    notebook.SetPageImage(2,0)


    frame.Show()
    app.MainLoop()

if __name__ == '__main__':
    _main()
