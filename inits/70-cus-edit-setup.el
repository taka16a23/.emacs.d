;;; cus-edit-setup.el ---   functions for customize
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Thu Dec 13 22:03:09 2012 (+0900)
;; Last-Updated:2015/10/19 18:33:59 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 'environment-setup "environment-setup" 'noerr)
  (declare-function my-var-dir-join "environment-setup"))

(use-package cus-edit
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"cus-edit\"")
  (require 'environment-setup "environment-setup" 'noerr)
  (setq-default custom-file (my-var-dir-join "custom_temp.el"))
  (custom-set-faces
   '(custom-button-face ((t (nil))))
   '(custom-changed-face ((t (:background "blue" :foreground "white"))))
   '(custom-documentation-face ((t (nil))))
   '(custom-face-tag-face ((t (:underline t))))
   '(custom-group-tag-face ((t (:underline t :foreground "light blue"))))
   '(custom-group-tag-face-1 ((t (:underline t :foreground "pink"))))
   '(custom-invalid-face ((t (:background "red" :foreground "yellow"))))
   '(custom-modified-face ((t (:background "blue" :foreground "white"))))
   '(custom-rogue-face ((t (:background "black" :foreground "pink"))))
   '(custom-saved-face ((t (:underline t))))
   '(custom-set-face ((t (:background "white" :foreground "blue"))))
   '(custom-state-face ((t (:foreground "lime green"))))
   '(custom-variable-button-face ((t (:underline t :bold t))))
   '(custom-variable-tag-face ((t (:underline t :foreground "light blue")))))
  )



(provide 'cus-edit-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; cus-edit-setup.el ends here
