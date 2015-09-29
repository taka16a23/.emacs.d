;;; text-translator_plugin_start.el --- functions for text-translator
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 18 03:45:12 2012 (+0900)
;; Last-Updated: 2013/11/19 11:29:34 (+0900)
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
;; 2013/11/09    Atami
;;    Added: override functions `text-translator-region-or-read-string'
;;    read-input init value from `thing-at-point'
;;
;; 2012/12/18    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'text-translator "text-translator" nil))

;;;###autoload
(defun text-translator-mode-custom-predefine ()
  "For `eval-after-load' text-translator customize."
  (message "eval-after-load: \"text-translator\" customizing..")
  (custom-set-variables
   '(text-translator-auto-selection-func
     'text-translator-translate-by-auto-selection-enja))
  )

;;;###autoload
(defun text-translator-mode-predefine ()
  "For `eval-after-load' text-translator function."
  (message "eval-after-load: \"text-translator\" setting..")
  ;; OVERRIDE befause of can't around defadvice
  (defun text-translator-region-or-read-string (&optional prompt)
    "If mark is active, return the region, otherwise, read string with PROMPT."
    (cond (mark-active
           (buffer-substring-no-properties (region-beginning) (region-end)))
          (t
           (read-string (or prompt "Enter string: ")
                        (or (and (not (eq major-mode 'image-mode))
                                 (thing-at-point 'word)) "")))))
  )



(provide 'text-translator_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; text-translator_plugin_start.el ends here
