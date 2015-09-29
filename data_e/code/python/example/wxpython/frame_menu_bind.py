#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx

def selectMenu(event):
    """SUMMARY

    @Arguments:
    - `event`:

    @Return:
    """
    frame.SetStatusText('MenuSelected! ' + str(event.GetId()))


if __name__ == '__main__':
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))
    frame.CreateStatusBar()

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    menu_file = wx.Menu()
    save_item = menu_file.Append(1, 'save')
    exit_item = menu_file.Append(2, 'exit')

    menu_edit = wx.Menu()
    copy_item = menu_edit.Append(3, 'copy')
    paste_item = menu_edit.Append(4, 'paste')


    menu_bar = wx.MenuBar()
    menu_bar.Append(menu_file, 'file')
    menu_bar.Append(menu_edit, 'edit')

    frame.Bind(wx.EVT_MENU, selectMenu)

    frame.SetMenuBar(menu_bar)
    frame.Show()
    app.MainLoop()





# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
