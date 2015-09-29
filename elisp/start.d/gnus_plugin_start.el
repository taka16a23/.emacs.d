;;; gnus_plugin_start.el --- functions for gnus
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Thu Dec 13 23:14:00 2012 (+0900)
;; Last-Updated: Thu Dec 13 23:25:37 2012 (+0900)
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


;;;###autoload
(defun gnus-predefine ()
  "For `eval-after-load' gnus function."
  (message "Loading gnus..")
  (gnus-faces-predefine))

;;;###autoload
(defun gnus-faces-predefine ()
  "For gnus key bindings."
  (interactive)
  (face-spec-set 'gnus-group-mail-1-empty-face     '((t (:foreground "aquamarine1"))))
  (face-spec-set 'gnus-group-mail-1-face           '((t (:bold t :foreground "aquamarine1"))))
  (face-spec-set 'gnus-group-mail-2-empty-face     '((t (:foreground "aquamarine2"))))
  (face-spec-set 'gnus-group-mail-2-face           '((t (:bold t :foreground "aquamarine2"))))
  (face-spec-set 'gnus-group-mail-3-empty-face     '((t (:foreground "aquamarine3"))))
  (face-spec-set 'gnus-group-mail-3-face           '((t (:bold t :foreground "aquamarine3"))))
  (face-spec-set 'gnus-group-mail-low-empty-face   '((t (:foreground "aquamarine4"))))
  (face-spec-set 'gnus-group-mail-low-face         '((t (:bold t :foreground "aquamarine4"))))
  (face-spec-set 'gnus-group-news-1-empty-face     '((t (:foreground "PaleTurquoise"))))
  (face-spec-set 'gnus-group-news-1-face           '((t (:bold t :foreground "PaleTurquoise"))))
  (face-spec-set 'gnus-group-news-2-empty-face     '((t (:foreground "turquoise"))))
  (face-spec-set 'gnus-group-news-2-face           '((t (:bold t :foreground "turquoise"))))
  (face-spec-set 'gnus-group-news-3-empty-face     '((t (nil))))
  (face-spec-set 'gnus-group-news-3-face           '((t (:bold t))))
  (face-spec-set 'gnus-group-news-4-empty-face     '((t (nil))))
  (face-spec-set 'gnus-group-news-4-face           '((t (:bold t))))
  (face-spec-set 'gnus-group-news-5-empty-face     '((t (nil))))
  (face-spec-set 'gnus-group-news-5-face           '((t (:bold t))))
  (face-spec-set 'gnus-group-news-6-empty-face     '((t (nil))))
  (face-spec-set 'gnus-group-news-6-face           '((t (:bold t))))
  (face-spec-set 'gnus-group-news-low-empty-face   '((t (:foreground "DarkTurquoise"))))
  (face-spec-set 'gnus-group-news-low-face         '((t (:bold t :foreground "DarkTurquoise"))))
  (face-spec-set 'gnus-splash-face                 '((t (:foreground "Brown"))))
  (face-spec-set 'gnus-summary-cancelled-face      '((t (:background "black" :foreground "yellow"))))
  (face-spec-set 'gnus-summary-high-ancient-face   '((t (:bold t :foreground "SkyBlue"))))
  (face-spec-set 'gnus-summary-high-read-face      '((t (:bold t :foreground "PaleGreen"))))
  (face-spec-set 'gnus-summary-high-ticked-face    '((t (:bold t :foreground "pink"))))
  (face-spec-set 'gnus-summary-high-unread-face    '((t (:bold t))))
  (face-spec-set 'gnus-summary-low-ancient-face    '((t (:italic t :foreground "SkyBlue"))))
  (face-spec-set 'gnus-summary-low-read-face       '((t (:italic t :foreground "PaleGreen"))))
  (face-spec-set 'gnus-summary-low-ticked-face     '((t (:italic t :foreground "pink"))))
  (face-spec-set 'gnus-summary-low-unread-face     '((t (:italic t))))
  (face-spec-set 'gnus-summary-normal-ancient-face '((t (:foreground "SkyBlue"))))
  (face-spec-set 'gnus-summary-normal-read-face    '((t (:foreground "PaleGreen"))))
  (face-spec-set 'gnus-summary-normal-ticked-face  '((t (:foreground "pink"))))
  (face-spec-set 'gnus-summary-normal-unread-face  '((t (nil))))
  (face-spec-set 'gnus-summary-selected-face       '((t (:underline t))))
  )


(provide 'gnus_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; gnus_plugin_start.el ends here
