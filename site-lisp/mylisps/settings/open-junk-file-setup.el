;;; open-junk-file-setup.el ---   open junk file
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:50 2012 (+0900)
;; Last-Updated:2015/10/19 16:21:33 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 'bind-key)
  (require 'view "view" 'noerr)
  (declare-function my-var-dir-join "environment-setup")
  (require 'package "package" 'noerr)
  (package-initialize)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-ctl-x-bind-keys "t1-bind-key")
  )

(defvar open-junk-file-dir-path (my-var-dir-join "junk"))

(defun open-junk-file-disable-view-mode () ;[2013/11/03]
  ""
  (interactive)
  (open-junk-file)
  (view-mode -1))

;;;###autoload
(defun cleanup-open-junk-files () ;[2014/05/12]
  ""
  (interactive)
  (delete-directory open-junk-file-dir-path 'recursive 'trash))

(use-package open-junk-file
  ;; :disabled
  :defer
  :ensure t
  :commands open-junk-file
  :init
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (t1-ctl-x-bind-keys
   '(("j" . open-junk-file-disable-view-mode)
     ("C-j" . open-junk-file-disable-view-mode)))
  :config
  (message "Loading \"open-junk-file\"")
  (custom-set-variables
   '(open-junk-file-format
     (expand-file-name "%Y-%m-%d-%H%M%S.junk." open-junk-file-dir-path)))
  )



(provide 'open-junk-file-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; open-junk-file-setup.el ends here
