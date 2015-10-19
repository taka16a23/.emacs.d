;;; fold-dwim-setup.el ---   fold dwin
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:27:08 2012 (+0900)
;; Last-Updated:2015/10/19 13:42:50 (+0900)
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
  (require 'bind-key)
  (require 'use-package "use-package" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  )

(use-package fold-dwim
  ;; :disabled
  :defer
  :ensure t
  :commands
  (fold-dwim-toggle fold-dwim--hide-all fold-dwim-show-all)
  :init
  :config
  (message "Loading \"fold-dwim\"")
  :bind
  (("M-i" . fold-dwim-toggle)
   ("C-x M-i" . fold-dwim-hide-all)
   ("C-x M-I" . fold-dwim-show-all)
   ))



(provide 'fold-dwim-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; fold-dwim-setup.el ends here
