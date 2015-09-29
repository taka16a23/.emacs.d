;;; 50_text-translator_plugin_start.el --- Setting for text-translator
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 19:10:24 2012 (+0900)
;; Last-Updated: 2015/09/20 04:17:34 (+0900)
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


(eval-when-compile
  (require 't1macro "t1macro")
  (require 'el-get-bundle "el-get-bundle"))

(el-get-bundle multi-term)

(autoload 'text-translator                             "text-translator" nil t)
(autoload 'text-translator-all                         "text-translator" nil t)
(autoload 'text-translator-quit                        "text-translator" nil t)
(autoload 'text-translator-translate-default           "text-translator" nil t)
(autoload 'text-translator-display-last-string         "text-translator" nil t)
(autoload 'text-translator-toggle-leave-string         "text-translator" nil t)
(autoload 'text-translator-translate-last-string       "text-translator" nil t)
(autoload 'text-translator-translate-recent-type       "text-translator" nil t)
(autoload 'text-translator-all-by-auto-selection       "text-translator" nil t)
(autoload 'text-translator-translate-by-auto-selection "text-translator" nil t)

(defvar text-translator-eval-after-load-hook nil
  "Hook for text-translator `eval-after-load'.")
(add-hook 'text-translator-eval-after-load-hook
          'text-translator-mode-custom-predefine)
(add-hook 'text-translator-eval-after-load-hook
          'text-translator-mode-predefine 'append)
(run-hooks-after-load "text-translator" 'text-translator-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 50_text-translator_plugin_start.el ends here
