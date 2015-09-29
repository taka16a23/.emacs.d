#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button_bind.py
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

    radiobutton0 = wx.RadioButton(panel, wx.ID_ANY, 'radiobutton0')
    radiobutton1 = wx.RadioButton(panel, wx.ID_ANY, 'radiobutton1')
    radiobutton2 = wx.RadioButton(panel, wx.ID_ANY, 'radiobutton2')
    radiobutton3 = wx.RadioButton(panel, wx.ID_ANY, 'radiobutton3')

    radiobutton0.SetValue(True)
    radiobutton1.SetValue(True)
    radiobutton2.SetValue(True)
    radiobutton3.SetValue(True)

    print radiobutton0.GetValue()
    print radiobutton1.GetValue()
    print radiobutton2.GetValue()
    print radiobutton3.GetValue()

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(radiobutton0, flag=wx.GROW)
    layout.Add(radiobutton1, flag=wx.GROW)
    layout.Add(radiobutton2, flag=wx.GROW)
    layout.Add(radiobutton3, flag=wx.GROW)

    panel.SetSizer(layout)

    frame.Show()
    app.MainLoop()




# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button_bind.py ends here
