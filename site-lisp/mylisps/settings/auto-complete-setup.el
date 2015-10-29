;;; auto-complete-setup.el ---   auto complete
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:50 2012 (+0900)
;; Last-Updated:2015/10/30 07:46:25 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 'auto-complete "auto-complete" 'noerr)
  (declare-function ac-stop "auto-complete")
  (declare-function auto-complete "auto-complete")
  (declare-function ac-config-default "auto-complete-config")
  (declare-function my-var-dir-join "environment-setup")
  (require 'package "package" 'noerr)
  (package-initialize)
  (require 'environment-setup "environment-setup" 'noerr)
  (declare-function my-data-dir-join "environment-setup")
  (declare-function my-var-dir-join "environment-setup")
  )

(defun auto-complete-emacs-lisp-mode-hook () ;[2015/10/18]
  ""
  (ignore-errors
    (and (not during-init-p)
         (auto-complete-mode 1)
         (setq ac-sources (delete-dups (append (list 'ac-emacs-lisp-features
                                                     'ac-source-functions
                                                     'ac-source-variables
                                                     'ac-source-symbols)
                                               ac-sources)))))
  )

(defun auto-complete-lisp-interaction-mode-hook () ;[2015/10/18]
  ""
  (ignore-errors
    (setq ac-sources '(ac-emacs-lisp-features
                       ac-source-functions
                       ac-source-variables
                       ac-source-symbols
                       ac-source-yasnippet
                       ac-source-words-in-same-mode-buffers))))

(use-package auto-complete
  ;; :disabled
  :defer 5
  :ensure t
  :commands
  auto-complete-mode
  auto-complete-mode-maybe
  global-auto-complete-mode
  ac-stop
  :init
  (add-hook 'emacs-lisp-mode-hook 'auto-complete-emacs-lisp-mode-hook)
  (add-hook 'lisp-interaction-mode-hook 'auto-complete-lisp-interaction-mode-hook)
  (add-hook 'systemd-mode-hook 'auto-complete-mode)
  (add-hook 'python-mode-hook 'auto-complete-mode)
  :config
  (message "Loading \"auto-complete\"")
  (require 'auto-complete-config)
  (ac-config-default)
  (setq-default ac-sources '(ac-source-yasnippet
                             ac-source-words-in-same-mode-buffers))
  (require 'environment-setup "environment-setup" 'noerr)
  (add-to-list 'ac-user-dictionary-files (my-data-dir-join "words"))
  (custom-set-variables
   '(ac-trigger-key nil)
   '(ac-auto-show-menu    0.4)
   '(ac-use-comphist      t)
   '(ac-use-quick-help    t)
   '(ac-menu-height       8)
   '(ac-quick-help-height 15)
   '(ac-use-menu-map      t)
   '(ac-disable-faces     nil)
   '(ac-comphist-file (my-var-dir-join "ac-comphist.dat")))
  (global-auto-complete-mode 1)
  (bind-keys :map ac-complete-mode-map
             ("C-h" . ac-persist-help)
             ("C-f" . ac-isearch)
             ("\t"  . ac-stop)
             ([tab]  . ac-stop)
             ("C-l" . ac-stop)
             ("C-s" . auto-complete-stop&save))
  (bind-keys :map ac-menu-map
             ("C-n" . ac-next)
             ("\t"  . ac-stop)
             ([tab]  . ac-stop)
             ("C-k" . ac-previous))
  )

;; TODO: (Atami) [2015/10/12]
;; move to mylisp
;;;###autoload
(defun auto-complete-stop&save ()
  "Auto complete stop and save."
  (interactive)
  (ac-stop)
  (save-buffer))

;; (defun my-ac-look ()
;;   "Look コマンドの出力をリストで返す."
;;   (interactive)
;;   (unless (executable-find "look")
;;     (error "look コマンドがありません"))
;;   (let ((search-word (thing-at-point 'word)))
;;     (with-temp-buffer
;;       (call-process-shell-command "look" nil t 0 search-word)
;;       (split-string-and-unquote (buffer-string) "\n"))))

;; ;; 表示数制限を変更しない場合
;; ;;;###autoload
;; (defun ac-complete-look ()
;;   (interactive)
;;   (auto-complete '(ac-source-look)))

;; (defvar ac-source-look
;;   '((candidates . my-ac-look)
;;     (requires	. 2)))



(provide 'auto-complete-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-complete-setup.el ends here
