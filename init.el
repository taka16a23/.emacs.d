;; -*- Mode: Emacs-Lisp -*-

;;; init.el --- Emacs init file.
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:33:26 2012 (+0900)
;; Last-Updated: 2015/09/13 19:25:17 (+0900)
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
;; Directory Tree
;; "tree -d -L 2 --noreport ~/.emacs.d/"
;; ~/.emacs.d/
;; ├── backup_e/
;; │   ├── auto-save/
;; │   ├── etc/
;; │   └── old/
;; ├── data_e/
;; │   ├── ac-dict/
;; │   ├── ahk/
;; │   ├── code/
;; │   ├── diary/
;; │   ├── img/
;; │   ├── insert/
;; │   ├── log/
;; │   ├── pylib/
;; │   ├── ref/
;; │   ├── snippets/
;; │   └── tool/
;; ├── elisp/
;; │   ├── mylisp/
;; │   ├── plugin/
;; │   └── start.d/
;; ├── url/
;; └── var_e/
;;     └── auto-save-list/
;;
;;   |--------+------------------------------------|
;;   | prefix | Description                        |
;;   |--------+------------------------------------|
;;   |     00 | Primary essensial                  |
;;   |     02 | base_start.el                      |
;;   |     04 | bindings_start.el                  |
;;   |     06 | loaddefs_start.el                  |
;;   |     08 | simple_start.el                    |
;;   |--------+------------------------------------|
;;   |  20~60 | Extension  sufix: _plugin_start.el |
;;   |  70~80 | Major mode  sufix: _mode_start.el  |
;;   |--------+------------------------------------|
;;   |     90 | Final                              |
;;   |     92 | face_start.el                      |
;;   |     98 | final_start.el                     |
;;   |--------+------------------------------------|
;;
;; - System に適した prefix file を読み込む。
;; + OS: windows_, linux_, mac_
;; + version: emacs22, emacs23, emacs24
;;   |---------+------------------|
;;   | prefix  | Description      |
;;   |---------+------------------|
;;   | windows | Windows System   |
;;   | linux   | Linux System     |
;;   | mac     | Mac System       |
;;   |---------+------------------|
;;   | emacs22 | Emacs Version 22 |
;;   | emacs23 | Emacs Version 23 |
;;   | emacs24 | Emacs Version 24 |
;;   |---------+------------------|
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;; 2013/03/07    Atami
;;    Added: `during-init-p'
;;    for avoid error ac-sources raise void-variable when init
;;
;; 2012/12/14    Atami
;;    Moved: loaddefs functions to subroutines_start.el
;;
;; 2012/12/10    Atami
;;    Added: Added command line `--loaddef'.
;;
;; 2012/12/09    Atami
;;    Added: Insert commentary of directory tree.
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(defvar during-init-p t "Return t, if during startup.")

;; Debug `--debug-init'
(defvar before-init-el-time nil)
(when init-file-debug
  (setq before-init-el-time       (current-time)
        start-loader-profile-flag t))

(message "\n------ init.el ------")
;;;; My Command line
(defvar make-loaddefs-flag nil)
(defvar mini-emacs nil)
(defvar no-autorecover-init-time-flag nil)
(let ((args (cdr command-line-args))
      done)
  (while (and (not done) args)
    (let ((argi (pop args)))
      (when (string-match "\\`\\(--[^=]*\\)=" argi)
        (setq argi (match-string 1 argi)))
      ;; Set heer command line strings
      (cond
       ;; start loader profile
       ((member argi '("--profile"))
        (setq start-loader-profile-flag t))
       ((member argi '("--mini"))
        (setq mini-emacs t))
       ((member argi '("--loaddefs" "--loaddef"))
        (setq make-loaddefs-flag t))
       ((member argi '("--no-autorecover"))
        (setq no-autorecover-init-time-flag t))
       (t
        (push argi args)
        (setq done t)))))
  (and command-line-args
       (setcdr command-line-args args)))

;;;; Defining & Load path
(setq user-emacs-directory "~/.emacs.d/")

;;;; Subroutines for Start
(load (expand-file-name "elisp/start.d/subroutines_start" user-emacs-directory))

;;;; Constraction loaddefs
(when make-loaddefs-flag
  (require 'constraction-loaddefs nil 'noerror)
  (call-interactively 'constraction-loaddefs))

;;;; Load from directory
;; If  arg option has `--debug-init' profile start-loader.
(start-loader-load my-start-dir)

;;;; TEST
(if init-file-debug
    (benchmark-load "test_start" 'NOERROR)
  (load "test_start" 'NOERROR))

(run-with-timer      15 nil 'run-after-init-timer)
(run-with-idle-timer 30 nil 'run-after-init-idle-timer)

(add-hook 'after-init-hook 'startup-times)
(add-hook 'after-init-hook 'startup-display)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; no-update-autoloads: t
;; End:
;;; init.el ends here
