;;; 23_helm_plugin_start.el --- Setting for helm
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/03/01 13:29:58 (+0900)
;; Last-Updated: 2015/10/04 09:51:01 (+0900)
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

;; helm.el
(defvar helm-eval-after-load-hook nil
  "Hook for helm `eval-after-load'.")
(add-hook 'helm-eval-after-load-hook 'helm-mode-custom-predefine)
(add-hook 'helm-eval-after-load-hook 'helm-mode-predefine 'append)
(add-hook 'helm-eval-after-load-hook 'helm-mode-map-predefine 'append)
(add-hook 'helm-eval-after-load-hook 'helm-mode-face-predefine 'append)
(run-hooks-after-load "helm" 'helm-eval-after-load-hook)

;; helm-buffers.el
(defvar helm-buffers-eval-after-load-hook nil
  "Hook for helm-buffers `eval-after-load'.")
(add-hook 'helm-buffers-eval-after-load-hook 'helm-buffers-mode-custom-predefine)
(add-hook 'helm-buffers-eval-after-load-hook 'helm-buffers-mode-predefine 'append)
(add-hook 'helm-buffers-eval-after-load-hook 'helm-buffers-mode-map-predefine 'append)
(add-hook 'helm-buffers-eval-after-load-hook 'helm-buffers-mode-face-predefine 'append)
(run-hooks-after-load "helm-buffers" 'helm-buffers-eval-after-load-hook)

;; helm-files.el
(defvar helm-files-eval-after-load-hook nil
  "Hook for helm-files `eval-after-load'.")
(add-hook 'helm-files-eval-after-load-hook 'helm-files-mode-custom-predefine)
(add-hook 'helm-files-eval-after-load-hook 'helm-files-mode-predefine 'append)
(add-hook 'helm-files-eval-after-load-hook 'helm-files-mode-map-predefine 'append)
(add-hook 'helm-files-eval-after-load-hook 'helm-files-mode-face-predefine 'append)
(run-hooks-after-load "helm-files" 'helm-files-eval-after-load-hook)

;; helm-utils.el
(defvar helm-utils-eval-after-load-hook nil
  "Hook for helm-utils `eval-after-load'.")
(add-hook 'helm-utils-eval-after-load-hook 'helm-utils-mode-custom-predefine)
(add-hook 'helm-utils-eval-after-load-hook 'helm-utils-mode-predefine 'append)
(add-hook 'helm-utils-eval-after-load-hook 'helm-utils-mode-map-predefine 'append)
(add-hook 'helm-utils-eval-after-load-hook 'helm-utils-mode-face-predefine 'append)
(run-hooks-after-load "helm-utils" 'helm-utils-eval-after-load-hook)

;; helm-command.el
(defvar helm-command-eval-after-load-hook nil
  "Hook for helm-command `eval-after-load'.")
(add-hook 'helm-command-eval-after-load-hook 'helm-command-mode-custom-predefine)
(add-hook 'helm-command-eval-after-load-hook 'helm-command-mode-predefine 'append)
(add-hook 'helm-command-eval-after-load-hook 'helm-command-mode-map-predefine 'append)
(add-hook 'helm-command-eval-after-load-hook 'helm-command-mode-face-predefine 'append)
(run-hooks-after-load "helm-command" 'helm-command-eval-after-load-hook)

;; helm-grep.el
(defvar helm-grep-eval-after-load-hook nil
  "Hook for helm-grep `eval-after-load'.")
(add-hook 'helm-grep-eval-after-load-hook 'helm-grep-mode-custom-predefine)
(add-hook 'helm-grep-eval-after-load-hook 'helm-grep-mode-predefine 'append)
(add-hook 'helm-grep-eval-after-load-hook 'helm-grep-mode-map-predefine 'append)
(add-hook 'helm-grep-eval-after-load-hook 'helm-grep-mode-face-predefine 'append)
(run-hooks-after-load "helm-grep" 'helm-grep-eval-after-load-hook)

;; helm-bookmark.el
(defvar helm-bookmark-eval-after-load-hook nil
  "Hook for helm-bookmark `eval-after-load'.")
(add-hook 'helm-bookmark-eval-after-load-hook 'helm-bookmark-mode-custom-predefine)
(add-hook 'helm-bookmark-eval-after-load-hook 'helm-bookmark-mode-predefine 'append)
(add-hook 'helm-bookmark-eval-after-load-hook 'helm-bookmark-mode-map-predefine 'append)
(add-hook 'helm-bookmark-eval-after-load-hook 'helm-bookmark-mode-face-predefine 'append)
(run-hooks-after-load "helm-bookmark" 'helm-bookmark-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 23_helm_plugin_start.el ends here
