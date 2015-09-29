#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_statictext.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx

def combobox_event(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    obj = event.GetEventObject()
    frame.SetStatusText('combobox1:' + obj.GetStringSelection())

def text_event(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    obj = event.GetEventObject()
    frame.SetStatusText('combobox2:' + obj.GetValue())


if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test', size=(300, 200))
    frame.CreateStatusBar()

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    element_array = ('element1', 'element2', 'element3', 'element4', 'element5')
    combobox1 = wx.ComboBox(panel, wx.ID_ANY,
                            'choose', choices=element_array, style=wx.CB_SIMPLE)
    combobox2 = wx.ComboBox(panel, wx.ID_ANY,
                            'choose', choices=element_array, style=wx.CB_SIMPLE)
    combobox1.Bind(wx.EVT_COMBOBOX, combobox_event)
    combobox2.Bind(wx.EVT_TEXT, text_event)

    layout = wx.BoxSizer(wx.HORIZONTAL)
    layout.Add(combobox1, flag=wx.GROW)
    layout.Add(combobox2, flag=wx.GROW)

    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()



# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_statictext.py ends here
