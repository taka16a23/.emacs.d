;;; elisp-util-setup.el ---    Setting for Emacs Lisp mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/20 01:38:58 (+0900)
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

(use-package elisp-util
  ;; :disabled
  :defer
  :commands
  (t1-elisp-find-tag
   right-parentheses-indent)
  :init
  (require 'bind-key "bind-key" 'noerr)
  (bind-keys :map emacs-lisp-mode-map
             (")" . right-parentheses-indent)
             )
  :config
  (message "Loading \"elisp-util\"")
  )

;; advice eval-last-sexp
(defadvice eval-last-sexp
    (before align-eval-last-sexp activate)
  "Align indent before `eval-last-sexp'."
  (unless buffer-read-only
    (save-excursion
      (let ((orig-line (1+ (count-lines 1 (point))))
            start-line)
        (backward-list 1)
        (indent-and-next (- orig-line (1+ (count-lines 1 (point)))))
        ))))
;; (progn (ad-disable-advice 'eval-last-sexp 'before 'align-eval-last-sexp) (ad-update 'eval-last-sexp))



(provide 'elisp-util-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; elisp-util-setup.el ends here
