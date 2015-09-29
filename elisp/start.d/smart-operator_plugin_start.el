;;; smart-operator_plugin_start.el --- setting for smart-operator
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 05:56:33 (+0900)
;; Last-Updated: 2015/07/11 17:39:39 (+0900)
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
;; 2014/12/26    Atami
;;    Modified: `smart-operator-mode-map-predefine'
;;    define-key smart-operator-mode-map ",", "&", "|", "?"
;;
;; 2014/05/14    Atami
;;    Removed: defadvice `smart-operator--'
;;
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'smartchr "smartchr" 'noerr))

;;;###autoload
(defun smart-operator-mode-predefine ()
  "For `eval-after-load' smart-operator function."
  (message "eval-after-load: \"smart-operator\" setting.."))

;;;###autoload
(defun smart-operator-mode-map-predefine ()
  "For smart-operator key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"smart-operator\" keymaping.."))
  ;; (define-key smart-operator-mode-map ">" 'py:>)
  (define-key smart-operator-mode-map "=" 'py-=)
  (define-key smart-operator-mode-map "*" 'py:*)
  (define-key smart-operator-mode-map "-" 'py:-)
  (define-key smart-operator-mode-map "+" 'py:+)
  (define-key smart-operator-mode-map "/" 'py:/)
  (define-key smart-operator-mode-map "%" 'py:%)
  (define-key smart-operator-mode-map ">" 'py:>)
  (define-key smart-operator-mode-map "<" 'py:<)
  (define-key smart-operator-mode-map "," 'py:\,)
  (define-key smart-operator-mode-map "&" 'py:&)
  (define-key smart-operator-mode-map "|" 'py:|)
  (define-key smart-operator-mode-map "?" 'py:?)
  )



(provide 'smart-operator_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; smart-operator_plugin_start.el ends here
