;;; helm_plugin_start.el --- functions for helm
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/03/01 13:31:33 (+0900)
;; Last-Updated: 2013/11/01 18:05:50 (+0900)
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
;; 2013/03/01    Atami
;;    Created
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'helm nil 'noerr))

;;;###autoload
(defun helm-mode-custom-predefine ()
  "For `eval-after-load' helm customize."
  (message "eval-after-load: \"helm\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun helm-mode-predefine ()
  "For `eval-after-load' helm function."
  (message "eval-after-load: \"helm\" setting..")
  )

;;;###autoload
(defun helm-mode-map-predefine ()
  "For helm key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"helm\" keymaping.."))
  (define-many-keys helm-map
    ("\C-k"    'helm-previous-line)
    ("\C-\M-k" 'helm-previous-page)
    ("\C-\M-n" 'helm-next-page)))

;;;###autoload
(defun helm-mode-face-predefine ()
  "For helm face."
  (message "eval-after-load: \"helm\" Setting faces..")
  )



(provide 'helm_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; helm_plugin_start.el ends here
