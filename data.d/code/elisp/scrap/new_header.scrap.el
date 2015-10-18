;; -*- Mode: Emacs-Lisp -*-

;;; new_header.scrap.el ---
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 12:29:47 2012 (+0900)
;; Last-Updated: Sun Dec  9 18:31:15 2012 (+0900)
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


(defun new-header ()
  (interactive)
  (let ((inhibit-read-only t)
        description)
    (goto-char (point-min))
    (when (search-forward-regexp "^;;; .+ ---")
      (setq description (filter-buffer-substring (progn
                                                   (skip-chars-forward " \t")
                                                   (point))
                                                 (progn
                                                   (end-of-line)
                                                   (point))
                                                 nil t)))

    (when (or (search-forward-regexp "^;; .+====================\n" nil t)
              (search-forward-regexp "^;;; code:$" nil t))
      (delete-region (point-min) (point))
      )
    (let ((make-header-hook '(header-mode-line
                              header-title
                              header-blank
                              ;;
                              header-copyright
                              header-blank
                              ;; header-file-name
                              ;; header-description
                              ;;header-status
                              header-author
                              header-maintainer
                              header-version
                              header-creation-date
                              header-modification-date
                              ;;header-rcs-id
                              ;;header-sccs
                              ;; header-modification-author
                              ;; header-update-count
                              header-blank
                              header-end-line
                              header-free-software
                              ;; header-url
                              ;; header-doc-url
                              header-end-line
                              header-commentary
                              header-underline
                              ;; header-keywords
                              ;; header-compatibility
                              header-blank
                              header-lib-requires
                              ;;
                              header-end-line
                              header-history
                              header-underline
                              ;; header-rcs-log
                              header-blank
                              header-code)))
      (make-header)
      (insert description)
      (make-revision)
      (insert "Created this header.")
      )
    ))

(let ((inhibit-read-only t))
  (do-directory-files "/root/.emacs.d/elisp/mylisp/" 'new-header "\\.el\\'")
  )


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; new_header.scrap.el ends here
