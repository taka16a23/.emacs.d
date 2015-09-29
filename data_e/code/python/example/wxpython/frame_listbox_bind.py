#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx

def listbox_select(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    obj = event.GetEventObject()
    frame.SetStatusText('Listbox1:' + obj.GetStringSelection())

def listbox_double_click(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    obj = event.GetEventObject()
    frame.SetStatusText('listbox2:' + obj.GetStringSelection())

if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))
    frame.CreateStatusBar()

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    element_array = ("element0", "element1", "element2", "element3", "element4")
    listbox1 = wx.ListBox(panel, wx.ID_ANY, choices=element_array)
    listbox2 = wx.ListBox(panel, wx.ID_ANY, choices=element_array)

    listbox1.Bind(wx.EVT_LISTBOX, listbox_select)
    listbox2.Bind(wx.EVT_LISTBOX, listbox_double_click)


    layout = wx.GridSizer(1, 2)
    layout.Add(listbox1, flag=wx.GROW|wx.ALL, border=10)
    layout.Add(listbox2, flag=wx.GROW|wx.ALL, border=10)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()





# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
