perl texi2html.pl -split chapter elisp.texi
rm -f change.diff
diff -x"*.html" -u ../../20-2-5/ja/ ./ >> change.diff
meadow -batch -l "~/mylisp/meadowmemo-index-elisp.el"
sh ./info.sh
rm -rf ../elisp-info.tar.gz
rm -rf ../elisp-src.tar.gz
tar cvfz ../elisp-info.tar.gz *.inf*
tar cvfz ../elisp-src.tar.gz *.texi ChangeLog
rm -rf *.inf*
