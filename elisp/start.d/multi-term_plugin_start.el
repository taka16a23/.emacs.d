;;; multi-term_plugin_start.el --- functions for multi-term
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 17 23:00:25 2012 (+0900)
;; Last-Updated: 2015/08/29 15:15:56 (+0900)
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
;; 2012/12/17    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (defvar term-unbind-key-list)
  (require 'multi-term "multi-term" 'noerr))

;;;###autoload
(defun multi-term-mode-custom-predefine ()
  "For `eval-after-load' multi-term customize."
  (message "eval-after-load: \"multi-term\" customizing..")
  (custom-set-variables
   '(multi-term-program "/bin/zsh")
   '(multi-term-scroll-to-bottom-on-output 'all)
   ))

;;;###autoload
(defun multi-term-mode-predefine ()
  "For `eval-after-load' multi-term function."
  (message "eval-after-load: \"multi-term\" setting..")
  )

;;;###autoload
(defun multi-term-mode-map-predefine ()
  "For multi-term key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"multi-term\" keymaping.."))
  (add-to-list 'term-unbind-key-list '"C-c"))



(provide 'multi-term_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; multi-term_plugin_start.el ends here
