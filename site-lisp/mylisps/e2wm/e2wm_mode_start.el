;;; e2wm_mode_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/01 12:55:55 (+0900)
;; Last-Updated: 2015/10/01 12:56:48 (+0900)
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
  (defvar e2wm:prev-selected-buffer)
  (defvar e2wm:prefix-key)
  (defvar e2wm:pst-minor-mode-keymap)
  (defvar e2wm:def-plugin-files-mode-map)
  (defvar e2wm:override-window-cfg-backup)
  (defvar e2wm:c-code-show-main-regexp)
  (defvar e2wm:c-code-recipe)
  (defvar e2wm:c-code-winfo)
  (require 't1macro "t1macro" 'noerr)
  (require 'e2wm "e2wm" 'noerr)
  (require 'windmove-or-split "windmove-or-split" 'noerr)
  (require 'e2wm_macro "e2wm_macro" 'noerr))

;;;###autoload
(defun e2wm-mode-custom-predefine ()
  "For `eval-after-load' e2wm customize."
  (message "eval-after-load: \"e2wm\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun e2wm-mode-predefine ()
  "For `eval-after-load' e2wm function."
  (message "eval-after-load: \"e2wm\" setting..")
  (load "e2wm-vcs" 'noerr)
  (setf (e2wm:$pst-class-main (e2wm:pst-class-get 'magit)) 'status)
  ;; navi
  (defe2wm:navi-simple-command main)
  (defe2wm:navi-simple-command right)
  (defe2wm:navi&show-command files)
  (defe2wm:navi&show-command imenu)
  (defe2wm:navi&show-command history)
  (defe2wm:navi&show-command sub)
  (defe2wm:navi&show-command upsub)
  ;; show
  (defe2wm:win-command show history)
  (defe2wm:win-command show imenu)
  (defe2wm:win-command show sub)
  (defe2wm:win-command show files)
  (defe2wm:win-command show upsub)
  ;; hide
  (defe2wm:win-command hide history)
  (defe2wm:win-command hide imenu)
  (defe2wm:win-command hide sub)
  (defe2wm:win-command hide files)
  (defe2wm:win-command hide upsub)
  ;; toggle
  (defe2wm:win-command toggle history)
  (defe2wm:win-command toggle imenu)
  (defe2wm:win-command toggle sub)
  (defe2wm:win-command toggle files)
  (defe2wm:win-command toggle upsub)
  )

;;;###autoload
(defun e2wm-mode-map-predefine ()
  "For e2wm key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"e2wm\" keymaping.."))
  ;; (define-many-keys ctl-colon-map
  ;;   ("B" 'e2wm:dp-book)
  ;;   ("P" 'e2wm:dp-pycode)
  ;;   ("W" 'e2wm:dp-web)
  ;;   ("S" 'e2wm:dp-svn)
  ;;   ("T" 'e2wm:dp-two)
  ;;   ("D" 'e2wm:dp-doc)
  ;;   ("C" 'e2wm:dp-code)
  ;;   ("E" 'e2wm:dp-elispcode))
  (define-many-keys e2wm:pst-minor-mode-keymap
    ((kbd "M-P") 'e2wm:dp-pycode)
    ((kbd "M-E") 'e2wm:dp-elispcode)
    ((kbd "M-T") 'e2wm:dp-two)
    ((kbd "M-Z") 'e2wm:dp-term)
    ((kbd "M-&") 'e2wm:dp-doc)
    ((kbd "M-B") 'e2wm:dp-book)
    ((kbd "M-W") 'e2wm:dp-web)
    ((kbd "M-!") 'e2wm:dp-svn)
    ((kbd "M-)") 'e2wm:dp-code)
    ((kbd "M-C") 'e2wm:dp-code)
    ((kbd "M-V") 'e2wm:dp-magit)
    ("\M-N" 'e2wm:windmove-down-or-splitmove)
    ("\M-K" 'e2wm:windmove-up-or-splitmove)
    )
  ;;;; perspective files
  (define-many-keys e2wm:def-plugin-files-mode-map
    ([backspace] 'e2wm:def-plugin-files-updir-command)
    (        "D" 'e2wm:def-plugin-files-delete-command)
    (        "+" 'e2wm:def-plugin-files-mkdir-command)
    (        "r" 'e2wm:def-plugin-files-rename-command)
    (    "\C-cd" 'e2wm:def-plugin-files-open-dired-command)
    )
  )

;;;###autoload
(defun e2wm-mode-face-predefine ()
  "For e2wm face."
  (message "eval-after-load: \"e2wm\" Setting faces..")
  (face-spec-set 'e2wm:face-history-list-normal '((t :foreground "White")))
  )

;;;###autoload
(defun e2wm:toggle-start-stop ()
  (interactive)
  (if (and (boundp 'e2wm:pst-minor-mode)
           e2wm:pst-minor-mode)
      (e2wm:stop-management)
    (e2wm:start-management)
    ;; (e2wm:pst-window-plugin-set (e2wm:pst-get-wm) 'right nil)
    (e2wm:pst-update-windows)))

;;;###autoload
(defun e2wm:windmove-down-or-splitmove (&optional args)
  "Try window move down. If not exist window then split it vertically"
  (interactive "p")
  (if (eq args 4)
      (progn (split-window-vertically)
             (windmove-down))
    (windmove-or-splitmove 'windmove-down 'split-window-vertically 'nosplit)))

;;;###autoload
(defun e2wm:windmove-up-or-splitmove (&optional args)
  "Try window move up. If not exist window then split it vertically"
  (interactive "p")
  (if (eq args 4)
      (progn (split-window-vertically)
             (windmove-up))
    (windmove-or-splitmove 'windmove-up 'split-window-vertically 'nosplit)))

(defun e2wm:navi-sub-term-command () ;[2013/11/23]
  ""
  (interactive)
  (let ((key (cond
              ((eq last-input-event 48) 0) ; 0
              ((eq last-input-event 49) 1) ; 1
              ((eq last-input-event 50) 2) ; 2
              ((eq last-input-event 51) 3) ; 3
              ((eq last-input-event 52) 4) ; 4
              ((eq last-input-event 53) 5) ; 5
              ((eq last-input-event 54) 6) ; 6
              ((eq last-input-event 55) 7) ; 7
              ((eq last-input-event 56) 8) ; 8
              ((eq last-input-event 57) 9) ; 9
              ((eq last-input-event 95) 0) ; _
              ((eq last-input-event 33) 1) ; !
              ((eq last-input-event 34) 2) ; "
              ((eq last-input-event 35) 3) ; #
              ((eq last-input-event 36) 4) ; $
              ((eq last-input-event 37) 5) ; %
              ((eq last-input-event 38) 6) ; &
              ((eq last-input-event 39) 7) ; '
              ((eq last-input-event 40) 8) ; (
              ((eq last-input-event 41) 9) ; )
              (t nil)))
        buf)
    (e2wm:pst-window-select 'sub)
    (cond ((eq key 0) (funcall 'launch-term))
          ((and (numberp key)
                (setq buf (get-buffer (format "*terminal<%s>*" key))))
           (e2wm:pst-buffer-set 'sub buf))
          (t (funcall launch-term)))))

(defun e2wm-hide-command () ;[2013/11/15]
  ""
  (interactive)
  (let ((wm (e2wm:pst-get-wm))
        (selected-win (selected-window)))
    (cond ((eq selected-win (wlf:get-window wm 'sub))
           (wlf:hide (e2wm:pst-get-wm) 'sub)
           (e2wm:pst-update-windows))
          ((eq selected-win (wlf:get-window wm 'imenu))
           (wlf:hide (e2wm:pst-get-wm) 'imenu)
           (e2wm:pst-update-windows))
          ((eq selected-win (wlf:get-window wm 'upsub))
           (wlf:hide (e2wm:pst-get-wm) 'upsub)
           (e2wm:pst-update-windows))
          ((eq selected-win (wlf:get-window wm 'files))
           (wlf:hide (e2wm:pst-get-wm) 'files)
           (e2wm:pst-update-windows))
          ((eq selected-win (wlf:get-window wm 'history))
           (wlf:hide (e2wm:pst-get-wm) 'history)
           (e2wm:pst-update-windows))
          )))



(provide 'e2wm_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm_mode_start.el ends here
