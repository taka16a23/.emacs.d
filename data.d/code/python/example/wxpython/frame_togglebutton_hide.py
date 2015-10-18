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

    t_button0 = wx.ToggleButton(panel, wx.ID_ANY, 'toggle0')
    t_button1 = wx.ToggleButton(panel, wx.ID_ANY, 'toggle1')
    t_button2 = wx.ToggleButton(panel, wx.ID_ANY, 'toggle2')

    t_button1.Hide()
    # t_button1.Show()

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(t_button0)
    layout.Add(t_button1)
    layout.Add(t_button2)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()





# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
