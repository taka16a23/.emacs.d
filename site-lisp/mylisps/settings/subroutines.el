;;; subroutines.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/11 10:19:02 (+0900)
;; Last-Updated:2015/10/18 00:32:45 (+0900)
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


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require '00_environment_setup "00_environment_setup" 'noerr)
  (require 'cl nil 'noerr)
  (defvar common-view-map-list)
  (defvar before-init-el-time))

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

(defconst main-desktop-pc-name "qu")

(defun main-desktop-pc-p () ;[2015/09/15]
  "Return non-nil, if this pc is Main Desktop."
  (string-equal (system-name) main-desktop-pc-name))


;; SUB ROUTINES
;; ============================================================================
;;;; view bind
;;
;; (defun default-view-bind-set (keymap)
;;   "Default view map common define.
;; KEYMAP:"
;;   (dolist (keycmd common-view-map-list)
;;     (define-key keymap (car keycmd) (cdr keycmd))))

;;;; Benchmark
;;
(defsubst time-lag (usetime)
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

(defun startup-display ()
  "Default display after init."
  (delete-other-windows)
  (switch-to-buffer "*scratch*")
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

(defun parse-command-line (arg-string) ;[2015/10/11]
  "ARG-STRING"
  (if (member arg-string (cdr command-line-args))
      (progn
        (remove arg-string command-line-args)
        t)
    nil))

(defun narrow-to-line ()
  "Narrowing line."
  (narrow-to-region (line-beginning-position) (line-end-position)))

(defun at-string|comment-p ()
  "Return non-nil if point is in a literal (a comment or string)."
  ;; We don't need to save the match data.
  (nth 8 (syntax-ppss)))


;;;###autoload
(defun list-matched-buffers (re) ;[2014/09/11]
  "RE"
  (interactive)
  (let (buffers)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (string-match re (buffer-name))
          (add-to-list 'buffers buf))))
    buffers))

(defun kill-some-buffers-by-regexp (re) ;[2014/09/09] [2014/09/11]
  "RE"
  (dolist (buf (list-matched-buffers re))
    (kill-buffer buf)))

(defun kill-some-buffers-by-extension (ext) ;[2013/11/25] [2014/09/09]
  "EXT"
  (interactive "sExtension: ")
  (let ((re (format "\\.%s\\'" ext)))
    (message "kill-buffer by %s" re)
    (kill-some-buffers-by-regexp re)
    (message "Finished." )))

(defun delete-buffer-regexp (regexp) ;[2015/08/06]
  ""
  (interactive "sSearch keywords as regexp: ")
  (dolist (buffer (buffer-list))
    (when (string-match regexp (buffer-name buffer))
      (kill-buffer buffer)
      )))



(provide 'subroutines)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; subroutines.el ends here
