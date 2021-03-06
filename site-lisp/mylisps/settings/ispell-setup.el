;;; ispell-setup.el ---   Setting for ispell
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 17:23:45 2012 (+0900)
;; Last-Updated:2015/10/19 15:44:12 (+0900)
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
;; 2012/12/12    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'bind-key)
  (require 'use-package "use-package" 'noerr)
  (require 'environment-setup "environment-setup" 'noerr)
  (declare-function my-data-dir-join "environment-setup"))

(use-package ispell
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"ispell\"")
  (require 'environment-setup "environment-setup" 'noerr)
  (if (file-exists-p (my-data-dir-join "words"))
      (setenv "DICTIONARY" (my-data-dir-join "words"))
    (if (file-exists-p "/usr/share/dict/words")
        (setenv "DICTIONARY" (concat "/usr/share/dict/words"))))
  :bind
  (("C-x a w" . ispell-word)
   ("C-x a c" . ispell-complete-word)))



(provide 'ispell-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; ispell-setup.el ends here
