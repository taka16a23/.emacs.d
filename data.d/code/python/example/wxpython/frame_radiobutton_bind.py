#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button_bind.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx


def selected_radiobutton1(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    frame.SetStatusText('Selected! radiobutton 1')

def selected_radiobutton2(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    frame.SetStatusText('Selected! radiobutton 2')

def selected_radiobutton(event):
    """SUMMARY

    @Return:
    """
    if event.GetId() == 3333:
        frame.SetStatusText('Selected! radiobutton 3')
    elif event.GetId() == 4444:
        frame.SetStatusText('Selected! radiobutton 4')

if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))
    frame.CreateStatusBar()

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    radiobutton1 = wx.RadioButton(panel, wx.ID_ANY, 'Radio button 1')
    radiobutton2 = wx.RadioButton(panel, wx.ID_ANY, 'Radio button 2')
    radiobutton3 = wx.RadioButton(panel, 3333, 'Radio button 3')
    radiobutton4 = wx.RadioButton(panel, 4444, 'Radio button 4')

    radiobutton1.Bind(wx.EVT_RADIOBUTTON, selected_radiobutton1)
    radiobutton2.Bind(wx.EVT_RADIOBUTTON, selected_radiobutton2)
    frame.Bind(wx.EVT_RADIOBUTTON, selected_radiobutton, radiobutton3)
    frame.Bind(wx.EVT_RADIOBUTTON, selected_radiobutton, radiobutton4)

    layout = wx.GridSizer(wx.VERTICAL)
    layout.Add(radiobutton1, flag=wx.GROW)
    layout.Add(radiobutton2, flag=wx.GROW)
    layout.Add(radiobutton3, flag=wx.GROW)
    layout.Add(radiobutton4, flag=wx.GROW)

    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()




# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button_bind.py ends here
