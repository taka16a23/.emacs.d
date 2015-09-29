;;; 22_savekill_plugin_start.el --- save kill ring on disk
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:45 2012 (+0900)
;; Last-Updated: 2013/01/24 17:17:41 (+0900)
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
;; 2013/01/15    Atami
;;    fix: deadviced `kill-new' on WINDOWS system.
;;
;; 2012/12/17    Atami
;;    fix: Added `kill-ring-log-file' docstrings.
;;
;; 2012/12/12    Atami
;;    Added: defadvice `kill-new'
;;    logging all of kill-ring.
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(when (windows-p)
  (add-to-list 'after-require-no-requires "savekill"))

(unless (and (windows-p)
             (boundp 'usb-drive-letter))
  (require 'savekill)
  (setq save-kill-file-name (concat my-var-dir "kill-ring-saved.el"))
;;;; kill ring log
;;
  (defvar kill-ring-log-file (concat my-log-dir "kill-ring-log_%Y_%m.org")
    "Kill ring log file name.")
  (message "Enable to kill text log.")
  (defadvice kill-new (before kill-ring-log activate)
    (write-region (concat "\n* " (format-time-string "%c") "\n"
                          string)
                  nil (format-time-string kill-ring-log-file (current-time)) t 'silent)))


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 22_savekill_plugin_start.el ends here