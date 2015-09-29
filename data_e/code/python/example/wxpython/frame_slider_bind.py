#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx

def slider_value_change(event):
    """SUMMARY

    @Return:
    """
    obj = event.GetEventObject()
    frame.SetStatusText('Slider value is ' + str(obj.GetValue()))

if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))
    frame.CreateStatusBar()

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    slider = wx.Slider(panel)
    slider.Bind(wx.EVT_SLIDER, slider_value_change)

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(slider, flag=wx.GROW)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()





# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
