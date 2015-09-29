;; -*- Mode: Emacs-Lisp -*-

;;; rotate-utf-8-text.scrap.el ---
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec  5 21:21:42 2012 (+0900)
;; Last-Updated: Wed Dec  5 21:22:07 2012 (+0900)
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

(defun rotate-utf-8-text ()
  (let ((inhibit-read-only t))
    (goto-char (point-min))
    (skip-chars-forward " \t\n")
    (when (when (save-excursion (re-search-forward "-\\*-.+-\\*-" nil t))
            ;; delete utf-8
            (save-restriction
              (narrow-to-region (match-beginning 0) (match-end 0))
              (if (search-forward "coding: utf-8")
                  (progn
                    (delete-region (match-beginning 0) (match-end 0))
                    (when (looking-at ";")
                      (delete-char 1))
                    (fixup-whitespace)
                    t)
                nil)))
      ;; insert utf-8 on tail
      (progn
        (goto-char (point-max))
        (search-backward "\n^L" (max (- (point-max) 3000) (point-min)) 'move)
        (when (search-forward "Local Variables:")
          (insert "\n;; coding: utf-8"))))))




;; For Emacs
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; rotate-utf-8-text.scrap.el ends here
