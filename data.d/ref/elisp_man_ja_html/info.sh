meadow -q -batch -no-site-file -eval '(set-language-environment "Japanese")' -eval '(find-file "elisp.texi")' -eval '(load-file "mmemoinfo.el")' -eval '(texinfo-format-buffer)' -eval '(save-buffer)'
