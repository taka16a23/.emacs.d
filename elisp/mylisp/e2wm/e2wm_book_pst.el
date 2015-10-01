;;; e2wm_book_pst.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/01 12:23:14 (+0900)
;; Last-Updated: 2015/10/01 12:36:07 (+0900)
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


(require 'e2wm "e2wm" 'noerr)

(defvar e2wm:book-recipe
  '(| (:right-size-ratio 0.9)
      (- (:lower-max-size 30)
         files history)
      (| (:right-size-ratio 0.50) main
         (- (:lower-max-size 20) right sub))))

(defvar e2wm:book-winfo
  '((:name files     :plugin dired :default-hide t)
    (:name history   :plugin history-list :default-hide t)
    (:name main)
    (:name right     :default-hide nil)
    (:name sub       :buffer "*info*" :default-hide t)))

(defun e2wm:book-init ()
  (let*
      ((book-wm
        (wlf:no-layout
         e2wm:book-recipe
         e2wm:book-winfo))
       (buf (or e2wm:prev-selected-buffer
                (e2wm:history-get-main-buffer))))
    (when (e2wm:history-recordable-p e2wm:prev-selected-buffer)
      (e2wm:history-add e2wm:prev-selected-buffer))
    (wlf:set-buffer book-wm 'main buf)
    book-wm))

(defun e2wm:book-start (wm) ;[2013/11/15]
  "WM"
  (let ((buffers (buffer-list))
        (regexp "\\(jpg\\|png\\)$")
        done)
    (while (and buffers (not done))
      (when (string-match regexp (buffer-name (car buffers)))
        (setq done (car buffers)))
      (setq buffers (cdr buffers)))
    (when done
      (wlf:set-buffer wm 'main done))))

(defun e2wm:book-buffer-p (buf)
  "BUF"
  (string-match "\\(jpg\\|png\\)$" (buffer-name buf)))

(defun e2wm:book-switch (buf)
  (let ((buf-name (buffer-name buf))
        (wm (e2wm:pst-get-wm)))
    (if (or (e2wm:history-recordable-p buf) (e2wm:book-buffer-p buf))
        (cond ((eq (selected-window) (wlf:get-window wm 'right))
               (e2wm:pst-buffer-set 'right buf)
               t)
              ((eql (get-buffer buf) (wlf:get-buffer wm 'main))
               (e2wm:pst-update-windows)
               (e2wm:pst-buffer-set 'main buf)
               t)
              (t (e2wm:pst-show-history-main)
                 (e2wm:pst-buffer-set 'main buf)))
      nil)))

(defun e2wm:book-popup (buf)
  (let ((buf-name (buffer-name buf)))
    (cond
     ((e2wm:book-buffer-p buf)
      (e2wm:pst-buffer-set 'main buf)
      t)
     ((e2wm:history-recordable-p buf)
      (e2wm:pst-buffer-set 'right buf)
      t)
     (t
      (e2wm:dp-two-popup-sub buf)
      t))))

(defun e2wm:book-popup-sub (buf)
  (let ((wm (e2wm:pst-get-wm))
        (not-minibufp (= 0 (minibuffer-depth))))
    (e2wm:with-advice
     (e2wm:pst-buffer-set 'sub buf t not-minibufp))))

(defun e2wm:dp-book-files-toggle-command ()
  (interactive)
  (wlf:toggle (e2wm:pst-get-wm) 'files)
  (e2wm:pst-update-windows))

(defun e2wm:dp-book-sub-toggle-command ()
  (interactive)
  (wlf:toggle (e2wm:pst-get-wm) 'sub)
  (e2wm:pst-update-windows))

(defvar e2wm:dp-book-minor-mode-map
  (e2wm:define-keymap
   '(("C-x 0" . e2wm-hide-command)
     ;; toggle
     ("C-u M-F" . e2wm:toggle-files-command)
     ("C-u M-S" . e2wm:toggle-sub-command)
     ("C-u M-H" . e2wm:toggle-history-command)
     ("C-u M-M" . e2wm:dp-code-main-maximize-toggle-command)
     ;; navi
     ("M-D"     . e2wm:navi-main-command)
     ("M-F"     . e2wm:navi-files-command)
     ("M-H"     . e2wm:navi-history-command)
     ("M-S"     . e2wm:navi-sub-command)
     ("M-R"     . e2wm:navi-right-command)
     ("C-: 0" . e2wm:navi-sub-term-command)
     ("C-: 1" . e2wm:navi-sub-term-command)
     ("C-: 2" . e2wm:navi-sub-term-command)
     ("C-: 3" . e2wm:navi-sub-term-command))
   nil))

(e2wm:pst-class-register
 (make-e2wm:$pst-class
  :name   'book
  ;; :extend 'two
  :title  "Read books"
  :init   'e2wm:book-init
  ;; :start  'e2wm:book-start
  :main   'main
  :switch 'e2wm:book-switch
  :popup  'e2wm:book-popup
  :keymap 'e2wm:dp-book-minor-mode-map))

;;;###autoload
(defun e2wm:dp-book () ;[2015/10/01]
  ""
  (interactive)
  (e2wm:pst-change 'book))



(provide 'e2wm_book_pst)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm_book_pst.el ends here
