#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button_bind.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx


def state_change_checkbox1(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    frame.SetStatusText('click! CheckBox 1')

def state_change_checkbox2(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    frame.SetStatusText('Click! CheckBox 2')

def state_change_checkbox(event):
    """SUMMARY

    @Return:
    """
    if event.GetId() == 3333:
        frame.SetStatusText('Click! CheckBox 3')
    elif event.GetId() == 4444:
        frame.SetStatusText('Click! CheckBox 4')

if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))
    frame.CreateStatusBar()

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    checkbox0 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox0')
    checkbox1 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox1')
    checkbox2 = wx.CheckBox(panel, 3333, 'checkbox2')
    checkbox3 = wx.CheckBox(panel, 4444, 'checkbox3')

    checkbox0.Bind(wx.EVT_CHECKBOX, state_change_checkbox1)
    checkbox1.Bind(wx.EVT_CHECKBOX, state_change_checkbox2)
    frame.Bind(wx.EVT_CHECKBOX, state_change_checkbox, checkbox2)
    frame.Bind(wx.EVT_CHECKBOX, state_change_checkbox, checkbox3)

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(checkbox0, flag=wx.GROW)
    layout.Add(checkbox1, flag=wx.GROW)
    layout.Add(checkbox2, flag=wx.GROW)
    layout.Add(checkbox3, flag=wx.GROW)

    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()




# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button_bind.py ends here
