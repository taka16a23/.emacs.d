;;; anything-complete_plugin_start.el --- functions for anything-complete
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 15:34:56 2012 (+0900)
;; Last-Updated: Sat Dec 15 17:09:47 2012 (+0900)
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
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'anything-complete)
  (require 'anything-show-completion))

(defun anything-complete-predefine ()
  "For `eval-after-load' anything-config function."
  (message "Loading anything-complete..")
  (anything-lisp-complete-symbol-set-timer 600)
  (anything-read-string-mode 1)
  (alcs-make-candidates)
  (require 'anything-show-completion)
  (anything-complete-shell-history-setup-key "\C-o")
  )


(provide 'anything-complete_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; anything-complete_plugin_start.el ends here
