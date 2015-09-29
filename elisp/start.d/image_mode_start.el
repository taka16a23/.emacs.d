;;; image_mode_start.el --- setting for image mode.
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/10/17 15:04:11 (+0900)
;; Last-Updated: 2014/07/01 17:16:42 (+0900)
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
;;  will load from 81_final_mode_start.el
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;; 2013/10/17    Atami
;;    initialize:
;;
;;
;;; Code:


(eval-when-compile
  (require 'subroutines_start "subroutines_start" 'noerr)
  (require 't1macro "t1macro" 'noerror))


;;;###autoload
(defun image-mode-mode-custom-predefine ()
  "For `eval-after-load' `image-mode' customize."
  (message "eval-after-load: \"image-mode\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun image-mode-mode-predefine ()
  "For `eval-after-load' `image-mode' function."
  (message "eval-after-load: \"image-mode\" setting..")
  )

;;;###autoload
(defun image-mode-mode-map-predefine ()
  "For `image-mode' key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"image-mode\" keymaping.."))
  (define-many-keys image-mode-map
    ("v"           'image-next-line)
    ("f"           'image-forward-hscroll)
    ("s"           'image-backward-hscroll)
    ("w"           'image-previous-file)
    ("e"           'image-previous-file)
    ("l"           'image-forward-hscroll)
    ("j"           'image-backward-hscroll)
    ("n"           'image-next-line)
    ("k"           'image-previous-line)
    ("d"           'image-previous-line)
    ("b"           'image-next-file)
    ("o"           'other-window)
    ( "E" 'text-translator-all-by-auto-selection)
    ))

;;;###autoload
(defun image-mode-mode-face-predefine ()
  "For `image-mode' face."
  (message "eval-after-load: \"image-mode\" Setting faces..")
  )



(provide 'image_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; image_mode_start.el ends here
