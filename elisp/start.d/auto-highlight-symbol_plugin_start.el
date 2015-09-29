;;; auto-highlight-symbol_plugin_start.el --- functions for auto-highlight-symbol
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 18 16:59:49 2012 (+0900)
;; Last-Updated: 2015/07/25 04:15:41 (+0900)
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
;; 2015/07/25    Atami
;;    Modified: `auto-highlight-symbol-mode-predefine'
;;    Add `ahs-regist-range-plugin' for python def
;;    Add `ahs-regist-range-plugin' for python class
;;
;; 2013/02/12    Atami
;;    Modified: `auto-highlight-symbol-mode-map-predefine'
;;    define key `auto-highlight-symbol-mode-map'
;;    "M--" with `my-forward-whitespace'
;;
;; 2012/12/18    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'auto-highlight-symbol "auto-highlight-symbol" 'noerr)
  (require '04_bindings_start nil 'noerr))


;;;###autoload
(defun auto-highlight-symbol-mode-custom-predefine ()
  "For `eval-after-load' auto-highlight-symbol customize."
  (message "eval-after-load: \"auto-highlight-symbol\" customizing..")
  (custom-set-variables
   '(ahs-log-echo-area-only t)
   '(ahs-decorate-log nil)
   '(ahs-select-invisible 'skip))
  )

;;;###autoload
(defun auto-highlight-symbol-mode-predefine ()
  "For `eval-after-load' auto-highlight-symbol function."
  (message "eval-after-load: \"auto-highlight-symbol\" setting..")
  ;; region python def
  (ahs-regist-range-plugin
      pythondef
    '((name    . "python def area")
      (lighter . "HS")
      (face    . ahs-plugin-defalt-face)
      (start   . py:def-start-point)
      (end     . py:def-end-point))
    "Python def area")
  ;; region python class
  (ahs-regist-range-plugin
      pythonclass
    '((name    . "python class area")
      (lighter . "HS")
      (face    . ahs-plugin-defalt-face)
      (start   . py:class-start-point)
      (end     . py:class-end-point))
    "Python class area")
  )

;;;###autoload
(defun auto-highlight-symbol-mode-map-predefine ()
  "For auto-highlight-symbol key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"auto-highlight-symbol\" keymaping.."))
  (define-key auto-highlight-symbol-mode-map (kbd "M--") 'my-forward-whitespace))

;;;###autoload
(defun auto-highlight-symbol-mode-face-predefine ()
  "For auto-highlight-symbol face."
  (message "eval-after-load: \"auto-highlight-symbol\" Setting faces..")
  (face-spec-set
   'ahs-plugin-defalt-face '((t (:forground "Black" :background "skyblue"))))
  )

;;;###autoload
(defun auto-highlight-symbol-mode-on ()
  "Global `auto-highlight-symbol' mode on."
  (interactive)
  (global-auto-highlight-symbol-mode 1))



(provide 'auto-highlight-symbol_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-highlight-symbol_plugin_start.el ends here
