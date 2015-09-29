;;; tramp_plugin_start.el --- functions for tramp
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 00:22:21 2012 (+0900)
;; Last-Updated: 2013/11/02 21:42:36 (+0900)
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
(defun tramp-mode-custom-predefine ()
  "For `eval-after-load' tramp customize."
  (message "eval-after-load: \"tramp\" customizing..")
  (custom-set-variables
   '(tramp-default-method "ssh"))
  )

;;;###autoload
(defun tramp-mode-predefine ()
  "For `eval-after-load' tramp function."
  (message "eval-after-load: \"tramp\" setting..")
  )


(provide 'tramp_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; tramp_plugin_start.el ends here
