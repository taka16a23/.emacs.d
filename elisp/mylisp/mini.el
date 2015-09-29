;;; mini.el --- minimize buffer text for overview
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/02/27 03:49:48 (+0900)
;; Last-Updated: 2013/11/01 00:20:47 (+0900)
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
;; 2013/02/27    Atami
;;    Created
;;
;;
;;; Code:


(defvar t1-mini-overlay nil)
(make-variable-buffer-local 't1-mini-overlay)

(defface t1-mini-font-face
  '((default :family "DejaVu Sans Mono" :height 30))
  "t1-mini")

(define-minor-mode t1-mini-mode
  ""
  nil "t1-mini" nil
  (cond (t1-mini-mode
         (setq t1-mini-overlay (make-overlay (point-min) (point-max) nil t t))
         (overlay-put t1-mini-overlay 'face 't1-mini-font-face)
         (linum-mode -1)
         (set-window-fringes nil 0 0))
        ((not t1-mini-mode) (delete-overlay t1-mini-overlay))))

;;;###autoload
(defun t1-mini-toggle ()
  "mini toggle"
  (interactive)
  (if t1-mini-mode
      (t1-mini-mode 1)
    (t1-mini-mode -1)))




;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; mini.el ends here
