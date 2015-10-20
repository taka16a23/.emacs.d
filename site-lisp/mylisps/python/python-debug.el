;;; python-debug.el ---    setting for org mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/21 04:41:10 (+0900)
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


(defun pdb-this-buffer ()
  ""
  (interactive)
  (and (buffer-modified-p)
       (y-or-n-p "Save bufffer? ")
       (save-buffer))
  (let ((cmd (read-from-minibuffer
              "pdb command: "
              (concat "python -u "
                      usb-drive-letter "system/PortablePython/App/Lib/pdb.py "
                      (buffer-file-name)))))
    (pdb cmd)))

;;;###autoload
(defun py:insert-pdb-set-trace ()
  "Python insert-pdb-set-trace."
  (interactive)
  (ll-debug-open-fresh-line)
  (insert "import pdb; pdb.set_trace()")
  (forward-line)
  (indent-according-to-mode)
  )



(provide 'python-debug)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python-debug.el ends here

