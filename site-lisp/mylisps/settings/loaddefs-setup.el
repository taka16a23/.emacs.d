;;; loaddefs-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/11 16:37:37 (+0900)
;; Last-Updated:2015/10/19 14:04:08 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(eval-when-compile
  (require 'user-loaddefs "user-loaddefs" 'noerr)
  (declare-function user-generate-loaddefs "user-loaddefs"))

(require 'environment-setup "environment-setup" 'noerr)

(defvar loaddefs-name ".loaddefs.el")

(defun update-loaddefs-site-lisp () ;[2015/10/11]
  ""
  (interactive)
  (user-generate-loaddefs loaddefs-name (my-site-lisp-dir-get)))

(dolist (dir (list (my-site-lisp-dir-get)))
  (unless (file-exists-p (expand-file-name loaddefs-name dir))
    (require 'user-loaddefs)
    (user-generate-loaddefs loaddefs-name dir)))

;; (unless (load (expand-file-name loaddefs-name (my-site-lisp-dir-get)) 'noerr)
  ;; (message "Failed load %s" (expand-file-name loaddefs-name (my-site-lisp-dir-get))))



(provide 'loaddefs-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; loaddefs-setup.el ends here
