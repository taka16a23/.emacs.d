;;; elisp-mode-hooks-setup.el ---   Setting for Emacs Lisp mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:19 2012 (+0900)
;; Last-Updated:2015/10/18 17:10:37 (+0900)
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


(defun emacs-lisp-mode-hook ()
  "For `eval-after-load' Emacs Lisp mode function."
  ;; (unless during-init-p
  ;;   (ignore-errors (eldoc-mode 1)))
  (add-hook 'write-file-hooks 'delete-trailing-whitespace 'append 'local)
  )

(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode-hook)

(defun lisp-interaction-mode-hook ()
  "Lisp interaction mode hook predefine."
  ;; modeline
  (setq mode-line-format
		'("%e"
		  mode-line-position
		  ",P"
		  (:eval (format "%4d" (point)))
		  " "
		  "%z" ;mode-line-mule-info
		  " "
		  mode-line-buffer-identification
		  " "
		  "%*" ;mode-line-modified
		  "%2@" ;mode-line-remote
		  mode-name
		  ))
  )

(add-hook 'lisp-interaction-mode-hook 'lisp-interaction-mode-hook)



(provide 'elisp-mode-hooks-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; elisp-mode-hooks-setup.el ends here
