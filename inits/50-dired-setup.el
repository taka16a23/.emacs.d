;;; dired-setup.el ---   setting for dired mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 16:13:20 (+0900)
;; Last-Updated:2015/10/21 04:12:37 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'subroutines "subroutines" 'noerr)
  (declare-function windows-p "subroutines")
  (require 'dired "dired" 'noerr)
  (declare-function dired-mark "dired")
  (declare-function dired-read-dir-and-switche "dired")
  (declare-function dired-find-file "dired")
  (declare-function dired-current-directory "dired")
  (declare-function dired-goto-subdir "dired")
  (require 'dired+ "dired+" 'noerr)
  (declare-function dired-get-filename "dired+")
  (declare-function dired-goto-file "dired+")
  (require 'package "package" 'noerr)
  (package-initialize)
  )

;; borrow from dired-aux.el
(defun py:dired-create-directory (directory) ;[2014/01/16]
  "DIRECTORY"
  (interactive
   (list (read-file-name "Create directory: " (dired-current-directory))))
  (let* ((expanded (directory-file-name (expand-file-name directory)))
         (try expanded) new)
    (if (file-exists-p expanded)
        (error "Cannot create directory %s: file exists" expanded))
    ;; Find the topmost nonexistent parent dir (variable `new')
    (while (and try (not (file-exists-p try)) (not (equal new try)))
      (setq new try
            try (directory-file-name (file-name-directory try))))
    ;; (make-directory expanded t)
    (make-directory (concat (file-name-as-directory expanded) "tests") t)
    (shell-command
     (concat "touch " (file-name-as-directory expanded) "tests/__init__.py"))
    (find-file (expand-file-name "__init__.py" expanded))
    )
  )

(use-package dired
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"dired\"")
  (require 'subroutines "subroutines" 'noerr)
  (unless (windows-p)
    (custom-set-variables
     '(dired-listing-switches
       "-l --all --dired --human-readable --group-directories-first --no-group -g")))
  (custom-set-variables
   '(ls-lisp-dirs-first t)
   '(ls-lisp-verbosity nil)
   '(dired-no-confirm '(byte-compile
                        chmod chown compress copy hardlink load
                        move print shell symlink touch uncompress)))
  (custom-set-faces
   '(dired-header ((t (:foreground "Green"))))
   '(dired-directory ((t (:inherit font-lock-function-name-face
                                   :foreground "LimeGreen")))))
  (bind-keys :map dired-mode-map
             ([C-return] . dired-my-advertised-find-file)
             ("r" . revert-buffer)
             ("k" . dired-previous-line)
             ("C-k" . dired-previous-line)
             ("C-m" . dired-my-advertised-find-file)
             ("M-i" . dired-hide-subdir)
             ("C-i" . dired-hide-subdir)
             ("^" . dired-my-up-directory)
             (" " . dired-toggle-mark)
             ("C-M-n" . scroll-up)
             ("C-c C-c" . dired-do-flagged-delete)
             ([backspace] . dired-my-up-directory)
             (" " . dired-toggle-mark)
             ("G" . find-grep)
             ;; test
             ("C-e +" . py:dired-create-directory))
  (use-package dired+
    ;; :disabled
    :ensure t
    :init
    :config
    (message "Loading \"dired+\"")
    (custom-set-variables
     '(diredp-hide-details-initially-flag t)
     '(diredp-wrap-around-flag nil))
    (bind-keys :map dired-mode-map
               ("C-h" . my-backward-seq)
               ((kbd "M-+") . e2wm:toggle-start-stop))
    (custom-set-faces
     '(diredp-file-name ((((background dark)) (:foreground "White"))
                      (t (:foreground "Black"))))
     '(diredp-file-suffix ((((background dark)) (:foreground "Yellow"))
                           (t (:foreground "DarkMagenta"))))
     '(diredp-dir-heading ((((background dark)) (:foreground "Green"))
                           (t (:foreground "Blue" :background "Pink"))))
     '(diredp-dir-name ((((background dark)) (:foreground "Green"))
                        (t (:foreground "Blue" :background "Pink"))))
     '(diredp-dir-priv ((((background dark)) (:foreground "LimeGreen" :background))
                        (t (:foreground "DarkRed" :background "LightGray"))))
     '(diredp-symlink ((((background dark)) (:foreground "cyan")) ; dark cyan
                       (t (:foreground "DarkOrange"))))
     '(diredp-date-time ((((background dark)) (:foreground "cyan")) ; dark cyan
                         (t (:foreground "DarkOrange"))))
     '(diredp-compressed-file-suffix ((((background dark)) (:foreground "Magenta"))
                                      (t (:foreground "DarkMagenta"))))
     '(diredp-number ((((background dark)) (:foreground "Pink"))
                      (t (:foreground "DarkMagenta"))))
     )
    )
  (use-package wdired
    ;; :disabled
    :defer
    :commands wdired-change-to-wdired-mode
    :init
    (bind-keys :map dired-mode-map
               ("w" . wdired-change-to-wdired-mode))
    :config
    (message "Loading \"wdired\"")
    (custom-set-variables
     '(wdired-allow-to-change-permissions (quote advanced)))
    (bind-keys :map wdired-mode-map
               ("C-j" .  backward-char)
               ("C-s" .  wdired-finish-edit)
               ("C-c C-q" . wdired-abort-changes))
    )
  )

;;;; スペースでマークをtoggle (FD like)
;; http://www.bookshelf.jp/cgi-bin/goto.cgi?file=meadow&node=dired-toggle-mark
(defun dired-toggle-mark (arg)
  "Toggle the current (or next ARG) files."
  ;; S.Namba Sat Aug 10 12:20:36 1996
  (interactive "P")
  (let ((dired-marker-char
         (if (save-excursion (beginning-of-line)
                             (looking-at " "))
             dired-marker-char ?\040)))
    (dired-mark arg)
    ;; (dired-previous-line 1)
    ))

(defun dired-my-advertised-find-file ()
  (interactive)
  (let ((kill-target (current-buffer))
        (check-file (dired-get-filename)))
    (funcall 'dired-find-file)
    (if (file-directory-p check-file)
        (kill-buffer kill-target))))

(defun dired-my-up-directory (&optional other-window)
  "Run dired on parent directory of current directory.
  Find the parent directory either in this buffer or another buffer.
  Creates a buffer if necessary."
  (interactive "P")
  (let* ((dir (dired-current-directory))
         (up (file-name-directory (directory-file-name dir))))
    (or (dired-goto-file (directory-file-name dir))
        ;; Only try dired-goto-subdir if buffer has more than one
        (and (cdr dired-subdir-alist)
             (dired-goto-subdir up))
        (progn
          (if other-window
              (dired-other-window up)
            (progn
              (kill-buffer (current-buffer))
              (dired up))
            (dired-goto-file dir))))))

(defun my-dired-today-search (arg)
  "Fontlock search function for dired.
ARG:"
  (search-forward-regexp
   (concat (format-time-string "%b[[:blank:]]+%e" (current-time))) arg t))

(defun dired-mark-el () ;[2013/11/24]
  ""
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "\\.el$" nil 'noerror)
      (dired-mark 1))))



(provide 'dired-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; dired-setup.el ends here
