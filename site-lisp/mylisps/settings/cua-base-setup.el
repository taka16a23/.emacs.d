;;; cua-base-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/14 12:03:44 (+0900)
;; Last-Updated:2015/10/27 15:01:33 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'edebug "edebug" 'noerr)
  ;; (declare-function cua-base "cua-base")
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function common-view-map-many-register "t1-bind-key")
  (require 'cua-base "cua-base" 'noerr))

(use-package cua-base
  ;; :disabled
  :defer 1
  :commands cua--prefix-override-handler cua-paste
  :init
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (common-view-map-many-register
   '(("b" . cua-scroll-up)
     ("p" . cua-scroll-down)
     ("e" . cua-scroll-down)
     ("C-M-n" . cua-scroll-up)
     ("C-M-k" . cua-scroll-down)))
  :config
  (message "Loading \"cua-base\"")
  (custom-set-variables
   '(cua-mode t nil (cua-base)))
  (define-key cua-global-keymap [C-return] 'open-line-indent)
  (defadvice cua-paste
      (before delete-active-region-before-cua-paste activate)
    (when mark-active
      (delete-region (region-beginning) (region-end)))
    )
  :bind
  (([(control meta ?\s)] . cua-set-rectangle-mark))
  )



(provide 'cua-base-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; cua-base-setup.el ends here
