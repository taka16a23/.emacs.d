;;; check-misspell-setup.el ---   Setting for check-misspell
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 16:21:40 2012 (+0900)
;; Last-Updated:2015/10/13 18:02:26 (+0900)
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
;; 2013/01/27    Atami
;;    Fixed: `typemiss-list'
;;    `setq' to `setq-default'
;;
;; 2012/12/12    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'check-misspell "check-misspell" 'noerr)
  )

(use-package check-misspell
  ;; :disabled
  :defer
  :commands
  (check-misspell)
  :init
  (add-hook 'before-save-hook 'check-misspell)
  :config
  (message "Loading \"check-misspell\"")
  (setq-default typemiss-list '( ("eamcs"              . "emacs")
                                 ("defualt"            . "default")
                                 ("formart"            . "format")
                                 ("pyhton"             . "python")
                                 ("\\_<\\(ture\\)\\_>" . "true")
                                 ("windwos"            . "windows")))
  )



(provide 'check-misspell-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; no-check-type-miss: t
;; End:
;;; check-misspell-setup.el ends here


