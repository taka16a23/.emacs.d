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

    element_array = ("element0", "element1", "element2", "element3", "element4")

    listbox0 = wx.ListBox(panel, wx.ID_ANY, size=(100, 200), choices=element_array, style=wx.LB_HSCROLL)
    listbox1 = wx.ListBox(panel, wx.ID_ANY, size=(100, 200), choices=element_array, style=wx.LB_ALWAYS_SB)
    listbox2 = wx.ListBox(panel, wx.ID_ANY, size=(100, 200), choices=element_array, style=wx.LB_NEEDED_SB)

    layout = wx.BoxSizer(wx.HORIZONTAL)
    layout.Add(listbox0, flag=wx.GROW|wx.ALL, border=3)
    layout.Add(listbox1, flag=wx.GROW|wx.ALL, border=3)
    layout.Add(listbox2, flag=wx.GROW|wx.ALL, border=3)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()





# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
