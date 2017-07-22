;;; t1-simple-setup.el ---    Setting for misc windows
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 00:34:37 2012 (+0900)
;; Last-Updated:2015/10/20 02:45:42 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-ctl-x-bind-keys "t1-bind-key")
  (declare-function common-view-map-many-register "t1-bind-key")
  )

(require 't1-bind-key "t1-bind-key" 'noerr)

(defun t1-simple-emacs-lisp-mode-hook () ;[2015/10/18]
  ""
  (add-hook 'write-file-hooks 'delete-trailing-blank-lines 'append 'local))

(use-package t1-simple
  ;; :disabled
  :defer
  :commands
  (delete-trailing-blank-lines)
  :init
  (add-hook 'emacs-mode-hook 't1-simple-emacs-lisp-mode-hook)
  (t1-ctl-x-bind-keys '(("t" . swap-screen-with-cursor)))
  (common-view-map-many-register
   '(("a" . my-backward-seq)
     ("g" . my-forward-seq)
     ("h" . my-backward-seq)
     ("-" . my-forward-seq)
     ("C-h" . my-backward-seq)
     ([(control -)] . my-forward-seq)
     ))
  :config
  (message "Loading \"t1-simple\"")
  :bind
  (("M-h" . backward-whitespace)
   ([(meta ?-)] . forward-whitespace)
   ("C-M-j" . backward-whitespace)
   ([(control meta ?-)] . forward-whitespace)
   ("C-y" . t1-kill-line)
   ("C-h" . my-backward-seq)
   ([(control ?-)] . my-forward-seq)
   ([(control ?.)] . t1-forward-thing)
   ([(control ?,)] . t1-backward-thing)
   ("C-M-j" . t1-backward-thing)
   ("C-M-l" . t1-forward-thing)
   ([(shift return)] . return-on-line)
   ([C-mouse-5] . text-scale-decrease)
   ([C-mouse-4] . text-scale-enlarge)
   ([C-mouse-2] . text-scale-default)
   ([M-backspace] . my-backward-delete-word)
   ([C-backspace] . backward-kill-line)
   ("C-t" . move-text-up)
   ("M-R" . scroll-window-to-top)
   ("(" . t1-parence)
   )
  )

(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode
                                     lisp-mode lisp-interaction-mode
                                     clojure-mode    scheme-mode
                                     haskell-mode    ruby-mode
                                     rspec-mode      ;python-mode
                                     c-mode          c++-mode
                                     objc-mode       latex-mode
                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(defun uniq-region (start end)
  ""
  (interactive "*r")
  (shell-command-on-region start end "uniq" nil 'replace))



(provide 't1-simple-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; t1-simple-setup.el ends here
