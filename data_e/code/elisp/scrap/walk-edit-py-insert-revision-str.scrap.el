;; -*- coding: utf-8; mode: emacs-lisp; no-byte-compile: t; no-update-autoloads: t -*-
;;; 2013-11-25-103241.junk.el ---

(defun refact-python-insert-revision () ;[2013/11/25]
  ""
  (when (not (save-excursion (re-search-forward "LastChangedDate" nil 'noerror)))
    (when (re-search-forward "-\\*-.+-\\*-"
                             (save-excursion (forward-line 2) (point)) 'noerror)
      (forward-line 1))
    (just-one-blank-line)
    (insert "#\n# $Id: walk-edit-py-insert-revision-str.scrap.el 884 2013-11-30 07:31:12Z t1 $\n# $Revision: 884 $\n# $Date: 2013-11-30 16:31:12 +0900 (Sat, 30 Nov 2013) $ \n# $Author: t1 $\n# $LastChangedBy: t1 $\n# $LastChangedDate: 2013-11-30 16:31:12 +0900 (Sat, 30 Nov 2013) $\n")
    ))

(walk-edit 'refact-python-insert-revision "/root/.pylib" "\\.py$" "\\(\\.ropeproject\\|\\.svn\\|sendkey\\|ipython_config\\|ipython\\.log\\)")
