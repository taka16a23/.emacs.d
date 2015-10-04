;;; 50_open-junk-file_plugin_start.el --- open junk file
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:50 2012 (+0900)
;; Last-Updated: 2015/10/04 16:38:24 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  )

(autoload 'open-junk-file "open-junk-file" nil t)

(defun open-junk-file-disable-view-mode () ;[2013/11/03]
  ""
  (interactive)
  (open-junk-file)
  (view-mode-disable)
  )

(global-set-key "\C-xj" 'open-junk-file-disable-view-mode)
(global-set-key "\C-x\C-j" 'open-junk-file-disable-view-mode)

(defvar open-junk-file-eval-after-load-hook nil
  "Hook for open-junk-file `eval-after-load'.")
(add-hook 'open-junk-file-eval-after-load-hook
          'open-junk-file-mode-predefine 'append)
(run-hooks-after-load "open-junk-file" 'open-junk-file-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 50_open-junk-file_plugin_start.el ends here
