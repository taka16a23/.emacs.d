;;; view-setup.el ---   Setting for view mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:05 2012 (+0900)
;; Last-Updated:2015/10/20 22:54:33 (+0900)
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
;;    Moved: Moved functions to view_mode_start.el
;;    `turn-off-view-mode', `view-mode-predefine'
;;    `view-mode-map-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'viewer "viewer" 'noerr)
  (declare-function viewer-stay-in-setup "viewer")
  (declare-function viewer-change-modeline-color-setup "viewer"))

(require 't1-bind-key "t1-bind-key" 'noerr)

(defcustom view-mode-by-exclude-regexp ""
  "Document"
  :type 'string
  :group 'viewer)

(use-package view
  ;; :disabled
  :defer
  :commands view-mode
  :diminish view-mode ;hide from modeline
  :init
  (common-view-map-many-register
   '(("i" . turn-off-view-mode)))
  :config
  (message "Loading \"view\"")
  (custom-set-variables
   '(view-mode-by-exclude-regexp
     "\\(\\.loaddefs.el\\|\\*auto-async-byte-compile\\*\\)"))
  (defadvice view-mode-by-default-setup
      (around exclude-viewer activate)
    (unless (string-match view-mode-by-exclude-regexp buffer-file-name)
      ad-do-it
      ))
  (common-view-map-bind-keys view-mode-map)
  )

(defsubst turn-on-view-mode ()
  (interactive)
  ;; for auto-insert
  (unless (eq last-command 'self-insert-command)
    (view-mode 1)))

(defsubst turn-off-view-mode ()
  (interactive)
  (view-mode -1))

(use-package viewer
  ;; :disabled
  :defer 2
  :if (or window-system (daemonp))
  :init
  :config
  (message "Loading \"viewer\"")
  (custom-set-variables
   '(viewer-modeline-color-view "DeepPink")
   '(viewer-modeline-color-unwritable "tomato")
   '(view-mode-by-default-regexp ".*") ;all file
   )
  (setq viewer-modeline-color-default "chartreuse1")
  (viewer-change-modeline-color-advice view-mode)
  (defadvice view-mode-by-default-setup
      (around view-mode-by-default-setup+ activate)
    (unless (string-match "\\(\\.png$\\|\\.jpg$\\|\\.jpeg$\\)" buffer-file-name)
      ad-do-it
      ))
  (viewer-stay-in-setup)
  (viewer-change-modeline-color-setup)
  (remove-hook 'find-file-hook 'view-mode-by-default-setup)
  :bind
  (([M-return] . view-mode)
   ([f6] . view-mode)
   ("C-q" . view-mode))
  )



(provide 'view-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; view-setup.el ends here
