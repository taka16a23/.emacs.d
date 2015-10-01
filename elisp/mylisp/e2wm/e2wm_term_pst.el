;;; e2wm_term_pst.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/01 08:55:15 (+0900)
;; Last-Updated: 2015/10/01 12:36:43 (+0900)
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

(defvar e2wm:term-buf-regexp "^\*terminal.+")

(defvar e2wm:term-recipe '(- (:lower-max-size 22)
                             (| (:left-max-size 40) sub main)
                             term))

(defvar e2wm:term-winfo '((:name main)
                          (:name sub :default-hide t)
                          (:name term)))

(defun re-search-buffers (regexp) ;[2015/10/01]
  "REGEXP"
  (let ((bufs (buffer-list))
        buf results )
    (while bufs
      (setq buf (pop bufs))
      (when (string-match regexp (buffer-name buf))
        (push buf results)))
    results))

(defun e2wm:term-init () ;[2015/10/01]
  ""
  (let* ((wm (wlf:no-layout e2wm:term-recipe e2wm:term-winfo))
         (termbufs (re-search-buffers e2wm:term-buf-regexp))
         (mainbuf (or e2wm:prev-selected-buffer
                      (e2wm:history-get-main-buffer))))
    (unless termbufs
      (push (funcall launch-term) termbufs))
    (wlf:set-buffer wm 'term (car termbufs))
    (wlf:set-buffer wm 'main mainbuf)
    wm))

(defun e2wm:dp-term-popup (buf)
  (e2wm:message "#DP term popup : %s" buf)
  (cond
   ((e2wm:document-buffer-p buf)
    (e2wm:pst-buffer-set 'right buf)
    t)
   (t
    (e2wm:dp-two-popup-sub buf)
    t)))

(defun e2wm:dp-term-switch (buf) ;[2015/10/01]
  "BUF"
  (e2wm:message "#DP Term switch : %s" buf)
  (let ((wm (e2wm:pst-get-wm))
        (curwin (selected-window))
        (buf-name (buffer-name buf)))
    (cond ((string-match e2wm:term-buf-regexp buf-name)
           (e2wm:pst-update-windows)
           (e2wm:pst-buffer-set 'term buf)
           t)
          (t nil))
    ))

(e2wm:pst-class-register
 (make-e2wm:$pst-class
  :extend 'two
  :name 'term
  :title "term"
  :init 'e2wm:term-init
  :main 'main
  :switch 'e2wm:dp-term-switch
  :popup 'e2wm:dp-term-popup))


;;;###autoload
(defun e2wm:dp-term ()
  (interactive)
  (e2wm:pst-change 'term))



(provide 'e2wm_term_pst)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm_term_pst.el ends here
