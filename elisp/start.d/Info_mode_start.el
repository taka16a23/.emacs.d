;;; Info_mode_start.el --- functions for Info mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 17:43:38 2012 (+0900)
;; Last-Updated: 2013/11/02 16:50:46 (+0900)
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
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'info "info" 'noerr))

;;;###autoload
(defun Info-mode-custom-predefine ()
  "For `eval-after-load' `Info-mode' customize."
  (message "eval-after-load: \"Info-mode\" customizing..")
  (custom-set-variables
   '(x-stretch-cursor nil))
  )

;;;###autoload
(defun Info-mode-predefine ()
  "For `eval-after-load' `Info-mode' function."
  (message "eval-after-load: \"Info-mode\" setting..")
  (add-to-list 'Info-additional-directory-list
               (concat my-emacs-dir "data_e/ref/info")))

;;;###autoload
(defun Info-mode-map-predefine ()
  "For `Info-mode' key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"Info-mode\" keymaping.."))
  (default-view-bind-set Info-mode-map)
  (define-many-keys Info-mode-map
	("N"         'Info-next)
	("."         'Info-next)
	("x"         'Info-next)
	(","         'Info-history-back)
	("z"         'Info-history-back)
	("B"         'Info-history-back)
    ([backspace] 'Info-history-back)
	("I"         'Info-search-next)
	(" "         'nil)
	(" a"        'sdic-describe-word-at-point)
	("o"         'clone-buffer)
    ("\C-m"      'Info-follow-nearest-node)
	))

;;;###autoload
(defun Info-mode-mode-face-predefine ()
  "For `Info-mode' face."
  (message "eval-after-load: \"Info-mode\" Setting faces..")
  )



(provide 'Info_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; Info_mode_start.el ends here
