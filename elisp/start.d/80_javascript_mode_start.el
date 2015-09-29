;;; 80_javascript_mode_start.el --- javascript mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:22 2012 (+0900)
;; Last-Updated: 2013/11/02 02:55:16 (+0900)
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
;;    Moved: Moved functions to javascript_mode_start.el
;;    `javascript-mode-predefine', `javascript-mode-map-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro"))

(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist
             (cons (purecopy "\\.\\(js\\|as\\|json\\|jsn\\)\\'")
                   'javascript-mode))

(defvar javascript-eval-after-load-hook nil
  "Hook for javascript `eval-after-load'.")
(add-hook 'javascript-eval-after-load-hook 'javascript-mode-custom-predefine)
(add-hook 'javascript-eval-after-load-hook 'javascript-mode-predefine 'append)
(add-hook 'javascript-eval-after-load-hook 'javascript-mode-map-predefine 'append)
(run-hooks-after-load "javascript" 'javascript-eval-after-load-hook)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 80_javascript_mode_start.el ends here
