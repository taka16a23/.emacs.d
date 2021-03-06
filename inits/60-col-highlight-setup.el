;;; col-highlight-setup.el ---    column highlight
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:15 2012 (+0900)
;; Last-Updated:2015/10/19 15:40:17 (+0900)
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
  (require 'col-highlight "col-highlight" 'noerr)
    (require 'package "package" 'noerr)
    (package-initialize)
    )

(use-package col-highlight
  ;; :disabled
  :defer
  :ensure t
  :commands column-highlight-mode
  :init
  :config
  (message "Loading \"col-highlight\"")
  (face-spec-set 'col-highlight '((((class color)
                                    (background dark))
                                   (:background "dark slate gray"))
                                  (((class color)
                                    (background light))
                                   (:background "LightSkyBlue1"))
                                  (t
                                   ())))
  )



(provide 'col-highlight-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; col-highlight-setup.el ends here
