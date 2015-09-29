;;; open-junk-file_plugin_start.el --- functions for open-junk-file
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 18 03:39:49 2012 (+0900)
;; Last-Updated: 2014/05/12 15:39:15 (+0900)
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
;; 2014/05/12    Atami
;;    Modified: `open-junk-file-mode-predefine'
;;    set `open-junk-file-format' variable.
;;
;; 2012/12/18    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'open-junk-file "open-junk-file" 'noerr))

(defvar open-junk-file-dir-path (concat my-var-dir "junk"))
(defvar open-junk-file-my-format "%Y-%m-%d-%H%M%S.junk.")

;;;###autoload
(defun open-junk-file-mode-predefine ()
  "For `eval-after-load' open-junk-file function."
  (message "eval-after-load: \"open-junk-file\" setting..")
  (setq open-junk-file-format
        (expand-file-name open-junk-file-my-format open-junk-file-dir-path)
        ))


;;;###autoload
(defun cleanup-open-junk-files () ;[2014/05/12]
  ""
  (interactive)
  (delete-directory open-junk-file-dir-path 'recursive 'trash))



(provide 'open-junk-file_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; open-junk-file_plugin_start.el ends here
