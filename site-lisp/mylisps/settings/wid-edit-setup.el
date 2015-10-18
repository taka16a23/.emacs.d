;;; wid-edit-setup.el ---   functions for wid-edit
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Thu Dec 13 23:26:48 2012 (+0900)
;; Last-Updated:2015/10/13 22:28:34 (+0900)
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
  (require 'use-package "use-package" 'noerr))

(use-package wid-edit
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"wid-edit\"")
  (face-spec-set 'widget-button-face            '((t (:bold t))))
  (face-spec-set 'widget-button-pressed-face    '((t (:foreground "red"))))
  (face-spec-set 'widget-documentation-face     '((t (:foreground "lime green"))))
  (face-spec-set 'widget-field-face             '((t (:background "dim gray"))))
  (face-spec-set 'widget-inactive-face          '((t (:foreground "light gray"))))
  (face-spec-set 'widget-single-line-field-face '((t (:background "dim gray"))))
  )



(provide 'wid-edit-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; wid-edit-setup.el ends here


