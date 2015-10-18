;;; hl-line-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/15 01:47:58 (+0900)
;; Last-Updated:2015/10/15 12:27:12 (+0900)
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
  (require 'use-package "use-package" 'noerr))

(use-package hl-line
  ;; :disabled
  :defer
  :commands
  (hl-line-mode)
  :init
  (add-hook 'dired-mode-hook 'hl-line-mode)
  :config
  (message "Loading \"hl-line\"")
  (face-spec-set 'hlline-face
                 '((((class color)
                     (background dark))
                    (:background "dark slate gray"))
                   (((class color)
                     (background light))
                    (:background "LightSkyBlue1"))
                   (t
                    ()))
                 )
  (face-spec-set 'hl-line
                 '((((class color)
                     (background dark))
                    (:background "dark slate gray"))
                   (((class color)
                     (background light))
                    (:background "LightSkyBlue1"))
                   (t
                    ()))
                 )
  )



(provide 'hl-line-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; hl-line-setup.el ends here
