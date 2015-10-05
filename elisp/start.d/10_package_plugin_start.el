;;; 10_package_plugin_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/04 17:15:26 (+0900)
;; Last-Updated: 2015/10/04 17:21:58 (+0900)
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
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro"))


;; inhibit error "read-only init.el"
;; (setq package-enable-at-startup nil)
(custom-set-variables
 '(package-user-dir (file-name-as-directory (concat my-elisp-dir "elpa"))))


(defvar package-eval-after-load-hook nil
  "Hook for package `eval-after-load'.")
(add-hook 'package-eval-after-load-hook 'package-mode-custom-predefine)
(add-hook 'package-eval-after-load-hook 'package-mode-predefine 'append)
(add-hook 'package-eval-after-load-hook 'package-mode-map-predefine 'append)
(add-hook 'package-eval-after-load-hook 'package-mode-face-predefine 'append)
(run-hooks-after-load "package" 'package-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 10_package_plugin_start.el ends here
