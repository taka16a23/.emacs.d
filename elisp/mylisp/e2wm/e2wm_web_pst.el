;;; e2wm_web_pst.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/01 12:16:30 (+0900)
;; Last-Updated: 2015/10/01 12:36:49 (+0900)
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



(defvar e2wm:web-recipe
  '(| (:left-max-size 100)
      main ;left
      (- (:lower-max-size 22) right sub) ;right
      ))

(defvar e2wm:web-winfo
  '((:name main :plugin open :plugin-args (:buffer "*w3m*" :command w3m))
    (:name right)
    (:name sub   :buffer "*info*" :default-hide nil)))

(defun e2wm:web-init ()
  (let*
      ((web-wm
        (wlf:no-layout
         e2wm:web-recipe
         e2wm:web-winfo))
       (buf (or e2wm:prev-selected-buffer
                (e2wm:history-get-main-buffer))))
    (wlf:set-buffer web-wm 'main buf)
    web-wm))

(defun e2wm:web-buffer-p (buf)
  "BUF"
  (string-match "\\*w3m\\*" (buffer-name buf)))

(defun e2wm:web-switch (buf)
  (let ((buf-name (buffer-name buf))
        (wm (e2wm:pst-get-wm)))
    (if (e2wm:history-recordable-p buf)
        (cond ((e2wm:web-buffer-p buf)
               (e2wm:pst-buffer-set 'main buf))
              (t (e2wm:pst-show-history-main)
                 (e2wm:pst-buffer-set 'right buf))
              ))))

(defun e2wm:web-popup (buf)
  (let ((buf-name (buffer-name buf)))
    (cond
     ((e2wm:web-buffer-p buf)
      (e2wm:pst-buffer-set 'main buf)
      t)
     ((e2wm:history-recordable-p buf)
      (e2wm:pst-buffer-set 'right buf)
      t)
     (t
      (e2wm:dp-two-popup-sub buf)
      t))))

(defun e2wm:web-popup-sub (buf)
  (let ((wm (e2wm:pst-get-wm))
        (not-minibufp (= 0 (minibuffer-depth))))
    (e2wm:with-advice
     (e2wm:pst-buffer-set 'sub buf t not-minibufp))))

(e2wm:pst-class-register
 (make-e2wm:$pst-class
  :name   'web
  :extend 'two
  :title  "Web"
  :init   'e2wm:web-init
  :main   'main
  :switch 'e2wm:web-switch
  :popup  'e2wm:web-popup))


;;;###autoload
(defun e2wm:dp-web () ;[2015/10/01]
  ""
  (interactive)
  (e2wm:pst-change 'web))



(provide 'e2wm_web_pst)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm_web_pst.el ends here
