;;; 60_tabbar_plugin_start.el --- Setting for tabber
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/02/14 05:49:31 (+0900)
;; Last-Updated: 2013/11/02 01:36:00 (+0900)
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
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'subroutines_start "subroutines_start" 'noerr)
  (require 't1macro "t1macro"))

(add-hook 'after-init-idle-timer-hook 'tabbar-mode)

(defvar tabbar-eval-after-load-hook nil
  "Hook for tabbar `eval-after-load'.")
(add-hook 'tabbar-eval-after-load-hook 'tabbar-mode-custom-predefine)
(add-hook 'tabbar-eval-after-load-hook 'tabbar-mode-predefine 'append)
(add-hook 'tabbar-eval-after-load-hook 'tabbar-mode-map-predefine 'append)
(add-hook 'tabbar-eval-after-load-hook 'tabbar-mode-face-predefine 'append)
(run-hooks-after-load "tabbar" 'tabbar-eval-after-load-hook)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 60_tabbar_plugin_start.el ends here
