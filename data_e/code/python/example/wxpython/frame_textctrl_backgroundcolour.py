#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button_bind.py
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

    text0 = wx.TextCtrl(panel, wx.ID_ANY)
    text1 = wx.TextCtrl(panel, wx.ID_ANY)
    text2 = wx.TextCtrl(panel, wx.ID_ANY, 'default')
    text3 = wx.TextCtrl(panel, wx.ID_ANY, 'initial')

    text3.SetBackgroundColour('#0000FF')
    text3.SetForegroundColour('#FFFFFF')

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(text0, flag=wx.GROW)
    layout.Add(text1, flag=wx.GROW)
    layout.Add(text2, flag=wx.GROW)
    layout.Add(text3, flag=wx.GROW)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()




# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button_bind.py ends here
