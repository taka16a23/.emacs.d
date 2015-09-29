;;; ascii_plugin_start.el --- functions for ascii
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 18 02:32:26 2012 (+0900)
;; Last-Updated: 2013/11/02 00:27:01 (+0900)
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
;; 2012/12/18    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defun ascii-mode-custom-predefine ()
  "For `eval-after-load' ascii customize."
  (message "eval-after-load: \"ascii\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun ascii-mode-predefine ()
  "For `eval-after-load' ascii function."
  (message "eval-after-load: \"ascii\" setting..")
  )

;;;###autoload
(defun ascii-mode-map-predefine ()
  "For ascii key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"ascii\" keymaping.."))
  )

;;;###autoload
(defun ascii-mode-face-predefine ()
  "For ascii face."
  (message "eval-after-load: \"ascii\" Setting faces..")
  (face-spec-set 'ascii-ascii-face
                 '((((class color) (background dark)) (:background "SkyBlue4"))))
  )



(provide 'ascii_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; ascii_plugin_start.el ends here