;;; filecache-setup.el ---   setting for filecache
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 16:36:23 (+0900)
;; Last-Updated:2015/10/19 14:41:29 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'environment-setup "environment-setup" 'noerr)
  (declare-function my-var-dir-join "environment-setup")
  (declare-function my-emacs-dir-get "environment-setup")
  (declare-function my-inits-dir-get "environment-setup")
  (declare-function my-site-lisp-dir-get "environment-setup")
  (declare-function file-cache-read-cache-from-file "filecache")
  )

(use-package filecache
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"filecache\"")
  (require 'environment-setup "environment-setup" 'noerr)
  (require 'filecache-ext "filecache-ext" 'noerr)
  (defvar filecache-save-name (my-var-dir-join "filecached_save.el"))
  (custom-set-variables
   '(file-cache-filter-regexps
     (list "~$" "\\.o$" "\\.exe$" "\\.a$" "\\.elc$" ",v$" "\\.output$"
           "\\.$" "#$" "\\.class$" "\\.pyc$")))
  (when (file-exists-p filecache-save-name)
    (message "Loading from %s" filecache-save-name)
    (file-cache-read-cache-from-file filecache-save-name)
    (run-with-idle-timer 300 nil 'filecache-cleaning))
  (file-cache-add-directory (my-emacs-dir-get))
  (file-cache-add-directory (my-inits-dir-get))
  (file-cache-add-directory (my-site-lisp-dir-get))
  (file-cache-add-directory (expand-file-name "~/.pylib"))
  (add-hook 'kill-buffer-hook 'file-cache-add-this-file)
  (add-hook 'kill-emacs-hook '(lambda ()
                                (file-cache-save-cache-to-file
                                 filecache-save-name)))
  )



(provide 'filecache-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; filecache-setup.el ends here
