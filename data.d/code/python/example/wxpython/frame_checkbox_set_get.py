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

    checkbox0 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox0')
    checkbox1 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox1')
    checkbox2 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox2')
    checkbox3 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox3')

    checkbox0.SetValue(True)
    checkbox1.SetValue(True)
    checkbox2.SetValue(False)
    checkbox3.SetValue(False)

    print checkbox0.GetValue()
    print checkbox1.IsChecked()
    print checkbox2.GetValue()
    print checkbox3.IsChecked()

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
