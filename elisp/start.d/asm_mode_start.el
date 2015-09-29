;;; asm_mode_start.el --- function for asm mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 19:40:36 2012 (+0900)
;; Last-Updated: 2013/11/02 21:53:04 (+0900)
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
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'asm-mode "asm-mode" 'noerr))


;;;###autoload
(defun asm-mode-mode-custom-predefine ()
  "For `eval-after-load' `asm-mode' customize."
  (message "eval-after-load: \"asm-mode\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun asm-mode-mode-predefine ()
  "For `eval-after-load' `asm-mode' function."
  (message "eval-after-load: \"asm-mode\" setting..")
  )

;;;###autoload
(defun asm-mode-mode-map-predefine ()
  "For `asm-mode' key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"asm-mode\" keymaping.."))
  (define-many-keys asm-mode-map
	("\C-j" 'backward-char)
	("\C-m" 'reindent-then-newline-and-indent)))

;;;###autoload
(defun asm-mode-mode-face-predefine ()
  "For `asm-mode' face."
  (message "eval-after-load: \"asm-mode\" Setting faces..")
  )



(provide 'asm_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; asm_mode_start.el ends here
