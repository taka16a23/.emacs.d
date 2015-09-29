#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_statictext.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx

def _main():
    """Main function."""
    app = wx.App()
    frame = wx.Frame(None, wx.ID_NO, 'test frame', size=(300, 200))

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    checkbox0 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox 0')
    checkbox1 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox 1')
    checkbox2 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox 2')
    checkbox3 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox 3')
    checkbox4 = wx.CheckBox(panel, wx.ID_ANY, 'checkbox 4')

    checkbox2.SetToolTipString('showing tooltip')

    layout = wx.BoxSizer(wx.VERTICAL)
    layout.Add(checkbox0, flag=wx.GROW)
    layout.Add(checkbox1, flag=wx.GROW)
    layout.Add(checkbox2, flag=wx.GROW)
    layout.Add(checkbox3, flag=wx.GROW)
    layout.Add(checkbox4, flag=wx.GROW)

    panel.SetSizer(layout)
    frame.Show()
    app.MainLoop()

if __name__ == '__main__':
    _main()



# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_statictext.py ends here
