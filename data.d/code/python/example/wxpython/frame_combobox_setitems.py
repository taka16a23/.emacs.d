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

    element_array = ('elament1', 'elament2', 'element3', 'element4', 'element5')
    combobox1 = wx.ComboBox(panel, wx.ID_ANY, '', choices=element_array, style=wx.CB_SIMPLE)
    combobox2 = wx.ComboBox(panel, wx.ID_ANY, '', choices=element_array, style=wx.CB_SIMPLE)

    combobox1.Append('element6')

    new_array = ('new1', 'new2', 'new3')
    combobox2.SetItems(new_array)

    layout = wx.BoxSizer(wx.HORIZONTAL)
    layout.Add(combobox1, flag=wx.GROW)
    layout.Add(combobox2, flag=wx.GROW)


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
