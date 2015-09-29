;;; midnight_plugin_start.el --- setting for midnight
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 01:38:32 (+0900)
;; Last-Updated: 2013/11/02 01:42:47 (+0900)
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
  (require 'midnight "midnight" 'noerr))

;;;###autoload
(defun midnight-mode-custom-predefine ()
  "For `eval-after-load' midnight customize."
  (message "eval-after-load: \"midnight\" customizing..")
  (custom-set-variables
   '(midnight-mode t))
  )

;;;###autoload
(defun midnight-mode-predefine ()
  "For `eval-after-load' midnight function."
  (message "eval-after-load: \"midnight\" setting..")
  (add-hook 'midnight-hook 'clean-backup-files)
  )


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; midnight_plugin_start.el ends here
