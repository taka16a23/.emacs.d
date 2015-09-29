;;; 30_header2_plugin_start.el --- setting for header2
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2012/12/09 18:25:57 (+0900)
;; Last-Updated: 2015/09/24 13:51:58 (+0900)
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
;; 2013/11/14    Atami
;;    Modified: `make-revision' impremented `which-func' and insert.
;;
;; 2013/11/14    Atami
;;    Modified: `make-revision' impremented yasnippet.
;;
;; 2013/01/27    Atami
;;    Fixed: `make-revision'
;;    Raise error if buffer is read only.
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'which-func "which-func" 'noerr)
  (require 'yasnippet "yasnippet" 'noerr))

;; (eval-when-compile
(require 'header2)
;; )

(setq-default make-header-hook '(header-title
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
                                 header-code
                                 header-eof
                                 ))

(defvar file-footer-update-alist '(update-tail-file-name
                                   update-provide-name))

;; (unless window-p
(add-hook 'write-file-hooks 'auto-update-file-header)
;; )

(setq-default header-copyright-notice
              (concat "Copyright (C) "
                      (format-time-string "%Y " (current-time)) user-full-name "\n"))

(setq file-header-update-alist nil)

(setq header-date-format "%Y/%m/%d %T (%z)") ;ex. 2013/01/15 20:31:34 (+0900)

(register-file-header-action
 (concat "^" header-prefix-string ".+Last-Updated[ \t]*:") 'update-last-modified-date)

(setq-default header-free-software
              "\
This file is part of Emacs.

This file is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option)
any later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
more details.

You should have received a copy of the GNU General Public License along
with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
 ")

(defun header-mode-line ()
  "Insert a \" -*- Mode: \" line."
  (let* ((mode-declaration  (concat " -*- Mode: " (true-mode-name)
                                    (if (assoc 'c-style (buffer-local-variables))
                                        (concat "; C-Style: " (symbol-name c-style))
                                      "")
                                    " -*- \n"))
         (md-length         (length mode-declaration)))
    (insert (cond ((and comment-start (= 1 (length comment-start)))
                   ;; Assume comment start char is also fill char.
                   (concat comment-start comment-start
                           mode-declaration))
                  (comment-start-p      ; Assume spaces fill the gaps.
                   (concat comment-start
                           mode-declaration))
                  (t                    ; No comment-start.  Assume Lisp.
                   (concat ";;"
                           mode-declaration
                           )))
            "\n")))

(defun header-multiline ()
  "Insert multiline comment.  The comment text is in `header-multiline'."
  (let ((lineno  1)
        beg end nb-lines)
    (beginning-of-line)
    (if comment-end-p
        (insert "\n" comment-start)
      (header-blank)
      (insert header-prefix-string))
    (setq beg  (point))
    (insert header-multiline)
    (setq end       (point-marker)
          nb-lines  (count-lines beg end))
    (goto-char beg)
    (forward-line 1)
    (while (< lineno nb-lines)
      (insert header-prefix-string)
      (forward-line 1)
      (setq lineno  (1+ lineno)))
    (goto-char end)
    (when comment-end-p (insert "\n"))
    (insert comment-end)
    (insert "\n")
    ;; (unless comment-end-p
    ;;   (header-blank)
    ;;   (header-end-line))
    ))

(defun header-make-string (str)
  "Insert underline STR."
  (let (start end)
    (save-excursion
      (forward-line -1)
      (beginning-of-line)
      (skip-chars-forward (concat comment-start " "))
      (setq start (current-column))
      (search-forward ":" nil t)
      (setq end (current-column)))
    (insert (concat header-prefix-string " " (make-string (- end start) str) "\n"))
    ))

(defsubst header-underline ()
  "Insert underline."
  (header-make-string ?=))

(defsubst header-end-line ()
  "Insert a divider line."
  (insert (cond (comment-end-p comment-end)
                ((and comment-start (= 1 (length comment-start)))
                 (make-string 79 (aref comment-start 0)))
                (comment-start-p comment-start)
                (t (make-string 79 ?\;)))
          "\n"))

(defsubst header-author ()
  "Insert current user's name (`user-full-name') as this file's author."
  (insert header-prefix-string "Author: " "      " (user-full-name) "\n"))

(defsubst header-maintainer ()
  "Insert \"Maintainer: \" line."
  (insert header-prefix-string "Maintainer: " "  " (user-full-name) "\n"))

(defsubst header-creation-date ()
  "Insert today's time, date, and time zone as file creation date."
  (insert header-prefix-string "Created:      ")
  (insert (header-date-string) "\n"))

(defsubst header-modification-date ()
  "Insert todays date as the time of last modification.
This is normally overwritten with each file save."
  (insert header-prefix-string "Last-Updated: " (header-date-string) "\n"))

(defsubst header-version ()
  "Insert lines to record version information."
  (insert header-prefix-string "Version: " "     1.0" "\n"))

(defsubst header-eof ()
  "Insert comment indicating end of file."
  (goto-char (point-max))
  (insert "\n")
  ;; (unless comment-end-p (header-end-line))
  (insert
   ;; Local variables
   "\n\n"
   header-prefix-string "For Emacs\n"
   header-prefix-string "Local Variables:\n"
   header-prefix-string "coding: utf-8\n"
   (if (y-or-n-p "Local Variables: byte compile this file?") ""
     (concat header-prefix-string "no-byte-compile: t\n"))
   header-prefix-string "End:\n"
   comment-start
   (concat (and (= 1 (length comment-start)) header-prefix-string)
           (if (buffer-file-name)
               (file-name-nondirectory (buffer-file-name))
             (buffer-name))
           " ends here"
           (if comment-end-p comment-end "\n"))))

;;;; updater
;;
(defun make-revision ()
  "Prepare for a new history revision.  Insert history line if inexistant."
  (interactive "*")
  (setq comment-start (or comment-start "\;")) ; Use Lisp comment as default.
  (require 'which-func "which-func" 'noerr)
  (let ((infunc-name (which-function))
        (header-prefix-string   (header-prefix-string))
        (logical-comment-start  (if (= 1 (length comment-start))
                                    (concat comment-start comment-start " ")
                                  comment-start)))
    ;; Look for the history line
    (beginning-of-buffer)               ; Leave a mark behind.
    (if (re-search-forward (concat "^\\(" (and comment-start
                                               (regexp-quote comment-start))
                                   (regexp-quote (header-prefix-string)) "\\|"
                                   (if (and comment-start
                                            (not (string= "" comment-start)))
                                       (concat "\\|"
                                               (regexp-quote comment-start))
                                     "")
                                   "\\)" " *\\(" header-history-label
                                   "\\|HISTORY\\)") ; Backward compatibility.
                           header-max t)
        (progn
          (forward-line 1)
          (end-of-line))
      ;; We did not find a history line, add one
      (goto-char (point-min))
      ;; find the first line that is not part of the header
      (while (and (< (point) header-max)
                  (looking-at (concat "[ \t]*\\("
                                      (regexp-quote (header-prefix-string))
                                      (if (and comment-start
                                               (not (string= "" comment-start)))
                                          (concat "\\|" (regexp-quote comment-start))
                                        "")
                                      (if (and comment-end (not (string= "" comment-end)))
                                          (concat "\\|" (regexp-quote comment-end))
                                        "")
                                      "\\)")))
        (forward-line 1))
      (insert "\n" logical-comment-start header-history-label)
      (save-excursion (insert "\n" comment-end)))
    ;; We are now on the line with the header-history-label label
    (insert "\n" header-prefix-string
            "\n" header-prefix-string
            (format-time-string "%Y/%m/%d")
            "    " (user-full-name)
            ;;"  |>Ident<|\n"
            "  \n" header-prefix-string "   ")
    (save-excursion
      (when infunc-name
        (insert (format "`%s'" infunc-name))))
    ;; for yasnippet
    (insert "revision_words")
    (require 'yasnippet "yasnippet" 'noerr)
    (yas-expand)
    ))

(defsubst update-header-file-name ()
  "Update header file name.
;;; buffer-file-name --- ."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "^;;; .+ ---"
                    (concat ";;; " (file-name-nondirectory buffer-file-name) " --- "))))

(defsubst update-tail-file-name ()
  "Update tail file name. buffer-file-name ends here"
  (interactive)
  (replace-regexp "^;;; .+ ends here"
                  (concat ";;; " (file-name-nondirectory buffer-file-name) " ends here\n")))

(defsubst update-provide-name ()
  "Update provide name. (provide 'buffer-file-name) "
  (interactive)
  (replace-regexp "^(provide '.+)"
                  (concat "(provide '"
                          (file-name-nondirectory (file-name-sans-extension buffer-file-name))
                          ")")))

(defsubst update-last-modified-date ()
  "Update the line that indicates the last-modified date."
  (delete-and-forget-line)
  (insert " " (header-date-string)))

(defun update-footer ()
  "Update-file-header-footer."
  (interactive)
  (save-excursion
    (save-restriction
      (goto-char (point-max))
      (search-backward "\n^L" (max (- (point-max) 3000) (point-min)) 'move)
      (narrow-to-region (point) (point-max))
      (let ((inhibit-read-only t))
        (dolist (func file-footer-update-alist)
          (save-excursion
            (funcall func)
            ))))))

(defun update-header-footer ()
  (interactive)
  (update-header-file-name)
  (update-file-header)
  (update-footer)
  )



(provide '30_header2_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 30_header2_plugin_start.el ends here
