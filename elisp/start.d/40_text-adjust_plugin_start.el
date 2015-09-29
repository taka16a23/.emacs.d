;;; 40_text-adjust_plugin_start.el --- Setting for text adjust
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:25 2012 (+0900)
;; Last-Updated: 2013/11/02 00:00:11 (+0900)
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

(autoload 'text-adjust                    "text-adjust" nil t)
(autoload 'text-adjust-fill               "text-adjust" nil t)
(autoload 'text-adjust-space              "text-adjust" nil t)
(autoload 'text-adjust-buffer             "text-adjust" nil t)
(autoload 'text-adjust-region             "text-adjust" nil t)
(autoload 'text-adjust-hankaku            "text-adjust" nil t)
(autoload 'text-adjust-kutouten           "text-adjust" nil t)
(autoload 'text-adjust-codecheck          "text-adjust" nil t)
(autoload 'text-adjust-fill-buffer        "text-adjust" nil t)
(autoload 'text-adjust-fill-region        "text-adjust" nil t)
(autoload 'text-adjust-space-buffer       "text-adjust" nil t)
(autoload 'text-adjust-space-region       "text-adjust" nil t)
(autoload 'text-adjust-hankaku-region     "text-adjust" nil t)
(autoload 'text-adjust-hankaku-buffer     "text-adjust" nil t)
(autoload 'text-adjust-kutouten-buffer    "text-adjust" nil t)
(autoload 'text-adjust-kutouten-region    "text-adjust" nil t)
(autoload 'text-adjust-codecheck-buffer   "text-adjust" nil t)
(autoload 'text-adjust-codecheck-region   "text-adjust" nil t)
(autoload 'text-adjust-kutouten-read-rule "text-adjust" nil t)

(add-hook 'before-save-hook	'text-adjust-space-before-save-if-needed)

(defvar text-adjust-eval-after-load-hook nil
  "Hook for text-adjust `eval-after-load'.")
(add-hook 'text-adjust-eval-after-load-hook 'text-adjust-mode-custom-predefine)
(add-hook 'text-adjust-eval-after-load-hook 'text-adjust-mode-predefine 'append)
(add-hook 'text-adjust-eval-after-load-hook
          'text-adjust-mode-map-predefine 'append)
(run-hooks-after-load "text-adjust" 'text-adjust-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 40_text-adjust_plugin_start.el ends here
