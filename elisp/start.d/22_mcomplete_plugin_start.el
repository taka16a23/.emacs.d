;;; 22_mcomplete_plugin_start.el --- Setting for mcomplete
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/02/14 03:09:55 (+0900)
;; Last-Updated: 2013/11/01 17:57:06 (+0900)
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
;; 2013/02/14    Atami
;;    initialize:
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro"))

(autoload 'turn-on-mcomplete-mode "mcomplete")
(add-hook 'after-init-idle-timer-hook 'turn-on-mcomplete-mode)

;;;###autoload
(defun mcomplete-mode-predefine ()
  "For `eval-after-load' mcomplete function."
  (message "eval-after-load: \"mcomplete\" setting..")
  )

(defvar mcomplete-eval-after-load-hook nil
  "Hook for mcomplete `eval-after-load'.")
(add-hook 'mcomplete-eval-after-load-hook 'mcomplete-mode-predefine 'append)
(run-hooks-after-load "mcomplete" 'mcomplete-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 22_mcomplete_plugin_start.el ends here
