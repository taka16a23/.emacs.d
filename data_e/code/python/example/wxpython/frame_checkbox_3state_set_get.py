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
    checkbox1 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox1', style=wx.CHK_3STATE)
    checkbox2 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox2', style=wx.CHK_3STATE)
    checkbox3 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox3',
                            style=wx.CHK_3STATE | wx.CHK_ALLOW_3RD_STATE_FOR_USER)

    # print(checkbox0.Get3StateValue())
    print(checkbox1.Get3StateValue())
    print(checkbox2.Get3StateValue())
    print(checkbox3.Get3StateValue())

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
