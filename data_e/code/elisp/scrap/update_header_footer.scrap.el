;; -*- Mode: Emacs-Lisp -*-

;;; update_header_footer.scrap.el ---
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec  5 17:41:07 2012 (+0900)
;; Last-Updated: Wed Dec  5 21:15:41 2012 (+0900)
;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This file is part of Emacs.                                                 ;;
;;                                                                             ;;
;; This file is free software: you can redistribute it and/or modify it under  ;;
;; the terms of the GNU General Public License as published by the Free        ;;
;; Software Foundation, either version 3 of the License, or (at your option)   ;;
;; any later version.                                                          ;;
;;                                                                             ;;
;; This program is distributed in the hope that it will be useful, but WITHOUT ;;
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or       ;;
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for   ;;
;; more details.                                                               ;;
;;                                                                             ;;
;; You should have received a copy of the GNU General Public License along     ;;
;; with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.                ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;
;;; Commentary:
;;  ===========
;;
;;
;;; Change Log:
;;  ===========
;;
;;; Code:

(let ((inhibit-read-only t))
  (dolist (f (directory-files "/root/.emacs.d/elisp/start.d" t "\\.el\\'"))
    (with-current-buffer
        (find-file-noselect f)
      (progn
        (widen)
        (goto-char (point-min))
        (update-header-footer)
        (save-buffer)
        (kill-buffer)
        ))))


(defun do-directory-files (dir func &optional regexp)
  (dolist (f (directory-files (file-name-as-directory (expand-file-name dir)) t regexp))
    (with-current-buffer
        (find-file-noselect f)
      (funcall func))))


;;  For Emacs
;;  Local Variables:
;;  coding: utf-8
;;  no-byte-compile: t
;;  End:
;;; update_header_footer.scrap.el ends here
