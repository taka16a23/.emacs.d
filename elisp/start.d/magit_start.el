;;; magit_start.el --- for magit setting
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/09/30 08:27:13 (+0900)
;; Last-Updated: 2015/09/30 10:20:11 (+0900)
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
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  (require 'magit "magit/lisp/magit" 'noerr))

;;;###autoload
(defun magit-mode-custom-predefine ()
  "For `eval-after-load' magit customize."
  (message "eval-after-load: \"magit\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun magit-mode-predefine ()
  "For `eval-after-load' magit function."
  (message "eval-after-load: \"magit\" setting..")
  )

;;;###autoload
(defun magit-mode-map-predefine ()
  "For magit key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"magit\" keymaping.."))
  ;; (define-many-keys magit-status-mode-map
    ;; ("j" 'backward-char))

  )

;;;###autoload
(defun magit-mode-face-predefine ()
  "For magit face."
  (message "eval-after-load: \"magit\" Setting faces..")
  )


;;;; with-editor
;;
;;;###autoload
(defun with-editor-mode-custom-predefine ()
  "For `eval-after-load' with-editor customize."
  (message "eval-after-load: \"with-editor\" customizing..")
  (define-many-keys with-editor-mode-map
    ("\C-s" 'with-editor-finish))
  )

;;;###autoload
(defun with-editor-mode-predefine ()
  "For `eval-after-load' with-editor function."
  (message "eval-after-load: \"with-editor\" setting..")
  )

;;;###autoload
(defun with-editor-mode-map-predefine ()
  "For with-editor key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"with-editor\" keymaping.."))
  )

;;;###autoload
(defun with-editor-mode-face-predefine ()
  "For with-editor face."
  (message "eval-after-load: \"with-editor\" Setting faces..")
  )



(provide 'magit_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; magit_start.el ends here
