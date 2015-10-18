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

    text0 = wx.TextCtrl(panel, wx.ID_ANY, 'text0')
    text1 = wx.TextCtrl(panel, wx.ID_ANY, 'text1')
    text2 = wx.TextCtrl(panel, wx.ID_ANY, 'text2')
    text3 = wx.TextCtrl(panel, wx.ID_ANY, 'text3')
    text4 = wx.TextCtrl(panel, wx.ID_ANY, 'text4')
    text5 = wx.TextCtrl(panel, wx.ID_ANY, 'text5')

    text0.SetValue('changed1')
    text1.WriteText('changed2')
    text2.AppendText('changed3')
    text3.Clear()
    text4.Remove(2, 3)
    text5.Replace(2, 3, 'replaced')

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(text0, flag=wx.GROW)
    layout.Add(text1, flag=wx.GROW)
    layout.Add(text2, flag=wx.GROW)
    layout.Add(text3, flag=wx.GROW)
    layout.Add(text4, flag=wx.GROW)
    layout.Add(text5, flag=wx.GROW)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()




# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button_bind.py ends here
