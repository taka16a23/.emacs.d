;;; 60_auto-highlight-symbol_plugin_start.el --- setting for auto-highlight-symbol
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 16:07:41 (+0900)
;; Last-Updated: 2013/11/02 16:12:15 (+0900)
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


(defvar auto-highlight-symbol-eval-after-load-hook nil
  "Hook for auto-highlight-symbol `eval-after-load'.")
(add-hook 'auto-highlight-symbol-eval-after-load-hook
          'auto-highlight-symbol-mode-custom-predefine)
(add-hook 'auto-highlight-symbol-eval-after-load-hook
          'auto-highlight-symbol-mode-predefine 'append)
(add-hook 'auto-highlight-symbol-eval-after-load-hook
          'auto-highlight-symbol-mode-map-predefine 'append)
(add-hook 'auto-highlight-symbol-eval-after-load-hook
          'auto-highlight-symbol-mode-face-predefine 'append)
(run-hooks-after-load "auto-highlight-symbol"
                      'auto-highlight-symbol-eval-after-load-hook)

(add-hook 'after-init-timer-hook 'auto-highlight-symbol-mode-on)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 60_auto-highlight-symbol_plugin_start.el ends here
