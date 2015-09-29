;;; 40_grep_plugin_start.el --- Setting for grep
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:18 2012 (+0900)
;; Last-Updated: 2013/11/01 23:22:42 (+0900)
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
;;    Removed: Removed moccur
;;
;; 2012/12/10    Atami
;;    Moved: Moved functions to grep_plugin_start.el
;;    `color-moccur-mode-map-predefine', `color-moccur-mode-predefine'
;;    `moccur-edit-mode-predefine', `moccur-edit-mode-map-predefine'
;;    `grep-mode-predefine', `grep-mode-map-predefine'
;;    `grep-mode-hook-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr))

(autoload 'grep-edit-finish-edit       "grep-edit" "Finalize edit"           t)
(autoload 'grep-edit-remove-change     "grep-edit" "Remove change in region" t)
(autoload 'grep-edit-remove-all-change "grep-edit" "Remove all changes"      t)

(defvar grep-eval-after-load-hook nil
  "Hook for grep `eval-after-load'.")
(add-hook 'grep-eval-after-load-hook 'grep-mode-custom-predefine)
(add-hook 'grep-eval-after-load-hook 'grep-mode-predefine 'append)
(add-hook 'grep-eval-after-load-hook 'grep-mode-map-predefine 'append)
(run-hooks-after-load "grep" 'grep-eval-after-load-hook)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 40_grep_plugin_start.el ends here
