;;; filecache_start.el ---  function for filecache
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 15:04:50 2012 (+0900)
;; Last-Updated: 2014/08/19 11:01:17 (+0900)
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
;; 2014/08/19    Atami
;;    Modified: `filecache-cleaning'
;;    Each `file-cache-add-directory-recursively' command to dolist.
;;
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'filecache "filecache" 'noerr))

;;;###autoload
(defun filecache-mode-custom-predefine ()
  "For `eval-after-load' filecache customize."
  (message "eval-after-load: \"filecache\" customizing..")
  (custom-set-variables
   '(file-cache-filter-regexps
     (list "~$" "\\.o$" "\\.exe$" "\\.a$" "\\.elc$" ",v$" "\\.output$"
           "\\.$" "#$" "\\.class$" "\\.pyc$")))
  )

;;;###autoload
(defun filecache-mode-predefine ()
  "For `eval-after-load' filecache function."
  (message "eval-after-load: \"filecache\" setting..")
  (add-hook 'kill-buffer-hook 'file-cache-add-this-file)
  (add-hook 'kill-emacs-hook '(lambda ()
                                (file-cache-save-cache-to-file
                                 filecache-save-name)))

  (defvar filecache-save-name (concat my-var-dir "filecached_save.el"))
  (when (file-exists-p filecache-save-name)
    (message "Loading from %s" filecache-save-name)
    (file-cache-read-cache-from-file filecache-save-name)
    (run-with-idle-timer 300 nil 'filecache-cleaning))
  (file-cache-add-directory my-emacs-dir)
  (file-cache-add-directory my-start-dir)
  (file-cache-add-directory my-plugin-dir)
  (file-cache-add-directory (expand-file-name "~/.pylib"))
  )

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
  ;; (file-cache-add-directory-recursively my-emacs-dir)
  ;; (file-cache-add-directory-recursively my-data-dir)
  ;; (file-cache-add-directory-recursively my-elisp-dir)
  ;; (file-cache-add-directory-recursively (expand-file-name "~/.pylib"))
  ;; (file-cache-add-directory-recursively (expand-file-name "~/.zsh"))
  (dolist (path (list my-data-dir
                      my-elisp-dir
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
  ;; (dolist (path (list my-elisp-dir
  ;;                     (concat my-data-dir "snippets/")
  ;;                     (concat my-data-dir "code/")
  ;;                     (expand-file-name "~/.pylib")
  ;;                     (expand-file-name "~/.zsh")
  ;;                     ))
  ;;   (dolist (dir (recursive-directory path))
  ;;     (message "filecached %s" dir)
  ;;     (file-cache-add-directory dir)))
  (file-cache-save-cache-to-file filecache-save-name))



(provide 'filecache_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; filecache_start.el ends here
