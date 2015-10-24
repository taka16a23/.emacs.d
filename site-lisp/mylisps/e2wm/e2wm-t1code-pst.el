;;; e2wm-t1code-pst.el --- t1 code perspective for e2wm
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/23 03:33:31 (+0900)
;; Last-Updated:2015/10/24 17:34:29 (+0900)
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


(eval-when-compile
  (require 'e2wm "e2wm" 'noerr))

(autoload 'w3m-list-buffers "w3m-util")
(require 's "s" 'noerr)

(defvar e2wm:t1code-recipe
  '(| (:left-max-size 32)
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

(defvar e2wm:t1code-winfo '((:name main)
                            (:name upsub   :default-hide t)
                            (:name files   :plugin dired)
                            (:name imenu   :plugin imenu :default-hide nil)
                            (:name history :plugin history-list :default-hide t)
                            (:name right   :default-hide nil)
                            (:name sub     :default-hide nil)))

(defvar e2wm:dp-t1code-minor-mode-map
  (e2wm:define-keymap
   '(("C-x 0" . e2wm-hide-command)
     ;; toggle
     ("C-u M-F" . e2wm:toggle-files-command)
     ("C-u M-I" . e2wm:toggle-imenu-command)
     ("C-u M-H" . e2wm:toggle-history-command)
     ("C-u M-S" . e2wm:toggle-sub-command)
     ("C-u M-U" . e2wm:toggle-upsub-command)
     ("C-u M-M" . e2wm:dp-code-main-maximize-toggle-command)
     ("M-U" . e2wm:toggle-upsub-command)
     ;; navi
     ("M-D" . e2wm:navi-main-command)
     ("C-: C-m" . e2wm:navi-main-command)
     ("M-F" . e2wm:navi-files-command)
     ("C-: f" . e2wm:navi-files-command)
     ("M-I" . e2wm:navi-imenu-command)
     ("C-: i" . e2wm:navi-imenu-command)
     ("M-H" . e2wm:navi-history-command)
     ("C-: h" . e2wm:navi-history-command)
     ("C-: C-h" . e2wm:navi-history-command)
     ("M-S" . e2wm:navi-sub-command)
     ("M-R" . e2wm:navi-right-command)
     ("C-: r" . e2wm:navi-right-command)
     ("C-: C-r" . e2wm:navi-right-command)
     ("C-: 0" . e2wm:navi-sub-term-command)
     ("C-: 1" . e2wm:navi-sub-term-command)
     ("C-: 2" . e2wm:navi-sub-term-command)
     ("C-: 3" . e2wm:navi-sub-term-command)
     ("C-: C-i" . e2wm:dp-t1code-navi-sub-ipython)
     ("C-: M-C-i" . e2wm:dp-t1code-navi-relaunch-sub-ipython)
     ("C-x K" . e2wm:dp-t1code-navi-relaunch-sub-ipython)
     )
   nil))

(defvar e2wm:python-shell-buffer-name "*Python*")

(defun e2wm:dp-t1code-init ()
  (let* ((code-wm (wlf:no-layout e2wm:t1code-recipe e2wm:t1code-winfo))
         (buf (or e2wm:prev-selected-buffer
                  (e2wm:history-get-main-buffer)))
         (scratch-buf (get-buffer "*scratch*"))
         (python-shell-buf (get-buffer e2wm:python-shell-buffer-name))
         (w3m-list-bufs (w3m-list-buffers t)))
    ;; main
    (when (e2wm:history-recordable-p e2wm:prev-selected-buffer)
      (e2wm:history-add e2wm:prev-selected-buffer))
    (wlf:set-buffer code-wm 'main buf)
    ;; for elisp
    (with-current-buffer buf
      (equal 'emacs-lisp-mode major-mode)
      ;; set scratch buffer if exists.
      (when scratch-buf
        (wlf:set-buffer code-wm 'sub scratch-buf)))
    ;; for python
    (when (with-current-buffer buf
            (equal 'python-mode major-mode))
      (unless python-shell-buf
        (setq python-shell-buf (funcall 'run-python)))
      ;; set python shwll to sub
      (wlf:set-buffer code-wm 'sub python-shell-buf))
    ;; set w3m in right if exists
    (when w3m-list-bufs
      (wlf:set-buffer code-wm 'right (car w3m-list-bufs)))
    code-wm))

(defvar e2wm:web-buffer-regexp "\\*w3m\\*")

(defun e2wm:dp-t1code-switch (buf)
  (if (e2wm:history-recordable-p buf)
      (let ((buf-name (buffer-name buf))
            (wm (e2wm:pst-get-wm)))
        (cond ((string-match e2wm:web-buffer-regexp buf-name) ;web
               (e2wm:pst-buffer-set 'right buf)
               t)
              ((equal buf-name e2wm:python-shell-buffer-name)
               (e2wm:pst-buffer-set 'sub buf t t)
               t)
              ((eq (selected-window) (wlf:get-window wm 'right))
               (e2wm:pst-buffer-set 'right buf)
               t)
              ((eql (get-buffer buf) (wlf:get-buffer wm 'main))
               (e2wm:pst-update-windows)
               (e2wm:pst-buffer-set 'main buf)
               t)
              (t (e2wm:pst-show-history-main)
                 (e2wm:pst-window-select-main)
                 t)))))

(defun e2wm:dp-t1code-popup-upsub (buf)
  (let ((wm (e2wm:pst-get-wm))
        (not-minibufp (= 0 (minibuffer-depth))))
    (e2wm:with-advice
     (e2wm:pst-buffer-set 'upsub buf t not-minibufp))))

(defun e2wm:dp-t1code-popup-sub (buf)
  (let ((wm (e2wm:pst-get-wm))
        (not-minibufp (= 0 (minibuffer-depth))))
    (e2wm:with-advice
     (e2wm:pst-buffer-set 'sub buf t not-minibufp))))

(defun e2wm:dp-t1code-popup (buf)
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
          (t
           (e2wm:dp-t1code-popup-sub buf)
           t))))

(e2wm:pst-class-register
 (make-e2wm:$pst-class
  :name 't1code
  :extend 'code
  :title "t1Coding"
  :main 'main
  :init 'e2wm:dp-t1code-init
  :switch 'e2wm:dp-t1code-switch
  :popup 'e2wm:dp-t1code-popup
  :keymap 'e2wm:dp-t1code-minor-mode-map
  ))

;;;###autoload
(defun e2wm:dp-t1code () ;[2015/10/01]
  ""
  (interactive)
  (e2wm:pst-change 't1code))

;;;; Navi
;;
;;;###autoload
(defun e2wm:dp-t1code-navi-sub-ipython () ;[2013/11/23], [2015/06/11]
  ""
  (interactive)
  (let ((wm (e2wm:pst-get-wm))
        (winfo-name 'sub)
        (python-shell-buf (get-buffer e2wm:python-shell-buffer-name)))
    (unless python-shell-buf
      (setq python-shell-buf (funcall 'run-python)))
    (e2wm:pst-buffer-set winfo-name python-shell-buf t t))
  ;; no query exit process
  (when (process-list)
    (dolist (p (process-list))
      (when (s-starts-with? "ipython" (process-name p))
        (set-process-query-on-exit-flag p nil)))))

;;;###autoload
(defun e2wm:dp-t1code-navi-relaunch-sub-ipython () ;[2014/12/28]
  ""
  (interactive)
  (let ((buf (get-buffer e2wm:python-shell-buffer-name)))
    (when buf
      (kill-buffer buf))
    (e2wm:dp-t1code-navi-sub-ipython)))



(provide 'e2wm-t1code-pst)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm-t1code-pst.el ends here
