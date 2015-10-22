;;; e2wm-setup.el ---   Setting for e2wm mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 23:33:01 2012 (+0900)
;; Last-Updated:2015/10/23 01:17:30 (+0900)
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
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'bind-key "bind-key" 'noerr)
  (require 'use-package "use-package" 'noerr)
  (require 'e2wm "e2wm" 'noerr)
  (require 'e2wm_macro "e2wm_macro" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  )

(use-package e2wm
  ;; :disabled
  :defer
  :ensure t
  :commands e2wm:start-management e2wm:stop-management defe2wm:navi-simple-command
  :init
  (bind-keys ("M-+" . e2wm:toggle-start-stop)
             ("M-P" . e2wm:start-direct-pycode))
  :config
  (message "Loading \"e2wm\"")
  (bind-keys :map e2wm:pst-minor-mode-keymap
             ("M-P" . e2wm:dp-pycode)
             ("M-E" . e2wm:dp-elispcode)
             ("M-T" . e2wm:dp-two)
             ("M-Z" . e2wm:dp-term)
             ("M-B" . e2wm:dp-book)
             ("M-D" . e2wm:dp-doc)
             ("M-W" . e2wm:dp-web)
             ;; ("M-!" . e2wm:dp-svn)
             ("M-)" . e2wm:dp-code)
             ("M-C" . e2wm:dp-code)
             ("M-G" . e2wm:dp-magit)
             ("M-N" . e2wm:windmove-down-or-splitmove)
             ("M-K" . e2wm:windmove-up-or-splitmove)
             )
  (bind-keys :map e2wm:def-plugin-files-mode-map
             ([backspace] . e2wm:def-plugin-files-updir-command)
             ("D" . e2wm:def-plugin-files-delete-command)
             ("+" . e2wm:def-plugin-files-mkdir-command)
             ("r" . e2wm:def-plugin-files-rename-command)
             ("C-c d" . e2wm:def-plugin-files-open-dired-command))
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
  (face-spec-set 'e2wm:face-history-list-normal '((t :foreground "White")))
  )

(defun e2wm:toggle-start-stop ()
  (interactive)
  (if (and (boundp 'e2wm:pst-minor-mode)
           e2wm:pst-minor-mode)
      (e2wm:stop-management)
    (e2wm:start-management '(elispcode pycode two htwo doc dashboard magit monky))
    ;; (e2wm:pst-window-plugin-set (e2wm:pst-get-wm) 'right nil)
    (e2wm:pst-update-windows)))

(defun e2wm:windmove-down-or-splitmove (&optional args)
  "Try window move down. If not exist window then split it vertically"
  (interactive "p")
  (if (eq args 4)
      (progn (split-window-vertically)
             (windmove-down))
    (windmove-or-splitmove 'windmove-down 'split-window-vertically 'nosplit)))

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

(use-package e2wm-vcs
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"e2wm-vcs\"")
  (setq e2wm:c-magit-recipe '(| (:left-max-size 30)
                                (- (:upper-size-ratio 0.7)
                                   files history)
                                (| (:right-max-size 80)
                                   (- status (- main sub))
                                   (- (:upper-size-ratio 0.4) branches logs))))
  (defalias 'magit-get-top-dir 'magit-toplevel) ;fixed void "magit-get-top-dir"
  ;; override
  (defun e2wm:dp-magit-popup (buf)
    (let ((cb (current-buffer)))
      (e2wm:message "#DP MAGIT popup : %s (current %s / backup %s)"
                    buf cb e2wm:override-window-cfg-backup))
    (unless (e2wm:vcs-select-if-plugin buf)
      (let ((buf-name (buffer-name buf))
            (wm (e2wm:pst-get-wm))
            (not-minibufp (= 0 (minibuffer-depth))))
        (e2wm:with-advice
         (cond
          ((string-match "^COMMIT_EDITMSG" buf-name)
           ;; displaying commit objects in the main window
           (e2wm:pst-buffer-set 'main buf t nil))
          ((string-match "^\\*magit: .*\\*$" buf-name)
           ;; displaying status object in the status window
           (e2wm:pst-buffer-set 'status buf t t))
          ((string-match "^\\*magit-diff: .+\\*$" buf-name)
           ;; displaying diff object in the logs window
           (e2wm:pst-buffer-set 'logs buf t nil))
          ((buffer-file-name buf)
           ;; displaying file buffer in the main window
           (e2wm:pst-buffer-set 'main buf t t))
          (t
           (princ buf-name)
           ;; displaying other objects in the sub window
           (e2wm:pst-buffer-set 'sub buf t not-minibufp)))))))
  (defun e2wm:dp-magit-switch (buf)
    (e2wm:message "#DP MAGIT switch : %s" buf)
    (let ((bufname (buffer-name buf)))
      (cond ((string-match "^COMMIT_EDITMSG" bufname)
             (e2wm:pst-buffer-set 'main buf t t))
            (t (e2wm:vcs-select-if-plugin buf)))))
  )

(defun e2wm:dp-pycode-navi-relaunch-sub-ipython () ;[2014/12/28]
  ""
  (interactive)
  (let ((buf (get-buffer "*IPython*")))
    (when buf
      (kill-buffer buf))
    (e2wm:dp-pycode-navi-sub-ipython)))



(provide 'e2wm-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm-setup.el ends here
