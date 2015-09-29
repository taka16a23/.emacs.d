;;; 40_moccur_plugin_start.el --- Setting for moccur
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 01:25:50 2012 (+0900)
;; Last-Updated: 2013/11/01 23:43:08 (+0900)
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
  (require 't1macro "t1macro"))

(autoload 'moccur-grep         "color-moccur" nil t)
(autoload 'moccur-grep-find    "color-moccur" nil t)
(autoload 'isearch-moccur      "color-moccur" nil t)
(autoload 'isearch-moccur-all  "color-moccur" nil t)
(autoload 'occur-by-moccur     "color-moccur" nil t)
(autoload 'moccur              "color-moccur" nil t)
(autoload 'dmoccur             "color-moccur" nil t)
(autoload 'dired-do-moccur     "color-moccur" nil t)
(autoload 'Buffer-menu-moccur  "color-moccur" nil t)
(autoload 'moccur-narrow-down  "color-moccur" nil t)
(autoload 'grep-buffers        "color-moccur" nil t)
(autoload 'search-buffers      "color-moccur" nil t)
(autoload 'moccur-edit-mode-in "moccur-edit"  nil t)

(defvar color-moccur-eval-after-load-hook nil
  "Hook for color-moccur `eval-after-load'.")
(add-hook 'color-moccur-eval-after-load-hook 'color-moccur-mode-custom-predefine)
(add-hook 'color-moccur-eval-after-load-hook
          'color-moccur-mode-predefine 'append)
(add-hook 'color-moccur-eval-after-load-hook
          'color-moccur-mode-map-predefine 'append)
(run-hooks-after-load "color-moccur" 'color-moccur-eval-after-load-hook)

(defvar moccur-edit-eval-after-load-hook nil
  "Hook for moccur-edit `eval-after-load'.")
(add-hook 'moccur-edit-eval-after-load-hook 'moccur-edit-mode-custom-predefine)
(add-hook 'moccur-edit-eval-after-load-hook 'moccur-edit-mode-predefine 'append)
(add-hook 'moccur-edit-eval-after-load-hook
          'moccur-edit-mode-map-predefine 'append)
(run-hooks-after-load "moccur-edit" 'moccur-edit-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 40_moccur_plugin_start.el ends here
