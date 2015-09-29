;;; 02_base_start.el --- env custom files
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:06 2012 (+0900)
;; Last-Updated: 2014/05/12 15:03:46 (+0900)
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
;; 2013/01/27    Atami
;;    Change Values: `kept-new-versions' 10 to 20
;;    Save more revision.
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'server)
  (require 'subroutines_start nil 'noerror)
  (require 'cua-base nil 'noerror)
  (defvar no-autorecover-init-time-flag))

;;;; Encoding
;;
(set-language-environment     "Japanese")
(prefer-coding-system         'utf-8)
(set-terminal-coding-system   'utf-8)
(set-keyboard-coding-system   'utf-8)
(set-clipboard-coding-system  'utf-8)
(set-default-coding-systems   'utf-8)
(cond ((mac-p)
       (progn
         (require 'ucs-normalize)
         (setq file-name-coding-system 'utf-8-hfs
               locale-coding-system    'utf-8-hfs )))
      ((windows-p)
       (setq file-name-coding-system 'sjis
             locale-coding-system    'utf-8     ))
      (t
       (setq file-name-coding-system 'utf-8
             locale-coding-system    'utf-8     )))

;;;; Return code
;;
(setq eol-mnemonic-dos       "[crlf]"
      eol-mnemonic-unix      "[lf]"
      eol-mnemonic-mac       "[cr]"
      eol-mnemonic-undecided "[?]"   )


;; CUSTOM
;; ============================================================================
;;;; Global mode
;;
(dolist (elt '((show-paren-mode        1)
			   (savehist-mode          1)
			   ;; (auto-image-file-mode   1)
			   ;; (auto-compression-mode  1) ;Edit gz, tar.. file
			   (winner-mode            1)
               (global-auto-revert-moe 1)
			   ))
  (when (fboundp (car elt))
	(apply (car elt) (cdr elt))))

;;;; Allow disabled command
;;
;; (mapatoms
;;  (function
;;   (lambda (symbol)
;;     (when (get symbol 'disabled)
;;       (put symbol 'disabled nil)
;;       (prin1 symbol)
;;       (princ "\n")))))
(dolist (s '(upcase-region
             scroll-left
             dired-find-alternate-file
             downcase-region
             narrow-to-region
             erase-buffer
             set-goal-column
             narrow-to-page))
  (put s 'disabled nil))

;;;; Disable command
;;
;; (dolist (elt '())
  ;; (put elt 'disabled t))

;;;; Disable Goal Colum On
;;
(define-key ctl-x-map "\C-n" nil)

;;;; "yes or no"  =>  "y or n"
;;
(fset 'yes-or-no-p 'y-or-n-p)

;;;; Server
;;
(defun after-init-server ()
  "Launch server after init."
  (when (and window-system
             (require 'server)
             (not (server-running-p)))
    (setq no-autorecover-init-time-flag t)
    (server-start)))

(add-hook 'after-init-timer-hook 'after-init-server)
;; (remove-hook 'after-init-timer-hook 'after-init-server)

;;;; Proxy
;; (setq url-proxy-services '(("http" . "localhost:8339")))

;;;; auto-save-list location "~/.emacs.d/var_e/auto-save-list"
;;
(set 'auto-save-list-file-prefix (concat my-var-dir "auto-save-list/save-"))

;;;; Mouse
;;
;; (mouse-avoidance-mode 'jump)

;;;; No dialog frame
;;
(defalias 'message-box 'message)

;;;; Kill Client Prompt
;;
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;;;; Customize
;;
;; for output

(when window-system
  (custom-set-variables
   '(x-select-enable-clipboard     1)   ; Copy Send To Clipboard
   '(use-dialog-box              nil)   ; No dialog frame
   ))

(custom-set-variables
 '(gc-cons-threshold             5242880) ; default 400000
 '(garbage-collection-messages       nil)
 '(max-lisp-eval-depth              4096) ; Anti Infinite Loop
 '(max-specpdl-size                 3000)
 '(message-log-max                 10000)
 '(inhibit-startup-message             t)
 '(initial-scratch-message           nil)
 '(inhibit-startup-echo-area-message   t)
 '(process-kill-without-query          t) ; Auto kill process when close emacs
 '(x-select-enable-clipboard           t)
 ;; tab
 '(indent-tabs-mode                  nil) ; disable tab
 '(tab-width                           4)
 '(require-final-newline               t) ; file の最後に改行を入れる。
 '(cua-mode t nil             (cua-base))
 ;; '(echo-keystrokes 0.3)
 '(kill-whole-line                     t)
 '(kill-do-not-save-duplicates         t) ; kill ring purge duplicates
 '(bookmark-save-flag                  1)
 '(view-read-only                      t)
 ;; '(visible-bell                      nil)
 '(large-file-warning-threshold 10000000) ; default 10000000(10M)
 '(use-file-dialog                   nil)
 '(auto-revert-interval                7)
 '(yank-excluded-properties            t)
 ;; backup & vc
 '(auto-save-timeout                  10)
 '(auto-save-interval                300)
 '(version-control             'numbered)
 '(vc-command-messages               nil)
 '(kept-old-versions                   1)
 '(kept-new-versions                  20)
 '(delete-old-versions                 t)
 '(backup-by-copying                   t)
 '(backup-by-copying-when-mismatch     t)
  ;; 改名するとファイルの所有者やグループを変更してしまう場合にコピ ーしてバックアップする。
 '(vc-directory-exclusion-list
   (quote ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git"
           ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "etc/data")))

 '(save-place-file (concat my-var-dir "cursor-point-save.el"))
 '(save-place                          t)
 ;; 行の最後が改行で改行がfringeにめりこむ
 '(overflow-newline-into-fringe        t)
 '(savehist-file         (concat my-var-dir "savehist")) ;save history location
 '(bookmark-default-file (concat my-data-dir "bookmarks")) ;Bookmark
 '(server-auth-dir       (expand-file-name "server/" my-var-dir))
 '(url-configuration-directory (concat my-data-dir "url/"))
 '(delete-by-moving-to-trash           t)
 ;; '(trash-directory       (convert-standard-filename (concat temporary-file-directory "Trash")))
 '(enable-local-variables              t)
 '(safe-local-variable-values (quote ((no-check-type-miss . t)
                                      (backup-inhibited . nil)
                                      (version-control quote never))))
 ;; cua
 ;; '(cua-remap-control-v               nil)
 ;; '(cua-remap-control-z nil)
 ;; non-nil = 改行コードの変換を許さない
 '(inhibit-eol-conversion            nil)
 )

(eval-after-load 'cus-edit  '(cus-edit-predefine))
(eval-after-load 'gnus-cite '(gnus-cite-predefine))
(eval-after-load 'message   '(message-predefine))
(eval-after-load 'gnus-art  '(gnus-art-predefine))
(eval-after-load 'gnus      '(gnus-predefine))
(eval-after-load 'wid-edit  '(wid-edit-predefine))
(eval-after-load 'thumbs    '(thumbs-mode-predefine))

;; FILE
;; ============================================================================
;;;; Backups location
;;
(setq backup-directory-alist
      (cons (cons       "^/etc/" my-bk-etc-dir)
            (list (cons       "" my-backup-dir))))

;; Copy linked files, don't rename.
(setq backup-by-copying-when-linked t)


(defsubst force-backup-of-buffer ()
  "Force backup buffer."
  (unless backup-inhibited
    (let ((buffer-backed-up nil))
      (backup-buffer))))

(add-hook 'before-save-hook 'force-backup-of-buffer)

(defvar avoid-old-backup-re "\\(png\\|jpg\\)$")

(defun backup-first-change ()
  "If first change after open file, backup file."
  (when (and (not buffer-backed-up)
             buffer-file-name
             (not (string-match avoid-old-backup-re buffer-file-name)))
    (let ((kept-new-versions 10)
          (kept-old-versions 0)
          (backup-directory-alist (make-backup-old-dir)))
      (message "Make revision %s" buffer-file-name)
      (backup-buffer))))

(add-hook 'first-change-hook 'backup-first-change)

(defun make-backup-revision ()
  "Make revision."
  (interactive)
  (let ((buffer-backed-up nil))
    (backup-first-change)))

(defun make-backup-old-dir ()
  "Make backup dir for old revision."
  (let (dir tmp)
    (dolist (el backup-directory-alist)
      (setq dir (concat (cdr el) "old"))
      (push (cons (car el) dir) tmp)
      (if (and dir (not (file-exists-p dir)))
          (condition-case nil
              (make-directory dir 'parents)
            (file-error (message "IO error in: %s" dir)))))
    (reverse tmp)))


;;;; Auto save
(declare-function msdos-long-file-names "msdos.c")
(declare-function dos-8+3-filename "dos-fns" (filename))

(defun make-auto-save-file-name ()
  "Return file name to use for auto-saves of current buffer.
Does not consider `auto-save-visited-file-name' as that variable is checked
before calling this function.  You can redefine this for customization.
`my-backup-dir' is auto-save location.
See also `auto-save-file-name-p'."
  (if buffer-file-name
      (let ((handler (find-file-name-handler buffer-file-name
                                             'make-auto-save-file-name)))
        (if handler
            (funcall handler 'make-auto-save-file-name)
          (let ((list auto-save-file-name-transforms)
                (filename buffer-file-name)
                (save-location my-bk-autosave-dir)
                result uniq)
            ;; Apply user-specified translations
            ;; to the file name.
            (while (and list (not result))
              (if (string-match (car (car list)) filename)
                  (setq result (replace-match (cadr (car list)) t nil
                                              filename)
                        uniq (car (cddr (car list)))))
              (setq list (cdr list)))
            (if result
                (if uniq
                    (setq filename (concat
                                    (file-name-directory result)
                                    (subst-char-in-string
                                     ?/ ?!
                                     (replace-regexp-in-string "!" "!!"
                                                               filename))))
                  (setq filename result)))
            (setq result
                  (if (and (eq system-type 'ms-dos)
                           (not (msdos-long-file-names)))
                      ;; We truncate the file name to DOS 8+3 limits
                      ;; before doing anything else, because the regexp
                      ;; passed to string-match below cannot handle
                      ;; extensions longer than 3 characters, multiple
                      ;; dots, and other atrocities.
                      (let ((fn (dos-8+3-filename
                                 (file-name-nondirectory buffer-file-name))))
                        (string-match
                         "\\`\\([^.]+\\)\\(\\.\\(..?\\)?.?\\|\\)\\'"
                         fn)
                        (concat (file-name-directory buffer-file-name)
                                "#" (match-string 1 fn)
                                "." (match-string 3 fn) "#"))
                    (concat (expand-file-name save-location)
                            "#"
                            (replace-regexp-in-string "/" "!" filename)
                            "#")))
            ;; Make sure auto-save file names don't contain characters
            ;; invalid for the underlying filesystem.
            (if (and (memq system-type '(ms-dos windows-nt cygwin))
                     ;; Don't modify remote (ange-ftp) filenames
                     (not (string-match "^/\\w+@[-A-Za-z0-9._]+:" result)))
                (convert-standard-filename result)
              result))))

    ;; Deal with buffers that don't have any associated files.  (Mail
    ;; mode tends to create a good number of these.)

    (let ((buffer-name (buffer-name))
          (limit 0)
          file-name)
      ;; Restrict the characters used in the file name to those which
      ;; are known to be safe on all filesystems, url-encoding the
      ;; rest.
      ;; We do this on all platforms, because even if we are not
      ;; running on DOS/Windows, the current directory may be on a
      ;; mounted VFAT filesystem, such as a USB memory stick.
      (while (string-match "[^A-Za-z0-9-_.~#+]" buffer-name limit)
        (let* ((character (aref buffer-name (match-beginning 0)))
               (replacement
                ;; For multibyte characters, this will produce more than
                ;; 2 hex digits, so is not true URL encoding.
                (format "%%%02X" character)))
          (setq buffer-name (replace-match replacement t t buffer-name))
          (setq limit (1+ (match-end 0)))))
      ;; Generate the file name.
      (setq file-name
            (make-temp-file
             (let ((fname
                    (expand-file-name
                     (format "#%s#" buffer-name)
                     ;; Try a few alternative directories, to get one we can
                     ;; write it.
                     (cond
                      ((file-writable-p default-directory) default-directory)
                      ((file-writable-p "/var/tmp/") "/var/tmp/")
                      ("~/")))))
               (if (and (memq system-type '(ms-dos windows-nt cygwin))
                        ;; Don't modify remote (ange-ftp) filenames
                        (not (string-match "^/\\w+@[-A-Za-z0-9._]+:" fname)))
                   ;; The call to convert-standard-filename is in case
                   ;; buffer-name includes characters not allowed by the
                   ;; DOS/Windows filesystems.  make-temp-file writes to the
                   ;; file it creates, so we must fix the file name _before_
                   ;; make-temp-file is called.
                   (convert-standard-filename fname)
                 fname))
             nil "#"))
      ;; make-temp-file creates the file,
      ;; but we don't want it to exist until we do an auto-save.
      (condition-case ()
          (delete-file file-name)
        (file-error nil))
      file-name)))

;;;; prevent delete auto save files when kill-emacs
;;
(defadvice kill-emacs (around inhibit-delete-autosave-file activate)
  "Inhibit delete auto save files."
  (let ((delete-auto-save-files nil))
    ad-do-it
    ))



(provide '02_base_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 02_base_start.el ends here
