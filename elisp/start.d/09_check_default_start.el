;;; 09_check_default_start.el --- Check default.el and setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:15 2012 (+0900)
;; Last-Updated: 2013/03/01 14:51:29 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


;; (eval-when-compile
  ;; (require 'check_default_start))

;; TODO: uniq list
(defvar default-el-setting '(("ni" . t)
							 ))

(when (locate-library "default")
  (let ((predefine nil))
    (dolist (m default-el-setting)
      (when (string= (system-name) (car m))
        (setq inhibit-default-init (cdr m))
        (unless inhibit-default-init (message "Will load default.el"))
        (setq predefine t)))
    ;; if no predefine then prompt
    (unless predefine
      (default-el-prompt))
    ))


(provide '09_check_default_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 09_check_default_start.el ends here
