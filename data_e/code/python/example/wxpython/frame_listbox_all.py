#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx

if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    element_array = ("0", "1", "2", "3", "4", "5", "6", "7", "8", "9")
    listbox = wx.ListBox(panel, wx.ID_ANY, choices=element_array, style=wx.LB_EXTENDED|wx.LB_HSCROLL|wx.LB_NEEDED_SB|wx.LB_SORT)

    layout = wx.GridSizer(1, 1)
    layout.Add(listbox, flag=wx.GROW|wx.ALL, border=10)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()





# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
