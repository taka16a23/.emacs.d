;;; gnu-art-setup.el ---   functions for gnus-art
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Thu Dec 13 23:04:18 2012 (+0900)
;; Last-Updated:2015/10/19 15:57:30 (+0900)
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

(use-package gnu-art
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"gnu-art\"")
  (custom-set-faces
   '(gnus-emphasis-bold ((t (:bold t))))
   '(gnus-emphasis-bold-italic ((t (:italic t :bold t))))
   '(gnus-emphasis-highlight-words ((t (:italic t :bold t))))
   '(gnus-emphasis-italic ((t (:italic t))))
   '(gnus-emphasis-underline ((t (:underline t))))
   '(gnus-emphasis-underline-bold ((t (:underline t :bold t))))
   '(gnus-emphasis-underline-bold-italic ((t (:underline t :italic t :bold t))))
   '(gnus-emphasis-underline-italic ((t (:underline t :italic t))))
   '(gnus-header-content-face ((t (:italic t :foreground "forest green"))))
   '(gnus-header-from-face ((t (:italic t :foreground "forest green"))))
   '(gnus-header-name-face ((t (:bold t :foreground "spring green"))))
   '(gnus-header-subject-face ((t (:bold t :foreground "orange"))))
   '(gnus-signature-face ((t (:bold t :foreground "khaki")))))
  )



(provide 'gnu-art-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; gnu-art-setup.el ends here
