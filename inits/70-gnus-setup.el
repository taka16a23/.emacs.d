;;; gnus-setup.el ---   functions for gnus
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Thu Dec 13 23:14:00 2012 (+0900)
;; Last-Updated:2015/10/19 18:36:19 (+0900)
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

(use-package gnus
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"gnus\"")
  (custom-set-faces
   '(gnus-group-mail-1-empty-face ((t (:foreground "aquamarine1"))))
   '(gnus-group-mail-1-face ((t (:bold t :foreground "aquamarine1"))))
   '(gnus-group-mail-2-empty-face ((t (:foreground "aquamarine2"))))
   '(gnus-group-mail-2-face ((t (:bold t :foreground "aquamarine2"))))
   '(gnus-group-mail-3-empty-face ((t (:foreground "aquamarine3"))))
   '(gnus-group-mail-3-face ((t (:bold t :foreground "aquamarine3"))))
   '(gnus-group-mail-low-empty-face ((t (:foreground "aquamarine4"))))
   '(gnus-group-mail-low-face ((t (:bold t :foreground "aquamarine4"))))
   '(gnus-group-news-1-empty-face ((t (:foreground "PaleTurquoise"))))
   '(gnus-group-news-1-empty-face ((t (:foreground "PaleTurquoise"))))
   '(gnus-group-news-2-empty-face ((t (:foreground "turquoise"))))
   '(gnus-group-news-2-face ((t (:bold t :foreground "turquoise"))))
   '(gnus-group-news-3-empty-face ((t (nil))))
   '(gnus-group-news-3-face ((t (:bold t))))
   '(gnus-group-news-4-empty-face ((t (nil))))
   '(gnus-group-news-4-face ((t (:bold t))))
   '(gnus-group-news-5-empty-face ((t (nil))))
   '(gnus-group-news-5-face ((t (:bold t))))
   '(gnus-group-news-6-empty-face ((t (nil))))
   '(gnus-group-news-6-face ((t (:bold t))))
   '(gnus-group-news-low-empty-face ((t (:foreground "DarkTurquoise"))))
   '(gnus-group-news-low-face ((t (:bold t :foreground "DarkTurquoise"))))
   '(gnus-splash-face ((t (:foreground "Brown"))))
   '(gnus-summary-cancelled-face ((t (:background "black" :foreground "yellow"))))
   '(gnus-summary-high-ancient-face ((t (:bold t :foreground "SkyBlue"))))
   '(gnus-summary-high-read-face ((t (:bold t :foreground "PaleGreen"))))
   '(gnus-summary-high-ticked-face ((t (:bold t :foreground "pink"))))
   '(gnus-summary-high-unread-face ((t (:bold t))))
   '(gnus-summary-low-ancient-face ((t (:italic t :foreground "SkyBlue"))))
   '(gnus-summary-low-read-face ((t (:italic t :foreground "PaleGreen"))))
   '(gnus-summary-low-ticked-face ((t (:italic t :foreground "pink"))))
   '(gnus-summary-low-unread-face ((t (:italic t))))
   '(gnus-summary-normal-ancient-face ((t (:foreground "SkyBlue"))))
   '(gnus-summary-normal-read-face ((t (:foreground "PaleGreen"))))
   '(gnus-summary-normal-ticked-face ((t (:foreground "pink"))))
   '(gnus-summary-normal-unread-face ((t (nil))))
   '(gnus-summary-selected-face ((t (:underline t)))))
  )



(provide 'gnus-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; gnus-setup.el ends here
