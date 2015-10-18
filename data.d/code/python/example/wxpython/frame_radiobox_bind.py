#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button_bind.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx

def selected_button(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    obj = event.GetEventObject()
    frame.SetStatusText('Selected! ' + obj.GetStringSelection())

if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))
    frame.CreateStatusBar()

    panel = wx.Panel(frame, wx.ID_ANY)

    button_array = ('RB1', 'RB2', 'RB3', 'RB4')
    radio_box = wx.RadioBox(panel, wx.ID_ANY, 'test',
                            choices=button_array,
                            style=wx.RA_VERTICAL)

    radio_box.Bind(wx.EVT_RADIOBOX, selected_button)

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(radio_box)

    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()




# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button_bind.py ends here
