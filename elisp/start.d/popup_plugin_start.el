;;; popup_plugin_start.el --- setting for popup
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/01 18:23:01 (+0900)
;; Last-Updated: 2013/11/01 18:24:11 (+0900)
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
  (require 'popup "popup" 'noerr))

;;;###autoload
(defun popup-mode-predefine ()
  "For `eval-after-load' popup function."
  (message "eval-after-load: \"popup\" setting.."))

;;;###autoload
(defun popup-mode-map-predefine ()
  "For popup key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"popup\" keymaping.."))
  (define-key popup-menu-keymap "\C-k" 'popup-previous))



(provide 'popup_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; popup_plugin_start.el ends here