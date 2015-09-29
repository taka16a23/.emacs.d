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

    s_text0 = wx.StaticText(panel, wx.ID_ANY, 'test 0')
    s_text1 = wx.StaticText(panel, wx.ID_ANY, 'test 1')
    s_text2 = wx.StaticText(panel, wx.ID_ANY, 'test 2')
    s_text3 = wx.StaticText(panel, wx.ID_ANY, 'test 3')
    s_text4 = wx.StaticText(panel, wx.ID_ANY, 'test 4')

    # s_text3.SetForegroundColour('#FF0000')
    s_text3.SetBackgroundColour('#FF0000')

    layout = wx.BoxSizer(wx.VERTICAL)

    layout.Add(s_text0)
    layout.Add(s_text1)
    layout.Add(s_text2)
    layout.Add(s_text3)
    layout.Add(s_text4)

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
