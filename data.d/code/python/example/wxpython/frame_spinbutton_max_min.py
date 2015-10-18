#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx

def spinbutton_value_change(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    obj = event.GetEventObject()
    frame.SetStatusText('SpinButton value is ' + str(obj.GetMin()))

if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))
    frame.CreateStatusBar()


    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    spin_button = wx.SpinButton(panel)

    print(spin_button.GetMin())
    print(spin_button.GetMax())
    spin_button.SetMin(100)
    spin_button.SetMax(500)

    spin_button.Bind(wx.EVT_SPIN, spinbutton_value_change)

    layout = wx.GridSizer(3, 1)
    layout.Add(spin_button, flag=wx.GROW|wx.ALL, border=10)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()





# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
