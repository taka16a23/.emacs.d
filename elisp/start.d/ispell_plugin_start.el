;;; ispell_plugin_start.el --- functions for ispell
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 17:27:12 2012 (+0900)
;; Last-Updated: 2013/11/02 00:34:22 (+0900)
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


;;;###autoload
(defun ispell-mode-custom-predefine ()
  "For `eval-after-load' Ispell customize."
  (message "eval-after-load: \"ispell\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun ispell-mode-predefine ()
  "For `eval-after-load' Ispell function."
  (message "eval-after-load: \"ispell\" setting..")
  (if (file-exists-p (concat my-data-dir "words"))
      (setenv "DICTIONARY" (concat my-data-dir "words"))
    (if (file-exists-p "/usr/share/dict/words")
        (setenv "DICTIONARY" (concat "/usr/share/dict/words"))))
  )

;;;###autoload
(defun ispell-mode-map-predefine ()
  "For Ispell key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"ispell\" keymaping.."))
  )



(provide 'ispell_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; ispell_plugin_start.el ends here
