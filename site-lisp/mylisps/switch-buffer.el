;; -*- Mode: Emacs-Lisp -*-

;;; switch-buffer.el --- switch buffer
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:30:34 2012 (+0900)
;; Last-Updated:2015/10/19 02:15:41 (+0900)
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
;;    Modified: `t1-switch--findfile' dir argument to optional.
;;
;; 2015/07/31    Atami
;;    Added: `switch-hotstring' switch to "30_hotstring_plugin_start.el"
;;
;; 2013/11/14    Atami
;;    Modified: `switch-junk',
;;    do `open-junk-file-disable-view-mode' if not exists junks
;;
;; 2013/11/14    Atami
;;    Modified: `switch--regexp' return boolean
;;
;; 2013/10/27    Atami
;;    Added: `switch-message' from subroutines_start.el
;;
;; 2013/03/01    Atami
;;    Added: `switch-snippets'
;;
;; 2013/02/15    Atami
;;    Fixed: `find-file-conf'
;;    exclude intial digit file name.
;;    support "emacs_lisp_mode"
;;
;; 2013/02/10    Atami
;;    Fixed: `switch-allinone'
;;    `my-start-dir' to `my-emacs-dir'
;;
;; 2013/02/06    Atami
;;    Add: internal function `t1-switch--findfile'
;;    Add: `t1-switch-04_bindings_start'
;;    Modified: `switch-allinone', `switch-test_start'
;;    use `t1-switch-04_bindings_start'
;;
;; 2013/01/04    Atami
;;    Modified: launch-or-switch-term
;;    launch from number or metachar.
;;
;; 2012/12/24    Atami
;;    Align: align-let.
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'term-mode-setup "term-mode-setup" 'noerr)
  (require 'environment-setup "environment-setup" 'noerr)
  (require 'subroutines_start "subroutines_start" 'noerr))

(defun t1-switch--findfile (buf-name &optional dir)
  "Switch or find file internal function."
  (if (get-buffer buf-name)
      (switch-to-buffer buf-name)
    (find-file (expand-file-name buf-name dir))))

;;;###autoload
(defun switch-message ()
  "Switch *Messages* buffer."
  (interactive)
  (if (get-buffer "*Messages*")
      (switch-to-buffer "*Messages*")))

;;;###autoload
(defun t1-switch-04_bindings_start ()
  "Switch 04_bindings_start or find file."
  (interactive)
  (t1-switch--findfile "bindings-setup.el" (my-settings-dir-get)))

;;;###autoload
(defun switch-test_start ()
  "Switch test_start.el or find file."
  (interactive)
  (t1-switch--findfile "test-setup.el" (my-settings-dir-get)))

;;;###autoload
(defun switch-hotstring () ;[2015/07/31]
  "Switch to 30_hotstring_plugin_start.el"
  (interactive)
  (t1-switch--findfile "hotstring-setup.el" (my-settings-dir-get)))

;;;###autoload
(defun switch-allinone ()
  "Switch allinone.org or find file."
  (interactive)
  (t1-switch--findfile my-allinone-path))

;;;###autoload
(defun switch-scratch ()
  "Switch *scratch*."
  (interactive)
  (if (get-buffer "*scratch*")
      (switch-to-buffer "*scratch*")))

;;;###autoload
(defun switch-start-dir () ;[2013/11/26]
  ""
  (interactive)
  (find-file (my-inits-dir-get)))

;;;###autoload
(defun switch-dired ()
  "Switch Dired."
  (interactive)
  (let* ((buffers (buffer-list (selected-frame)))
         (buf     (pop buffers))
         done)
    (while (and (not done)
                buf)
      (switch-to-buffer buf)
      (when (eq 'dired-mode major-mode)
        (setq done t))
      (setq buf (pop buffers)))
    (unless done
      (find-file my-emacs-dir))))

(defun switch--regexp (regexp)
  "Switch regexp internal use.
REGEXP: Regular Expression."
  (let ((buffers (buffer-list))
        done)
    (while (and buffers
                (not done))
      (when (string-match regexp (buffer-name (car buffers)))
        (setq done t)
        (switch-to-buffer (car buffers)))
      (setq buffers (cdr buffers)))
    done))

;;;###autoload
(defun switch-junk ()
  "Switch funk file."
  (interactive)
  (unless (switch--regexp "\.junk\.")
    (open-junk-file-disable-view-mode)))

;;;###autoload
(defun switch-snippets ()
  "switch snippets directory as dired."
  (interactive)
  (dired (expand-file-name
          (concat "snippets/"
                  (if (eq 'lisp-interaction-mode major-mode)
                      "emacs-lisp-mode"
                    (symbol-name major-mode)))
          (my-data-dir-get))))

;;;###autoload
(defun switch-ipython ()
  "Switch Ipythn."
  (interactive)
  (let ((ipython-buf "*Python*"))
    (if (get-buffer ipython-buf)
        (switch-to-buffer ipython-buf)
      (run-python)
      (switch-to-buffer ipython-buf)
      )))

;;;; switch major mode conf file
;;
;;;###autoload
(defun find-file-conf ()
  "Find file startup config."
  (interactive)
  (let ((mj (if (eq major-mode 'emacs-lisp-mode)
                "Emacs_Lisp_mode"
              (replace-regexp-in-string "-" "_" (symbol-name major-mode))))
        finded-file)
    (setq finded-file (match-dir-file mj (my-inits-dir-get)
                                      "^[[:digit:]]\\{2\\}\\|\\.elc$"))
    (if finded-file
        (find-file finded-file)
      (find-file (my-inits-dir-join (concat mj "-setup.el"))))))

;;;###autoload
(defun match-dir-file (string directory &optional exclude)
  "Return first matched file name by STRING in DIRECTORY.
EXCUDE is exclude regexp to match file name"
  (let (done
        this-file
        (file-list (directory-files directory)))
    (while (and file-list (not done))
      (setq this-file (car file-list))
      (unless (member this-file '("." ".." "RCS" "CVS" "rcs" "cvs"))
        (when (and (not (file-directory-p this-file))
                   (string-match string this-file)
                   (if exclude
                       (not (string-match exclude this-file))
                     nil))
          (setq done (expand-file-name this-file directory))))
      (setq file-list (cdr file-list)))
    done))

;;;; register buffer
;;
(defvar register-buffer nil)

;;;###autoload
(defun register-buffer (&optional arg)
  (interactive "p")
  (if (eq arg 4) (setq register-buffer nil))
  (when (or (not register-buffer)
            (not (get-buffer register-buffer)))
    (setq register-buffer (current-buffer))
    (minibuffer-message "Set tmp buf %s" (buffer-name (current-buffer))))
  (switch-to-buffer register-buffer))

;;;; switch term
;;
;;;###autoload
(defun launch-or-switch-term ()
  "If exists term buffer then switch it.
If not exists term buffer then create term buffer."
  (interactive)
  (let ((key (cond
              ((eq last-input-event 48) 0) ; 0
              ((eq last-input-event 49) 1) ; 1
              ((eq last-input-event 50) 2) ; 2
              ((eq last-input-event 51) 3) ; 3
              ((eq last-input-event 52) 4) ; 4
              ((eq last-input-event 53) 5) ; 5
              ((eq last-input-event 54) 6) ; 6
              ((eq last-input-event 55) 7) ; 7
              ((eq last-input-event 56) 8) ; 8
              ((eq last-input-event 57) 9) ; 9
              ((eq last-input-event 95) 0) ; _
              ((eq last-input-event 33) 1) ; !
              ((eq last-input-event 34) 2) ; "
              ((eq last-input-event 35) 3) ; #
              ((eq last-input-event 36) 4) ; $
              ((eq last-input-event 37) 5) ; %
              ((eq last-input-event 38) 6) ; &
              ((eq last-input-event 39) 7) ; '
              ((eq last-input-event 40) 8) ; (
              ((eq last-input-event 41) 9) ; )
              (t nil))))
    (cond ((eq key 0) (funcall launch-term))
          ((and (numberp key)
                (get-buffer (format "*terminal<%s>*" key)))
           (switch-to-buffer (format "*terminal<%s>*" key)))
          (t (funcall launch-term)))))



(provide 'switch-buffer)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; switch-buffer.el ends here
