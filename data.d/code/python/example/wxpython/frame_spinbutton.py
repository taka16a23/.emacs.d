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

    # spin_button = wx.SpinButton(panel)
    # spin_button = wx.SpinButton(panel, style=wx.SP_HORIZONTAL)
    spin_button = wx.SpinButton(panel, style=wx.SP_VERTICAL)

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(spin_button, flag=wx.GROW)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()





# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
