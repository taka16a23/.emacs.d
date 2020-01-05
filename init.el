;;; init.el --- Emacs init file.
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:33:26 2012 (+0900)
;; Last-Updated:2020/01/05 21:27:26 (+0900)
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
;;  * 最低限の起動
;;    ** key bind
;;       - pointer の移動は最優先。
;;       - C-d を C-x にしてprefix key とする。
;;       - *scratch* buffer で M-RET を eval-print-last-sexp に割り当て。
;;       - C-x C-c で確実にemacs を終了する。
;;         process のkill で終了させることないようにする。
;;       - C-f isearch
;;       - C-M-k cua-scroll-down
;;       - C-M-n cua-scroll-up
;;    ** file のsave は確実に行えるように。
;;    ** directory 構成の確認と再構成
;;    ** load-path 構成
;;    ** setting customize
;;
;;  ディレクトリは補完がしやすい名前に。
;;  find grep が使いやすいディレクトリ構成にする。
;;  確実に起動する。
;;  起動3秒以内。
;;  user-data
;;  parse-command-line
;;  package
;;  setting
;;  site-lisp
;;  lib
;;  environments.el
;;
;;  load-path
;;
;;  start-loader
;;  byte-compile if source is newer than binary
;;  pre-constraction-loaddef
;;  if flaged then make loaddefs at init
;;  if exists loaddefs then load it
;;
;;  ;;;; Pakage Management ;;;;
;;  if not package then try install it.
;;  if failed install or load package then skip and message.
;;
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


(defvar before-init-el-time (current-time))
(defvar during-init-p t "Return t, if during startup.")

(message "\n------ init.el ------")
(require 'package "package" 'noerr)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;;;; Load from directory
(require 'init-loader "init-loader" 'noerr)
(unless init-file-debug ;not Debug `--debug-init'
  (setq init-loader-show-log-after-init nil))
(setq init-loader-byte-compile t)
(init-loader-load)
;; for mac
(defcustom init-loader-mac-regexp "\\`mac-"
  "Regular expression of Mac specific configuration file names."
  :group 'init-loader
  :type 'regexp)
(let ((init-dir (init-loader-follow-symlink init-loader-directory))
      )
  (when (string-equal system-type "darwin")
    (init-loader-re-load init-loader-mac-regexp init-dir))
)

;; (run-with-timer      15 nil 'run-after-init-timer)
;; (run-with-idle-timer 30 nil 'run-after-init-idle-timer)

;; (add-hook 'after-init-hook 'startup-times)
;; (add-hook 'after-init-hook 'startup-display)

(setq during-init-p nil)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; no-update-autoloads: t
;; End:
;;; init.el ends here
