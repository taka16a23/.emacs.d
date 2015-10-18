#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button_bind.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx


def click_button1(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    frame.SetStatusText('click! button 1')

def click_button2(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    frame.SetStatusText('Click! button 2')

def click_button(event):
    """SUMMARY

    @Return:
    """
    if event.GetId() == 3333:
        frame.SetStatusText('Click! button 3')
    elif event.GetId() == 4444:
        frame.SetStatusText('Click! button 4')

if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))
    frame.CreateStatusBar()

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    button1 = wx.Button(panel, wx.ID_ANY, 'button 1')
    button2 = wx.Button(panel, wx.ID_ANY, 'button 2')
    button3 = wx.Button(panel, 3333, 'button 3')
    button4 = wx.Button(panel, 4444, 'button 4')

    button1.Bind(wx.EVT_BUTTON, click_button1)
    button2.Bind(wx.EVT_BUTTON, click_button2)
    frame.Bind(wx.EVT_BUTTON, click_button, button3)
    frame.Bind(wx.EVT_BUTTON, click_button, button4)

    layout = wx.GridSizer(2, 2)
    layout.Add(button1, 0, wx.GROW)
    layout.Add(button2, 0, wx.GROW)
    layout.Add(button3, 0, wx.GROW)
    layout.Add(button4, 0, wx.GROW)

    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()




# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button_bind.py ends here
