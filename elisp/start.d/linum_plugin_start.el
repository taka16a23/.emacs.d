;;; linum_plugin_start.el --- setting for linum
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/01 23:27:17 (+0900)
;; Last-Updated: 2013/11/01 23:32:40 (+0900)
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
;; 2013/11/01    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'linum "linum" 'noerr)
  (require 'linum-off "linum-off" 'noerr))

;;;###autoload
(defun linum-mode-custom-predefine ()
  "For `eval-after-load' linum customize."
  (message "eval-after-load: \"linum\" customizing..")
  (require 'linum-off)
  (add-to-list 'linum-disabled-modes-list 'image-mode)
  (add-to-list 'linum-disabled-modes-list 'w3m-mode)
  (custom-set-variables
   '(linum-format "%3d ")
   '(linum-delay  t))
  )

;;;###autoload
(defun linum-mode-predefine ()
  "For `eval-after-load' linum function."
  (message "eval-after-load: \"linum\" setting..")
  )

;;;###autoload
(defun linum-mode-face-predefine ()
  "For linum face."
  (message "eval-after-load: \"linum\" Setting faces..")
  )



(provide 'linum_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; linum_plugin_start.el ends here
