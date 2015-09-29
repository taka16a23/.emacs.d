#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx

def click_togglebutton0(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    frame.SetStatusText('Click! t_button0')

def click_togglebutton1(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    frame.SetStatusText('Click! t_button1')

def click_togglebutton(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    if event.GetId() == 1234:
        frame.SetStatusText('Click! t_button2')
    elif event.GetId() == 5678:
        frame.SetStatusText('Click! t_button3')

if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))
    frame.CreateStatusBar()

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    t_button0 = wx.ToggleButton(panel, wx.ID_ANY, 'toggle0')
    t_button1 = wx.ToggleButton(panel, wx.ID_ANY, 'toggle1')
    t_button2 = wx.ToggleButton(panel, 1234, 'toggle2')
    t_button3 = wx.ToggleButton(panel, 5678, 'toggle3')

    t_button0.Bind(wx.EVT_TOGGLEBUTTON, click_togglebutton0)
    t_button1.Bind(wx.EVT_TOGGLEBUTTON, click_togglebutton1)
    frame.Bind(wx.EVT_TOGGLEBUTTON, click_togglebutton, t_button2)
    frame.Bind(wx.EVT_TOGGLEBUTTON, click_togglebutton, t_button3)

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(t_button0)
    layout.Add(t_button1)
    layout.Add(t_button2)
    layout.Add(t_button3)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()





# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
