;;; 40_yasnippet_plugin_start.el --- snippet
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:29 2012 (+0900)
;; Last-Updated: 2015/09/24 14:33:35 (+0900)
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
;; 2013/02/07    Atami
;;    Add: `snippet-mode' add to `auto-mode-alist'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro"))

(add-to-list 'auto-mode-alist (cons (purecopy "\\.yasnippet\\'") 'snippet-mode))
(add-to-list 'auto-mode-alist (cons (purecopy "emacs.+/snippets/") 'snippet-mode))
(add-to-list 'auto-mode-alist (cons (purecopy "emacs.+/snippets/.+\\.el$")
                                    'emacs-lisp-mode))

(autoload 'yas-expand              "yasnippet" nil t)
(autoload 'yas-new-snippet         "yasnippet" nil t)
(autoload 'yas-visit-snippet-file  "yasnippet" nil t)
;;;; auto yasnippet
(autoload 'create-auto-yasnippet "auto-yasnippet" "auto-yasnippet" 'interactive)
(autoload 'expand-auto-yasnippet "auto-yasnippet" "auto-yasnippet" 'interactive)

(defvar yasnippet-eval-after-load-hook nil
  "Hook for yasnippet `eval-after-load'.")
(add-hook 'yasnippet-eval-after-load-hook 'yasnippet-mode-custom-predefine)
(add-hook 'yasnippet-eval-after-load-hook 'yasnippet-mode-predefine 'append)
(add-hook 'yasnippet-eval-after-load-hook 'yasnippet-mode-map-predefine 'append)
(run-hooks-after-load "yasnippet" 'yasnippet-eval-after-load-hook)

(setq yas-snippet-dirs (list (concat my-data-dir "snippets/")))
(setq yas/root-directory (concat my-data-dir "snippets/"))



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 40_yasnippet_plugin_start.el ends here
