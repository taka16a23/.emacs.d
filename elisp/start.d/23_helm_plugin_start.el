;;; 23_helm_plugin_start.el --- Setting for helm
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/03/01 13:29:58 (+0900)
;; Last-Updated: 2013/11/01 18:06:02 (+0900)
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
;; 2013/03/01    Atami
;;    Created:
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro"))

(defvar helm-eval-after-load-hook nil
  "Hook for helm `eval-after-load'.")
(add-hook 'helm-eval-after-load-hook 'helm-mode-custom-predefine)
(add-hook 'helm-eval-after-load-hook 'helm-mode-predefine 'append)
(add-hook 'helm-eval-after-load-hook 'helm-mode-map-predefine 'append)
(add-hook 'helm-eval-after-load-hook 'helm-mode-face-predefine 'append)
(run-hooks-after-load "helm" 'helm-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 23_helm_plugin_start.el ends here
