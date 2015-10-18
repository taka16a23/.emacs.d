#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: frame_button.py
$Revision$

"""


__revision__ = '$Revision$'
__version__ = '0.1.0'

import wx

def _main():
    """Main function."""
    app = wx.App()
    frame = wx.Frame(None, wx.ID_ANY, 'test frame', size=(300, 200))

    panel = wx.Panel(frame, wx.ID_ANY)
    panel.SetBackgroundColour('#AFAFAF')

    menu_file = wx.Menu()
    menu_file.Append(1, 'save')
    menu_file.Append(2, 'exit')

    menu_edit = wx.Menu()
    menu_edit.Append(1, 'copy')
    menu_edit.Append(2, 'paste')

    menu_edit_do = wx.Menu()
    menu_edit_do.Append(3, 'undo')
    menu_edit_do.Append(4, 'redo')
    menu_edit.AppendSubMenu(menu_edit_do, 'command')

    menu_bar = wx.MenuBar()
    menu_bar.Append(menu_file, 'file')
    menu_bar.Append(menu_edit, 'edit')


    frame.SetMenuBar(menu_bar)
    frame.Show()
    app.MainLoop()


if __name__ == '__main__':
    _main()



# For Emacs
# Local Variables:
# coding: utf-8
# End:
# frame_button.py ends here
