;;; doctest-mode_plugin_start.el --- setting for doctest-mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 05:49:45 (+0900)
;; Last-Updated: 2013/11/02 05:50:42 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro"))

;;;###autoload
(defun doctest-mode-mode-predefine ()
  "For `eval-after-load' doctest-mode function."
  (message "eval-after-load: \"doctest-mode\" setting..")
  )

;;;###autoload
(defun doctest-mode-mode-map-predefine ()
  "For doctest-mode key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"doctest-mode\" keymaping.."))
  (define-many-keys doctest-mode-map
    ("\C-cD"        'python-mode)
    ("\C-cP"        'python-mode)
    ("\C-cp"        'python-mode)
    ("\C-c\C-p"     'python-mode)
    ))



(provide 'doctest-mode_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; doctest-mode_plugin_start.el ends here
