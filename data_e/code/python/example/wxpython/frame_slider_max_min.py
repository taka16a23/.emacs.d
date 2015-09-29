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

    slider = wx.Slider(panel, style=wx.SL_LABELS)

    print(slider.GetMin())
    print(slider.GetMax())
    slider.SetMin(100)
    slider.SetMax(500)

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
