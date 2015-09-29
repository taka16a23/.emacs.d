;; -*- Mode: Emacs-Lisp -*-

;;; rename-old-del.el ---  rename current buffer and delete old file
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 17 19:49:59 2012 (+0900)
;; Last-Updated: 2015/07/19 23:44:42 (+0900)
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
;; 2012/12/17    Atami
;;    initialize
;;
;;
;;; Code:


(require 's nil 'noerror)
(eval-when-compile
  (require '30_header2_plugin_start))

;;;###autoload
(defun rename-old-del (filename &optional confirm)
  "Write current buffer into file FILENAME.
This makes the buffer visit that file, and marks it as not modified.

If you specify just a directory name as FILENAME, that means to use
the default file name but in that directory.  You can also yank
the default file name into the minibuffer to edit it, using \\<minibuffer-local-map>\\[next-history-element].

If the buffer is not already visiting a file, the default file name
for the output file is the buffer name.

If optional second arg CONFIRM is non-nil, this function
asks for confirmation before overwriting an existing file.
Interactively, confirmation is required unless you supply a prefix argument.

If rename, prompt delete old file.
"
  (interactive
   (list (if buffer-file-name
             (read-file-name "Write file: "
                             nil nil nil nil)
           (read-file-name "Write file: " default-directory
                           (expand-file-name
                            (file-name-nondirectory (buffer-name))
                            default-directory)
                           nil nil))
         (not current-prefix-arg)))
  (let ((oldbuf buffer-file-name))
    (or (null filename) (string-equal filename "")
        (progn
          ;; If arg is just a directory,
          ;; use the default file name, but in that directory.
          (if (file-directory-p filename)
              (setq filename (concat (file-name-as-directory filename)
                                     (file-name-nondirectory
                                      (or buffer-file-name (buffer-name))))))
          (and confirm
               (file-exists-p filename)
               (or (y-or-n-p (format "File `%s' exists; overwrite? " filename))
                   (error "Canceled")))
          (set-visited-file-name filename (not confirm))))
    (set-buffer-modified-p t)
    ;; Make buffer writable if file is writable.
    (and buffer-file-name
         (file-writable-p buffer-file-name)
         (setq buffer-read-only nil))
    ;; prompt delete old file.
    (message filename)
    (message oldbuf)
    (when (and (not (eq filename oldbuf))
               (y-or-n-p (format "Delete %s " oldbuf)))
      (delete-file oldbuf)
      (when (and (s-ends-with? ".py" oldbuf)
                 (file-exists-p (s-concat oldbuf "c"))
                 (y-or-n-p (format "Delete %s " (s-concat oldbuf "c"))))
        (delete-file (s-concat oldbuf "c")))
      (unless (file-exists-p oldbuf)
        (message (format "Deleted %s" oldbuf))))
    (update-header-footer)
    (save-buffer)
    ;; It's likely that the VC status at the new location is different from
    ;; the one at the old location.
    (vc-find-file-hook)
    ))



(provide 'rename-old-del)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; rename-old-del.el ends here
