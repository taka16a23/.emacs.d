;;; text-adjust_plugin_start.el --- functions for text-adjust
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 18 02:08:10 2012 (+0900)
;; Last-Updated: 2013/11/02 00:00:23 (+0900)
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
;; 2012/12/18    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'text-adjust "text-adjust" 'noerr))

;;;###autoload
(defun text-adjust-mode-custom-predefine ()
  "For `eval-after-load' text-adjust customize."
  (message "eval-after-load: \"text-adjust\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun text-adjust-mode-predefine ()
  "For `eval-after-load' text-adjust function."
  (message "eval-after-load: \"text-adjust\" setting..")
  (defalias 'spacer 'text-adjust-space-buffer)
  )

;;;###autoload
(defun text-adjust-mode-map-predefine ()
  "For text-adjust key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"text-adjust\" keymaping.."))
  )

;;;###autoload
(defun text-adjust-space-before-save-if-needed ()
  (when (memq major-mode
              '(org-mode text-mode mew-draft-mode))
    (text-adjust-space-buffer)))



(provide 'text-adjust_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; text-adjust_plugin_start.el ends here
