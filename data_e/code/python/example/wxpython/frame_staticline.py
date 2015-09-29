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

    button0 = wx.Button(panel, wx.ID_ANY, '0')
    button1 = wx.Button(panel, wx.ID_ANY, '1')
    button2 = wx.Button(panel, wx.ID_ANY, '2')
    button3 = wx.Button(panel, wx.ID_ANY, '3')

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(button0)
    layout.Add(button1)
    layout.Add(wx.StaticLine(panel), flag=wx.GROW)
    layout.Add(button2)
    layout.Add(button3)

    panel.SetSizer(layout)


    frame.Show()
    app.MainLoop()





# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
