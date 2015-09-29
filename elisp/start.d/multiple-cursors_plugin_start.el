;;; multiple-cursors_plugin_start.el --- functions for multiple-cursors
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Thu Dec 13 00:20:32 2012 (+0900)
;; Last-Updated: 2013/11/01 22:48:48 (+0900)
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
;; 2012/12/13    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (defvar mc/list-file)
  (defvar mc/cmds-to-run-once)
  (defvar my-data-dir)
  (require 't1macro "t1macro" 'noerr)
  (require 'multiple-cursors "multiple-cursors" 'noerr)
  (require 'subroutines_start "subroutines_start" 'noerr))

;;;###autoload
(defun multiple-cursors-mode-predefine ()
  "For `eval-after-load' multiple-cursors function."
  (message "eval-after-load: \"multiple-cursors\" setting..")
  (setq mc/list-file (concat my-data-dir "multi-cursor-list.el"))
  (dolist (elt '(mc/next-line
                 mc/previous-line
                 mc/forward-char
                 mc/backward-char))
    (add-to-list 'mc/cmds-to-run-once elt))
  )

;;;###autoload
(defun multiple-cursors-mode-map-predefine ()
  "For multiple-cursors key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"multiple-cursors\" keymaping.."))
  (define-many-keys mc/keymap
    ("\C-\M-N" 'mc/next-line)
    ("\C-\M-K" 'mc/previous-line)
    ("\C-\M-L" 'mc/forward-char)
    ("\C-\M-J" 'mc/backward-char)
    ("\C-\M-I" 'mc/insert-numbers)
    ))

(defun mc/next-line ()
  "For multiple-cursors `next-line'."
  (interactive)
  (next-line))

(defun mc/previous-line ()
  "For multiple-cursors `previous-line'."
  (interactive)
  (previous-line))

(defun mc/forward-char ()
  "For multiple-cursors `forward-char'."
  (interactive)
  (forward-char))

(defun mc/backward-char ()
  "For multiple-cursors `backward-char'."
  (interactive)
  (backward-char))


(provide 'multiple-cursors_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; multiple-cursors_plugin_start.el ends here
