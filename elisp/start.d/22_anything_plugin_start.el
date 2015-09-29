;;; 22_anything_plugin_start.el --- Setting for anything
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:32 2012 (+0900)
;; Last-Updated: 2013/11/01 17:15:48 (+0900)
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

(defvar anything-eval-after-load-hook nil
  "Hook for anything `eval-after-load'.")
(add-hook 'anything-eval-after-load-hook 'anything-mode-custom-predefine)
(add-hook 'anything-eval-after-load-hook 'anything-mode-predefine 'append)
(add-hook 'anything-eval-after-load-hook 'anything-mode-map-predefine 'append)
(add-hook 'anything-eval-after-load-hook 'anything-mode-face-predefine 'append)
(run-hooks-after-load "anything" 'anything-eval-after-load-hook)


;;;; anything color-moccur
;;
(autoload 'anything-c-moccur-occur-by-moccur           "anything-c-moccur" nil t)
(autoload 'anything-c-moccur-dired-do-moccur-by-moccur "anything-c-moccur" nil t)

(defvar anything-c-moccur-eval-after-load-hook nil
  "Hook for anything-c-moccur `eval-after-load'.")
(add-hook 'anything-c-moccur-eval-after-load-hook
          'anything-c-moccur-mode-custom-predefine)
(add-hook 'anything-c-moccur-eval-after-load-hook
          'anything-c-moccur-mode-predefine 'append)
(add-hook 'anything-c-moccur-eval-after-load-hook
          'anything-c-moccur-mode-map-predefine 'append)
(run-hooks-after-load "anything-c-moccur"
                      'anything-c-moccur-eval-after-load-hook)


;;;; anything-grep
;;
(autoload 'anything-grep                  "anything-grep" nil t)
(autoload 'anything-grep-by-name          "anything-grep" nil t)
(autoload 'anything-grep-by-name-reversed "anything-grep" nil t)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 22_anything_plugin_start.el ends here
