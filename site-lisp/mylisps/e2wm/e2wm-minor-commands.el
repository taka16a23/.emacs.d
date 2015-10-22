;;; e2wm-minor-commands.el --- e2wm minor command definition
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/23 05:38:30 (+0900)
;; Last-Updated:2015/10/23 05:42:46 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


;;;; navi command
;;
(defmacro defe2wm:navi-simple-command (winname) ;[2013/11/29]
  "Macro to create e2wm navigation command."
  `(defun ,(intern (concat "e2wm:navi-" (symbol-name winname) "-command")) ()
     (interactive)
     (e2wm:pst-window-select ',winname)))

(defmacro defe2wm:navi&show-command (winname) ;[2013/11/29]
  "Macro to create e2wm show and navigation command."
  `(defun ,(intern (concat "e2wm:navi-" (symbol-name winname) "-command")) ()
     (interactive)
     (let ((wm (e2wm:pst-get-wm))
           (winfo-name ',winname))
       (unless (wlf:window-shown-p
                (wlf:get-winfo winfo-name (wlf:wset-winfo-list wm)))
         (wlf:show wm winfo-name))
       (wlf:select wm winfo-name)
       (e2wm:pst-update-windows))))

;;;; display command
;;
(defmacro defe2wm:win-command (action pstname)
  "Macro to create e2wm show command."
  `(defun ,(intern
            (concat "e2wm:"
                    (symbol-name action) "-"
                    (symbol-name pstname) "-command")) ()
     (interactive)
     (,(intern (concat "wlf:" (symbol-name action)))
      (e2wm:pst-get-wm) ',pstname)
     (e2wm:pst-update-windows)))

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



(provide 'e2wm-minor-commands)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm-minor-commands.el ends here
