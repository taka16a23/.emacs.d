;;; e2wm_pycode_pst.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/01 11:01:20 (+0900)
;; Last-Updated:2015/12/01 09:59:01 (+0900)
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
  (require 'e2wm "e2wm" 'noerr))

(require 'e2wm "e2wm" 'noerr)
(autoload 'w3m-list-buffers "w3m-util")

(defvar e2wm:pycode-recipe '(| (:left-max-size 32)
                               ;; left
                               (- (:upper-max-size 50)
                                  files
                                  (- (:upper-max-size 20)
                                     imenu history))
                               (| (:left-max-size 88) ;linum +4
                                  ;; center
                                  (- (:upper-max-size 20) upsub main)
                                  ;; right
                                  (- (:lower-max-size 22) right sub))))

(defvar e2wm:pycode-winfo '((:name main)
                            (:name upsub   :default-hide t)
                            (:name files   :plugin dired)
                            (:name imenu   :plugin imenu :default-hide nil)
                            (:name history :plugin history-list :default-hide t)
                            (:name right   :default-hide nil)
                            (:name sub     :default-hide nil)))

(defvar e2wm:pycode-show-main-regexp "\\*\\(vc-diff\\)\\*")

(defvar e2wm:dp-pycode-minor-mode-map
  (e2wm:define-keymap
   '(("C-x 0"   . e2wm-hide-command)
     ;; toggle
     ("C-u M-F" . e2wm:toggle-files-command)
     ("C-u M-I" . e2wm:toggle-imenu-command)
     ("C-u M-H" . e2wm:toggle-history-command)
     ("C-u M-S" . e2wm:toggle-sub-command)
     ("C-u M-U" . e2wm:toggle-upsub-command)
     ("C-u M-M" . e2wm:dp-code-main-maximize-toggle-command)
     ("M-U"     . e2wm:toggle-upsub-command)
     ;; navi
     ("M-D"     . e2wm:navi-main-command)
     ("C-: C-m"     . e2wm:navi-main-command)
     ("M-F"     . e2wm:navi-files-command)
     ("C-: f"     . e2wm:navi-files-command)
     ("M-I"     . e2wm:navi-imenu-command)
     ("C-: i"     . e2wm:navi-imenu-command)
     ("M-H"     . e2wm:navi-history-command)
     ("C-: h"     . e2wm:navi-history-command)
     ("C-: C-h"     . e2wm:navi-history-command)
     ("M-S"     . e2wm:navi-sub-command)
     ("M-R"     . e2wm:navi-right-command)
     ("C-: r"     . e2wm:navi-right-command)
     ("C-: C-r"     . e2wm:navi-right-command)
     ("C-: 0"   . e2wm:navi-sub-term-command)
     ("C-: 1"   . e2wm:navi-sub-term-command)
     ("C-: 2"   . e2wm:navi-sub-term-command)
     ("C-: 3"   . e2wm:navi-sub-term-command)
     ("C-: C-i" . e2wm:dp-pycode-navi-sub-ipython)
     ("C-: M-C-i" . e2wm:dp-pycode-navi-relaunch-sub-ipython)
     ("C-x K" . e2wm:dp-pycode-navi-relaunch-sub-ipython)
     )
   nil))

(defun e2wm:dp-pycode-init ()
  (let*
      ((code-wm
        (wlf:no-layout
         e2wm:pycode-recipe
         e2wm:pycode-winfo))
       (buf (or e2wm:prev-selected-buffer
                (e2wm:history-get-main-buffer)))
       (ipython-buf (get-buffer "*Python*"))
       (w3m-buffers (w3m-list-buffers t))
       (pylib-dired (dired-noselect (expand-file-name "~/.pylib")))
       )
    ;; set ipython in sub
    (unless ipython-buf
      (setq ipython-buf (funcall 'run-python)))
    (wlf:set-buffer code-wm 'sub ipython-buf)
    ;; set w3m in right if exists
    (when w3m-buffers
      (wlf:set-buffer code-wm 'right (car w3m-buffers)))
    ;; set pylib dired in files
    (when pylib-dired
                                        ; TODO: (Atami) [2015/01/06]
                                        ; failed switch
      (wlf:set-buffer code-wm 'files pylib-dired))
    ;; main
    (when (e2wm:history-recordable-p e2wm:prev-selected-buffer)
      (e2wm:history-add e2wm:prev-selected-buffer))
    (wlf:set-buffer code-wm 'main buf)
    code-wm))

(defun e2wm:dp-pycode-switch (buf)
  (if (e2wm:history-recordable-p buf)
      (let ((buf-name (buffer-name buf))
            (wm (e2wm:pst-get-wm)))
        (cond ((string-match "\\*w3m\\*" buf-name)
               (e2wm:pst-buffer-set 'right buf))
              ((eq (selected-window) (wlf:get-window wm 'right))
               (e2wm:pst-buffer-set 'right buf))
              ((eql (get-buffer buf) (wlf:get-buffer wm 'main))
               (e2wm:pst-update-windows)
               (e2wm:pst-buffer-set 'main buf))
              (t (e2wm:pst-show-history-main)
                 (e2wm:pst-window-select-main))))))

(defun e2wm:dp-pycode-popup-upsub (buf)
  (let ((wm (e2wm:pst-get-wm))
        (not-minibufp (= 0 (minibuffer-depth))))
    (e2wm:with-advice
     (e2wm:pst-buffer-set 'upsub buf t not-minibufp))))

(defun e2wm:dp-pycode-popup-sub (buf)
  (let ((wm (e2wm:pst-get-wm))
        (not-minibufp (= 0 (minibuffer-depth))))
    (e2wm:with-advice
     (e2wm:pst-buffer-set 'sub buf t not-minibufp))))

(defun e2wm:dp-pycode-popup (buf)
  (let ((buf-name (buffer-name buf))
        (wm (e2wm:pst-get-wm)))
    (cond ((e2wm:history-recordable-p buf)
           (e2wm:pst-show-history-main)
           ;;記録対象なら履歴に残るのでupdateで表示を更新させる
           t)
          ((and e2wm:override-window-cfg-backup
                (eq (selected-window) (wlf:get-window wm 'sub)))
           ;;現在subならmainに表示しようとする
           ;;minibuffer以外の補完バッファは動きが特殊なのでbackupをnilにする
           (setq e2wm:override-window-cfg-backup nil)
           ;;一時的に表示するためにset-window-bufferを使う
           ;;(prefix) C-lなどで元のバッファに戻すため
           (set-window-buffer (wlf:get-window wm 'right) buf)
           t)
          ((and e2wm:c-code-show-main-regexp
                (string-match e2wm:c-code-show-main-regexp buf-name))
           (e2wm:pst-buffer-set 'main buf t)
           t)
          (t
           (e2wm:dp-pycode-popup-sub buf)
           t))))

(defun e2wm:dp-pycode-start (wm) ;[2013/11/15]
  "WM"
  (let ((buffers (buffer-list))
        (regexp "\\.py$")
        done)
    (while (and buffers (not done))
      (when (string-match regexp (buffer-name (car buffers)))
        (setq done (car buffers)))
      (setq buffers (cdr buffers)))
    (when done
      (wlf:set-buffer wm 'main done))))

(e2wm:pst-class-register
 (make-e2wm:$pst-class
  :extend 'base
  :name   'pycode
  :title  "PythonCoding"
  :main   'main
  :init   'e2wm:dp-pycode-init
  :start  'e2wm:dp-pycode-start
  :switch 'e2wm:dp-pycode-switch
  :popup  'e2wm:dp-pycode-popup
  :keymap 'e2wm:dp-pycode-minor-mode-map))

;;;; interactive
;;
(defun e2wm:dp-pycode-navi-sub-ipython () ;[2013/11/23], [2015/06/11]
  ""
  (interactive)
  (let ((wm (e2wm:pst-get-wm))
        (winfo-name 'sub)
        (ipython-buf (get-buffer "*Python*")))
    (unless ipython-buf
      (setq ipython-buf (funcall 'run-python (python-shell-parse-command))))
    (e2wm:pst-buffer-set winfo-name ipython-buf t t))
  ;; no query exit process
  (when (process-list)
    (dolist (p (process-list))
      (when (s-starts-with? "ipython" (process-name p))
        (set-process-query-on-exit-flag p nil)))))

(defun e2wm:dp-pycode-navi-relaunch-sub-ipython () ;[2014/12/28]
  ""
  (interactive)
  (let ((buf (get-buffer "*Python*")))
    (when buf
      (kill-buffer buf))
    (e2wm:dp-pycode-navi-sub-ipython)))

;;;###autoload
(defun e2wm:dp-pycode () ;[2015/10/01]
  ""
  (interactive)
  (e2wm:pst-change 'pycode))

;;;###autoload
(defun e2wm:start-direct-pycode () ;[2015/09/30]
  ""
  (interactive)
  (when (not (and (boundp 'e2wm:pst-minor-mode) e2wm:pst-minor-mode))
    (e2wm:start-management)
    (e2wm:dp-pycode)))



(provide 'e2wm_pycode_pst)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm_pycode_pst.el ends here
