;;; dired_mode_start.el --- functions for dired
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 17:30:07 2012 (+0900)
;; Last-Updated: 2015/09/19 22:27:51 (+0900)
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
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'subroutines "subroutines" 'noerr)
  (require 't1macro "t1macro" 'noerr)
  (require 'hl-line "hl-line" 'noerr)
  (require 'dired "dired" 'noerr)
  (require 'wdired "wdired" 'noerr)
  )

;;;###autoload
(defun dired-mode-custom-predefine ()
  "For `eval-after-load' dired customize."
  (message "eval-after-load: \"dired\" customizing..")
  (unless (windows-p)
    (custom-set-variables
     '(dired-listing-switches
       "-l --all --dired --human-readable --group-directories-first --no-group -g")))
  (custom-set-variables
   '(ls-lisp-dirs-first t)
   '(ls-lisp-verbosity nil)
   '(dired-no-confirm (quote (byte-compile
    						  chmod chown compress copy hardlink load
    						  move print shell symlink touch uncompress))))
  )

;;;###autoload
(defun dired-mode-predefine ()
  "For `eval-after-load' dired function."
  (message "eval-after-load: \"dired\" setting..")
  (add-hook 'dired-mode-hook 'dired-mode-hook-predefine)
  (require 'dired+ "dired+" 'noerr)
  ;; Wdired
  (defvar wdired-eval-after-load-hook nil
    "Hook for wdired `eval-after-load'.")
  (add-hook 'wdired-eval-after-load-hook 'wdired-mode-custom-predefine)
  (add-hook 'wdired-eval-after-load-hook 'wdired-mode-predefine 'append)
  (add-hook 'wdired-eval-after-load-hook 'wdired-mode-map-predefine 'append)
  (add-hook 'wdired-eval-after-load-hook 'wdired-mode-face-predefine 'append)
  (run-hooks-after-load "wdired" 'wdired-eval-after-load-hook)
  )

;;;###autoload
(defun dired-mode-map-predefine ()
  "For dired key bindings."
  (interactive)
  ;; (unless (called-interactively-p 'interactive)
    ;; (message "eval-after-load: \"dired\" keymaping.."))
  (define-many-keys dired-mode-map
    ([C-return]  'dired-my-advertised-find-file)
    ("r"         'revert-buffer)
    ("w"         'wdired-change-to-wdired-mode)
    ("k"         'dired-previous-line)
    ("\C-k"      'dired-previous-line)
    ("\C-m"      'dired-my-advertised-find-file)
    ("\M-i"      'dired-hide-subdir)
    ("\C-i"      'dired-hide-subdir)
    ("^"         'dired-my-up-directory)
    (" "         'dired-toggle-mark)
    ("\C-\M-f"   'anything-c-moccur-dired-do-moccur-by-moccur)
    ("\C-\M-n"   'scroll-up)
    ("\C-c\C-c"  'dired-do-flagged-delete)
    ([backspace] 'dired-my-up-directory)
    (" "         'dired-toggle-mark)
    ("G"         'find-grep)
    ;; test
    ("\C-e+"     'py:dired-create-directory)
    ))

;;;###autoload
(defun dired-mode-face-predefine ()
  "For dired face."
  (message "eval-after-load: \"dired\" Setting faces..")
  (face-spec-set
   'dired-directory
   '((t (:inherit font-lock-function-name-face :foreground "LimeGreen"))))
  (custom-set-faces
   '(dired-header ((t (:foreground "Green"))))
   '(dired-directory ((t :foreground "Green")))
   )
  ;; annotation today edited
  (defface my-face-f-2 '((t (:foreground "Red"))) nil :group 'dired)
  (defvar my-face-f-2 'my-face-f-2)
  )

;;;###autoload
(defun dired-mode-hook-predefine ()
  "Dired mode hook."
  ;; (message "Dired hook launched.")
  (hl-line-mode 1)
  (font-lock-add-keywords major-mode
                          (list '(my-dired-today-search . my-face-f-2))))

;;;; dired+
;;
;;;###autoload
(defun dired+-mode-custom-predefine ()
  "For `eval-after-load' dired+ customize."
  (message "eval-after-load: \"dired+\" customizing..")
  (custom-set-variables
   '(diredp-hide-details-initially-flag t)
   '(diredp-wrap-around-flag nil))
  )

;;;###autoload
(defun dired+-mode-predefine ()
  "For `eval-after-load' dired+ function."
  (message "eval-after-load: \"dired+\" setting..")
  )

;;;###autoload
(defun dired+-mode-map-predefine ()
  "For dired+ key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"dired+\" keymaping.."))
  (dired-mode-map-predefine)
  (define-many-keys dired-mode-map
    ("\C-h" 'my-backward-seq)
    ((kbd "M-+") 'e2wm:toggle-start-stop))
  )

;;;###autoload
(defun dired+-mode-face-predefine ()
  "For dired+ face."
  (message "eval-after-load: \"dired+\" Setting faces..")
  (face-spec-set
   'diredp-file-name
   '((((background dark)) (:foreground "White"))
     (t                   (:foreground "Black"))))
  (face-spec-set
   'diredp-file-suffix
   '((((background dark)) (:foreground "Yellow"))
     (t                   (:foreground "DarkMagenta"))))
  (face-spec-set
   'diredp-dir-heading
   '((((background dark)) (:foreground "Green"))
     (t                   (:foreground "Blue" :background "Pink"))))
  (face-spec-set
   'diredp-dir-name
   '((((background dark)) (:foreground "Green"))
     (t                   (:foreground "Blue" :background "Pink"))))
  (face-spec-set
   'diredp-dir-priv
   '((((background dark)) (:foreground "LimeGreen" :background))
     (t                   (:foreground "DarkRed" :background "LightGray"))))
  ;; (face-spec-set
  ;;  'diredp-link-priv
  ;;  '((((background dark)) (:foreground "cyan"))
  ;;    (t                   (:foreground "DarkOrange"))))
  (face-spec-set
   'diredp-symlink
   '((((background dark)) (:foreground "cyan")) ; dark cyan
     (t                   (:foreground "DarkOrange"))))
  (face-spec-set
   'diredp-date-time
   '((((background dark)) (:foreground "LightGray"))
     (t                   (:foreground "DarkGoldenrod4"))))
  (face-spec-set
   'diredp-compressed-file-suffix
   '((((background dark)) (:foreground "Magenta"))
     (t                   (:foreground "DarkMagenta"))))
  (face-spec-set
   'diredp-number
   '((((background dark)) (:foreground "Pink"))
     (t                   (:foreground "DarkMagenta"))))
  )

;;;; スペースでマークをtoggle (FD like)
;; http://www.bookshelf.jp/cgi-bin/goto.cgi?file=meadow&node=dired-toggle-mark
;;;###autoload
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

;;;###autoload
(defun dired-my-advertised-find-file ()
  (interactive)
  (let ((kill-target (current-buffer))
        (check-file (dired-get-filename)))
    (funcall 'dired-find-file)
    (if (file-directory-p check-file)
        (kill-buffer kill-target))))

;;;###autoload
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

;;;###autoload
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

;;;; wdired
;;
;;;###autoload
(defun wdired-mode-hook-predefine ()
  "Wdired mode hook."
  (message "Wdired mode launched.")
  (add-hook 'wdired-mode-hook 'wdired-mode-hook-predefine)
  )

;;;###autoload
(defun wdired-mode-custom-predefine ()
  "For `eval-after-load' wdired customize."
  (message "eval-after-load: \"wdired\" customizing..")
  (custom-set-variables
   '(wdired-allow-to-change-permissions (quote advanced)))
  )

;;;###autoload
(defun wdired-mode-predefine ()
  "For `eval-after-load' wdired function."
  (message "eval-after-load: \"wdired\" setting..")
  (add-hook 'wdired-mode-hook 'wdired-mode-hook-predefine)
  )

;;;###autoload
(defun wdired-mode-map-predefine ()
  "For wdired key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"wdired\" keymaping.."))
  (define-many-keys wdired-mode-map
    ("\C-j"     'backward-char)
    ("\C-s"     'wdired-finish-edit)
    ("\C-c\C-q" 'wdired-abort-changes)
    ))

;;;###autoload
(defun wdired-mode-face-predefine ()
  "For wdired face."
  (message "eval-after-load: \"wdired\" Setting faces..")
  )



(provide 'dired_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; dired_mode_start.el ends here
