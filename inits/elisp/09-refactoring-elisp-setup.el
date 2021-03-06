;;; refactoring-elisp-setup.el ---   Setting for Emacs Lisp mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/18 12:37:10 (+0900)
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
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(defun refactoring-elisp-emacs-lisp-mode-hook () ;[2015/10/18]
  ""
  (add-hook 'before-save-hook 'elisp-fit-tail 'append 'local))

(use-package refactoring-elisp
  ;; :disabled
  :defer
  :commands
  (elisp-fit-tail)
  :init
  (add-hook 'emacs-lisp-mode-hook 'refactoring-elisp-emacs-lisp-mode-hook)
  :config
  (message "Loading \"refactoring-elisp\"")
  )



(provide 'refactoring-elisp-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; refactoring-elisp-setup.el ends here
