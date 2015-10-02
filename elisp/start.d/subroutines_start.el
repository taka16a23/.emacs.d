;;; subroutines_start.el --- subroutines for my Emacs
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:29:02 2012 (+0900)
;; Last-Updated: 2015/10/03 08:15:22 (+0900)
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
;; 2015/10/02    Atami
;;    Added: `my-allinone-path' const variable
;;
;; 2015/09/15    Atami
;;    Added: `main-desktop-pc-p' for predicate main desktop pc
;;
;; 2015/09/15    Atami
;;    Added: `main-desktop-pc-name' for desktop pc name
;;
;; 2015/09/15    Atami
;;    Added: `emacs26-p'
;;
;; 2015/09/15    Atami
;;    Added: `emacs25-p'
;;
;; 2013/10/27    Atami
;;    Modified: `startup-display'
;;
;; 2013/10/27    Atami
;;    Moved: `switch-message' to switch-buffer.el
;;
;; 2013/10/27    Atami
;;    Modified: `emacs22-p', `emacs23-p', `emacs24-p', `darwin-p',
;;    `ns-p', `carbon-p', `mac-p', `linux-p', `colinux-p', `cygwin-p',
;;    `nt-p', `meadow-p', `windows-p'
;;    defvar => defsubst
;;    `x->bool' defun => defsubst
;;
;; 2013/10/26    Atami
;;    Splited file: `define-many-keys' to t1macro.el
;;
;; 2013/10/23    Atami
;;    Fixed: `constraction-loaddefs'
;;    `interactively-p' to `called-interactively-p'
;;
;; 2013/10/17    Atami
;;    Fixed: `constraction-loaddefs'
;;    only do `enable-auto-async-byte-compile-mode' on `emacs-lisp-mode-hook'
;;
;; 2013/02/14    Atami
;;    Fixed: `constraction-loaddefs'
;;    inhibited error when buffer exists.
;;
;; 2013/02/06    Atami
;;    Fixed: `constraction-loaddefs'
;;    Escape error when files does not exists.
;;
;; 2012/12/14    Atami
;;    Added: Added function `constraction-loaddefs'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'cl nil 'noerr)
  (defvar make-loaddefs-flag)
  (defvar my-emacs-dir)
  (defvar common-view-map-list)
  (defvar before-init-el-time))


(custom-set-variables '(user-full-name "Atami"))

(defconst main-desktop-pc-name "qu")

(defvar after-init-timer-hook nil
  "Normal hook timer run after loading the init files.")

(defvar after-init-idle-timer-hook nil
  "Normal hook idle timer run after loading the init files.")

(defun run-after-init-timer ()
  "Run hooks after init."
  (run-hooks 'after-init-timer-hook))

(defun run-after-init-idle-timer ()
  "Run hooks after init idel."
  (run-hooks 'after-init-idle-timer-hook))


(if (boundp 'user-emacs-directory)
	(defconst my-emacs-dir (expand-file-name user-emacs-directory)))

;; Lisp location
(defconst my-elisp-dir
  (file-name-as-directory (concat my-emacs-dir  "elisp"   ))
  "Directory \"~/.emacs.d/elisp\".")

(defconst my-start-dir
  (file-name-as-directory (concat my-elisp-dir  "start.d" ))
  "Directory \"~/.emacs.d/elisp/start.d\".")

(defconst my-plugin-dir
  (file-name-as-directory (concat my-elisp-dir  "plugin"  ))
  "Directory \"~/.emacs.d/elisp/plugin\".")

(defconst my-mylisp-dir
  (file-name-as-directory (concat my-elisp-dir  "mylisp"))
  "Directory \"~/.emacs.d/elisp/mylisp\".")

;; Data location
(defconst my-data-dir
  (file-name-as-directory (concat my-emacs-dir  "data_e"))
  "Directory \"~/.emacs.d/data_e\".")

(defconst my-var-dir
  (file-name-as-directory (concat my-emacs-dir  "var_e"))
  "Directory \"~/.emacs.d/var_e\".")

(defconst my-backup-dir
  (file-name-as-directory (concat my-emacs-dir  "backup_e"))
  "Directory \"~/.emacs.d/backup_e\".")

(defconst my-bk-etc-dir
  (file-name-as-directory (concat my-backup-dir "etc"))
  "Directory \"~/.emacs.d/backup_e/etc\".")

(defconst my-bk-autosave-dir
  (file-name-as-directory (concat my-backup-dir "auto-save"))
  "Directory \"~/.emacs.d/backup_e/auto-save\".")

(defconst my-log-dir
  (file-name-as-directory (concat my-data-dir   "log"))
  "Directory \"~/.emacs.d/data_e/log\".")

(defconst my-code-dir
  (file-name-as-directory (concat my-data-dir "code"))
  "Directory \"~/.emacs.d/data_e/code\".")

(defconst my-allinone-path (expand-file-name "allinone.org" my-emacs-dir)
  "Path to allinone.org.")


;;;; make directory if not exist.
(mapc (lambda (dir)
		(if (and dir (not (file-exists-p dir)))
			(condition-case nil
				(make-directory dir 'parents)
			  (file-error (message "IO error in: %s" dir))))) `(,my-elisp-dir
                                                                ,my-start-dir
                                                                ,my-plugin-dir
                                                                ,my-mylisp-dir
                                                                ,my-data-dir
                                                                ,my-log-dir
																,my-var-dir
                                                                ,my-backup-dir
                                                                ,my-bk-etc-dir
                                                                ,my-bk-autosave-dir))

;; PATH
;; ============================================================================
;; load-path
(if (and (fboundp 'normal-top-level-add-subdirs-to-load-path)
		 (not (member my-elisp-dir load-path)))
    (let ((default-directory my-elisp-dir))
      (setq load-path (cons my-elisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)
	  (setq load-path (delete-dups load-path))))

;; exec-path
(dolist (path (split-string (getenv "PATH") ":"))
  (add-to-list 'exec-path path t))

;; CHECK SYSTEM
;; ============================================================================
(defun x->bool (elt)
  "Return non-nil, ...
ELT:"
  (not (not elt)))

(defun emacs22-p ()
  "Return non-nil, if Emacs Version's 22."
  (equal emacs-major-version 22))

(defun emacs23-p ()
  "Return non-nil, if Emacs Version's 23."
  (equal emacs-major-version 23))

(defun emacs24-p ()
  "Return non-nil, if Emacs Version's 24."
  (equal emacs-major-version 24))

(defun emacs25-p ()
  "Return non-nil, if Emacs Version's 25."
  (equal emacs-major-version 25))

(defun emacs26-p ()
  "Return non-nil, if Emacs Version's 26."
  (equal emacs-major-version 26))

(defun darwin-p ()
  "Return non-nil, if Operation system is darwin."
  (eq system-type 'darwin))

(defun ns-p ()
  "Return non-nil, if featured ns."
  (featurep 'ns))

(defun carbon-p ()
  "Return non-nil, if carbon Emacs."
  (and (eq window-system 'mac) (emacs22-p)))

(defun mac-p ()
  "Return non-nil, if Operation system is MAC."
  (and (eq window-system 'mac) (or (emacs23-p) (emacs24-p))))

(defun linux-p ()
  "Return non-nil, if Operation system is Linux."
  (eq system-type 'gnu/linux))

(defun colinux-p ()
  "Return non-nil, if Operation system is colinux."
  (when (linux-p)
    (let ((file "/proc/modules"))
      (and
       (file-readable-p file)
       (x->bool
        (with-temp-buffer
          (insert-file-contents file)
          (goto-char (point-min))
          (re-search-forward "^cofuse\.+" nil t)))))))

(defun cygwin-p ()
  "Return non-nil, if system type is Cygwin."
  (eq system-type 'cygwin))

(defun nt-p ()
  "Return non-nil, if Operation system is Windows NT."
  (eq system-type 'windows-nt))

(defun meadow-p ()
  "Return non-nil, if Meadow Emacs."
  (featurep 'meadow))

(defun windows-p ()
  "Return non-nil, if Operation system is Windows."
  (or (cygwin-p) (nt-p) (meadow-p)))

(defun main-desktop-pc-p () ;[2015/09/15]
  "Return non-nil, if this pc is Main Desktop."
  (string-equal (system-name) main-desktop-pc-name))


;; SUB ROUTINES
;; ============================================================================
;;;; view bind
;;
(defun default-view-bind-set (keymap)
  "Default view map common define.
KEYMAP:"
  (dolist (keycmd common-view-map-list)
    (define-key keymap (car keycmd) (cdr keycmd))))

;;;; Benchmark
;;
(defun time-lag (usetime)
  "Calc lag by USETIME.
USETIME: before times"
  (let* ((now  (current-time))
         (min  (- (car now) (car usetime)))
         (sec  (- (car (cdr now)) (car (cdr usetime))))
         (msec (/ (- (car (cdr (cdr now)))
                     (car (cdr (cdr usetime))))
				  1000))
         (lag  (+ (* 60000 min) (* 1000 sec) msec)))
    lag))

(defsubst startup-times ()
  "Show start up times."
  (message "------- Times -------")
  (message "total times: %d msec." (time-lag before-init-time))
  (when before-init-el-time
    (message "init.el times: %d msec." (time-lag before-init-el-time)))
  (message "\n\n"))

(defun benchmark-load (file &optional noerr nomess nosuffix must-suffix)
  "Benchmark file load time.
FILE:
NOERR:
NOMESS:
NOSUFFIX:
MUST-SUFFIX:"
  (message (format "loaded %s. %s" (locate-library file)
                   (car (benchmark-run
                            (load file noerr nomess nosuffix must-suffix))))))

;; AFTER REQUIRE
;; ============================================================================
(defvar after-require-idle-delay 45
  "Idle time in seconds after which autoload functions will be loaded.")

(defvar after-require--librarys nil)

(defvar after-require--uniqed-flag nil)

(defvar after-require--timer nil)

(defvar after-require-std-library '())

(defvar after-require-no-requires '("multi-term"
                                    "color-theme"
                                    "color-theme-other"
                                    "color-theme-t1"
                                    "e2wm"
                                    "auto-complete"))


(define-minor-mode after-require-mode
  "Load unloaded autoload functions when Emacs becomes idle.
If `after-require-symbols' is a list of files, those will be loaded.
Otherwise all autoload functions will be loaded.

Loading all autoload functions can easily triple Emacs' memory footprint."
  nil " af-rq" nil
  (if after-require-mode
      ;; on
      (progn
        (unless after-require--timer
          (message "After require mode on")
          (setq after-require--timer
                (run-with-idle-timer after-require-idle-delay
                                     t 'after-require-next))))
    ;; off
    (when after-require--timer
      (cancel-timer after-require--timer)
      (setq after-require--timer nil))))

(defsubst after-require-mode-on ()
  "After require mode on."
  (interactive)
  (after-require-mode 1))

(defsubst after-require-mode-off ()
  "After require mode off."
  (interactive)
  (after-require-mode -1))

(defun after-require-next ()
  "Main."
  (let (library)
    (message "Beginning after-require")
    ;; (setq after-require--count 0)
    ;; uniq list of library
    (when (and (not after-require--uniqed-flag) after-require--librarys)
      (setq after-require--librarys (delete-dups after-require--librarys))
      (dolist (elt after-require-no-requires)
        (setq after-require--librarys (delete elt after-require--librarys)))
      (setq after-require--uniqed-flag t))
    (while (and after-require--librarys
                (not (input-pending-p)))
      (setq library (pop after-require--librarys))
      (condition-case error
          (progn
            (message "After-require: loading %s" library)
            (require (intern (car (last (split-string library "/")))))
            (sit-for after-require-break))
        (error (message "After-require has error loading %s" library)))))
  (when (null after-require--librarys)
    (after-require-mode 0)
    (progn
      (ad-disable-advice 'autoload 'before 'after-require-push)
      (ad-update 'autoload))
    (message "After-require finished")))

(defun after-require-do-remain ()
  "Do require remaining librarys."
  (interactive)
  (if after-require--librarys
      (let ((after-require-break 0))
        (after-require-next))
    (message "after-require: already done.")))

(defun after-require--set-library ()
  "Set standard library."
  (when after-require-std-library
    (dolist (lib after-require-std-library)
      (when (stringp lib)
        (push lib after-require--librarys)))))


;; START LOADER
;; ============================================================================
(defvar start-loader-profile-flag nil "Non-nil means show log buffer.")

(defconst start-loader-buf-name "*start load log*"
  "Start loader buffer file name.")

(defvar start-loader-default-regexp "\\(?:^[[:digit:]]\\{2\\}\\)"
  "Loading file name of regexp.")

(defvar start-loader-Windows-regexp "^Windows_"
  "Loading file name of regexp on Windows OS.")

(defvar start-loader-Linux-regexp "^Linux_"
  "Loading file name of regexp on Linux OS.")

(defvar start-loader-Mac-regexp "^Mac_"
  "Loading file name of regexp on Mac OS.")

(defvar start-loader-nw-regexp "^NoWindow_"
  "Loading file name of regexp on no-window.")

(defvar start-loader-Emacs-version-regexp
  (concat "^Emacs" (int-to-string emacs-major-version) "_")
  "Loading file name of regexp on Emacs Version.")

(defvar start-loader-Main-Desktop-PC-regexp "^MainDesktopPC_"
  "Loading file name of regexp on Main Desktop PC.")

(defun start-loader-load (&optional start-dir)
  "Main.
START-DIR:"
  (let ((start-dir (start-loader-follow-symlink start-dir)))
    ;; (unless (and (stringp start-dir) (file-directory-p start-dir))
        ;; (error "Error: Start-loader could not loads."))
    ;; Default digit
    (start-loader-regexp-load start-loader-default-regexp start-dir t)
    ;; No window
    (and (null window-system) (start-loader-regexp-load start-loader-nw-regexp start-dir))
    ;; Windows
    (and (windows-p) (start-loader-regexp-load start-loader-Windows-regexp start-dir))
    ;; Linux
    (and (linux-p) (start-loader-regexp-load start-loader-Linux-regexp start-dir))
    ;; Mac
    (and (mac-p) (start-loader-regexp-load start-loader-Mac-regexp start-dir))
    ;; Main Desktop PC
    (and (main-desktop-pc-p)
         (start-loader-regexp-load start-loader-Main-Desktop-PC-regexp start-dir))
    ;; Emacs Version
    (start-loader-regexp-load start-loader-Emacs-version-regexp start-dir)
    (add-hook  'after-init-hook 'start-loader-show-log)))

(defun start-loader-follow-symlink (dir)
  "Follow symlink.
DIR:"
  (cond ((file-symlink-p   dir)
         (expand-file-name (file-symlink-p dir)))
        (t (expand-file-name dir))))

(defvar start-loader-run nil)
(defun start-loader-regexp-load (regexp dir &optional sort)
  "Start loader regexp.
REGEXP:
DIR:
SORT:"
  (add-to-list 'load-path dir)
  (dolist (el (start-loader--regexp-load-files regexp dir sort))
    (condition-case err
        ;; load hear
        (if start-loader-profile-flag
            (let ((time (car (benchmark-run (load (file-name-sans-extension el))))))
              (start-loader-log (format "%.7s loaded: %s" time (locate-library el))))
          (load (file-name-sans-extension el)))
      (error
       (start-loader-error-log (format "%s. %s" (locate-library el) (error-message-string err)))
       ))))

(defun start-loader--regexp-load-files (regexp dir &optional sort)
  "Return list of files in DIR by match REGEXP.
REGEXP:
DIR:
SORT:
If optional SORT then return sort of file list by `string<'."
  (let (files)
    (dolist (el (directory-files dir t))
      (when (and (string-match regexp (file-name-nondirectory el))
                 (or (string-match "elc$" el)
                     ;; get only .elc or .el
                     (and (string-match "el$" el)
                          (not (locate-library (concat el "c"))))))
        (setq files (cons (file-name-nondirectory el) files))))
    (if sort (sort files 'string<) files)))

(defvar start-loader-logs nil)
(defvar start-loader-err-logs nil)

(defun start-loader-log (&optional s)
  "Log start loader.
S:"
  (if s (and (stringp s) (push s start-loader-logs))
    (mapconcat 'identity (reverse start-loader-logs) "\n")))

(defun start-loader-error-log (&optional s)
  "Error Log start loader.
S"
  (if s (and (stringp s) (push s start-loader-err-logs))
    (mapconcat 'identity (reverse start-loader-err-logs) "\n")))

(defun start-loader-show-log ()
  "Show logs buffer."
  (if (or start-loader-logs
          start-loader-err-logs)
      (let ((b (get-buffer-create start-loader-buf-name)))
        (with-current-buffer b
          (erase-buffer)
          (when start-loader-err-logs
            (insert "------- error log -------\n\n"
                    (start-loader-error-log)
                    "\n\n"))
          (when start-loader-logs
            (insert "------- init log -------\n\n"
                  (start-loader-log)
                  "\n\n"))
          (goto-char (point-min)))
        (switch-to-buffer b)
        ;; clear variables
        (makunbound 'start-loader-logs)
        (makunbound 'start-loader-err-logs))
    (message "start-loader: Everything OK!!")))

(defun startup-display ()
  "Default display after init."
  (delete-other-windows)
  (if (get-buffer start-loader-buf-name)
      (switch-to-buffer start-loader-buf-name)
    (switch-to-buffer "*scratch*"))
  (split-window-vertically)
  (other-window 1)
  (switch-to-buffer "*Messages*")
  (other-window 1)
  (end-of-buffer-other-window -100))

;;;; recursive directory
;;
(defun recursive-directory (dirs)
  "Recursive directory function.
DIRS: directory"
  (let (stackdirs
        (pending (list dirs)))
    (while pending
      (push (pop pending) stackdirs)
      (let* ((this-dir          (car stackdirs))
             ;; for file-directory-p
             (default-directory this-dir)
             (contents          (directory-files this-dir)))
        (dolist (file contents)
          (unless (member file '("." ".."))
            (when (and (string-match "\\`[[:alnum:]]" file)
                       (file-directory-p file))
              (let ((expanded (expand-file-name file)))
                (setq pending (nconc pending (list expanded)))))))))
    stackdirs))

;;;; start and end Log
;;
(defconst Emacs-log-name-format "Emacs_%Y_%m.log" "Emacs log file name.")

(defvar Emacs-log-default-format
  (concat
   (format-time-string "%Y/%m/%d (%a) %H:%M:%S %Z") ","
   (prin1-to-string system-type) ","
   (user-login-name) ","
   (system-name)))

(defvar Emacs-log-start-format
  (concat
   Emacs-log-default-format ","
   "Start" ","
   ;; TODO: 複数起動なら"multi"の文字列をいれる
   (if init-file-debug "Debug" "Default") ;; multi
   "\n"))

(defvar Emacs-log-exit-format
  (concat
   Emacs-log-default-format ","
   "Exit" "\n"))

(defun Emacs-log-to-file (format time)
  "Emacs log.
FORMAT:
TIME:"
  (let* ((now       time)
         (file-name (concat my-log-dir (format-time-string Emacs-log-name-format now))))
    (write-region (format-time-string format now) nil file-name t 'silent)))

(defsubst Emacs-log-init ()
  "Emacs log init."
  (Emacs-log-to-file Emacs-log-start-format before-init-time))

(defsubst Emacs-log-exit ()
  "Emacs log exit."
  (Emacs-log-to-file Emacs-log-exit-format (current-time)))

(add-hook 'after-init-hook 'Emacs-log-init)
(add-hook 'kill-emacs-hook 'Emacs-log-exit)



(provide 'subroutines_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; subroutines_start.el ends here
