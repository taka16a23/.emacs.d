;;; 30_auto-complete_plugin_start.el --- auto complete
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:50 2012 (+0900)
;; Last-Updated: 2013/11/01 18:28:09 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro"))

(autoload 'auto-complete-mode        "auto-complete")
(autoload 'auto-complete-mode-maybe  "auto-complete")
(autoload 'global-auto-complete-mode "auto-complete")
(add-hook 'after-init-timer-hook 'global-auto-complete-mode-on)

(defvar auto-complete-eval-after-load-hook nil
  "Hook for auto-complete `eval-after-load'.")
(add-hook 'auto-complete-eval-after-load-hook
          'auto-complete-mode-custom-predefine)
(add-hook 'auto-complete-eval-after-load-hook
          'auto-complete-mode-predefine 'append)
(add-hook 'auto-complete-eval-after-load-hook
          'auto-complete-mode-map-predefine 'append)
(run-hooks-after-load "auto-complete" 'auto-complete-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 30_auto-complete_plugin_start.el ends here
