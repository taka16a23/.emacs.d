;;; filecache-ext.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/12 12:06:57 (+0900)
;; Last-Updated:2015/10/12 12:07:53 (+0900)
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


;;;###autoload
(defun file-cache-save-cache-to-file (file)
  "Save contents of `file-cache-alist' to FILE.
For later retrieval using `file-cache-read-cache-from-file'"
  (interactive "FFile: ")
  (with-temp-file (expand-file-name file)
    (prin1 file-cache-alist (current-buffer))))

;;;###autoload
(defun file-cache-read-cache-from-file (file)
  "Clear `file-cache-alist' and read cache from FILE.
The file cache can be saved to a file using `file-cache-save-cache-to-file'."
  (interactive "fFile: ")
  (file-cache-clear-cache)
  (with-current-buffer (find-file-noselect file)
    (progn
      (goto-char (point-min))
      (setq file-cache-alist (read (current-buffer)))
      (kill-buffer (current-buffer)))))

;;;###autoload
(defun file-cache-add-this-file ()
  (and buffer-file-name
       (file-exists-p buffer-file-name)
       (file-cache-add-file buffer-file-name)))

;;;###autoload
(defun filecache-cleaning ()
  (interactive)
  (message "filecache cleaning..")
  (file-cache-clear-cache)
  (dolist (path (list (my-data-dir-get)
                      (my-elisp-dir-get)
                      (expand-file-name "~/.pylib")
                      ;; (expand-file-name "~/.zsh/scripts")
                      ))
    (message "filecaching recursive %s" path)
    (file-cache-add-directory-recursively path))
  ;; ~/.zsh
  (file-cache-add-file (expand-file-name "~/.zsh/.zshrc"))
  (file-cache-add-file (expand-file-name "~/.zsh/.Xmodmap"))
  (file-cache-add-file (expand-file-name "~/.zsh/.zshenv"))
  (file-cache-add-file (expand-file-name "~/.zsh/.zsh_history"))
  (file-cache-save-cache-to-file filecache-save-name))



(provide 'filecache-ext)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; filecache-ext.el ends here
