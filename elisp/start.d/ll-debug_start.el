;;; ll-debug_start.el --- functions for ll-debug
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/02/04 14:44:23 (+0900)
;; Last-Updated: 2013/11/01 18:38:58 (+0900)
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
;; 2013/02/04    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'll-debug nil 'noerror))

;;;###autoload
(defun ll-debug-predefine ()
  "For `eval-after-load' ll-debug function."
  (message "eval-after-load: \"ll-debug\" setting..")
  (ll-debug-register-mode 'python-mode
                          "print(" ")"
                          '(nil "'" (ll-debug-create-next-debug-string) "'")
                          '(nil "'" (ll-debug-create-next-debug-string)
                                ("Variable name: "
                                 "  " str ":%s"
                                 '(progn (setq v1 (concat v1 " " str)) nil))
                                "' %" v1)))


(provide 'll-debug_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; ll-debug_start.el ends here
