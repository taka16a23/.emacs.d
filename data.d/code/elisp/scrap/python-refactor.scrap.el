;; -*- Mode: Emacs-Lisp -*-

;;; python-refactor.scrap.el ---
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/01/31 12:13:51 (+0900)
;; Last-Updated: 2013/01/31 12:14:02 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This file is part of Emacs.
;;
;; This file is free software: you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free
;; Software Foundation, either version 3 of the License, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
;; more details.
;;
;; You should have received a copy of the GNU General Public License along
;; with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(defun python-refactor ()
  (widen)
  (goto-char (py--determine-__all__-point))
  (insert "from portable.update_usb import UpHandle\n")
  (re-search-forward "^class[ \t]*\\([^_0-9][a-zA-Z_][a-zA-Z0-9_]+(\\)" nil 'noerror)
  (insert "UpHandle")
  )

(walk-edit-dirs 'python-refactor '(("l:/Lib/.pylib/portable/updater" 'full ".py$")))



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; python-refactor.scrap.el ends here
