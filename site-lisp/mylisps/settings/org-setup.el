;;; org-setup.el ---   setting for org mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 16:52:41 (+0900)
;; Last-Updated:2015/10/23 06:27:18 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'bind-key "bind-key" 'noerr)
  (require 'subroutines "subroutines" 'noerr)
  (declare-function windows-p "subroutnes")
  (require 'environment-setup "environment-setup" 'noerr)
  (declare-function my-data-dir-join "environment-setup")
  )

(use-package org
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"org\"")
  (bind-keys :map org-mode-map
             ("C-e" . ctl-e-map)
             ("C-k" . previous-line)
             ("C-j" . backward-char)
             ("M-k" . outline-previous-visible-heading)
             ("M-n" . outline-next-visible-heading)
             ("M-h" . org-metaleft)
             ("M--" . org-metaright)
             ([24 return] . org-meta-return) ;(kbd "C-x <return>")
             ("M-a" . ispell-complete-word)
             ;; ("C-y" . my-kill-line)
             ("C-x M-h" . org-shiftmetaleft)
             ("C-x M--" . org-shiftmetaright)
             ("C-a" . sdic-describe-word-at-point)
             ("C-c C-k" . outline-previous-visible-heading)
             ("C-c C-h" . org-insert-heading)
             ([M-return] . view-mode) ;(kbd "M-<return>")
             ([201326637] . org-insert-heading) ;(kbd "C-M--")
             ("C-h" . my-backward-seq)
             ([S-return] . org-meta-return))
  (require 'subroutines "subroutines" 'noerr)
  (require 'environment-setup "environment-setup" 'noerr)
  (custom-set-variables
   '(org-log-done (if (windows-p) nil 'time))
   '(org-directory "~/")
   '(org-default-notes-file (my-emacs-dir-join "allinone.org"))
   '(org-todo-keywords '("TODO" "DONE" "WAIT" "POSTPONES"))
   '(org-todo-interpretation 'sequence)
   '(browse-url-browser-function 'w3m-browse-url-new-tab)
   '(org-todo-keyword-faces
     '(("TODO"      . org-warning)
       ("WAIT"      . shadow)
       ("POSTPONES" . (:foreground "blueviolet" :weight bold))
       ("DONE" . (:foreground "green"))))
   )
  (setq text-adjust-rule-space
        '((("\\cj"        "" "[0-9a-zA-Z]")   " ")
          (("[0-9a-zA-Z]" "" "\\cj")          " ")))
  (when (windows-p)
    ;; inhibit error
    (setq outline-heading-end-regexp "\n"))
  ;; rotate-text
  (dolist (el '(("is"       "==")
                ("True"     "False")
                ("TODO" "DONE" "LATER")
                ))
    (add-to-list 'rotate-text-rotations el))
  )

(use-package org-capture
  ;; :disabled
  :defer
  :init
  :bind
  (("C-M-c" . org-capture))
  :config
  (message "Loading \"org-capture\"")
  (defadvice org-capture
      (before before-find-file-org-capture activate)
    (with-current-buffer (find-file-noselect org-default-notes-file)
      (view-mode -1)
      )
    )
  ;; (progn (ad-disable-advice 'org-capture 'before 'before-find-file-org-capture) (ad-update 'org-capture))
  (defadvice org-capture-finalize
      (around inhibit-read-only-org-capture-finalize activate)
    (let ((inhibit-read-only t))
      ad-do-it
      ))
  (bind-keys :map org-capture-mode-map
             ("C-s" . org-capture-finalize))
  (defun org-capture-default-template () ;[2015/10/20]
    ""
    "\
** TODO [#C] %?

1\) 背景(問題点)

2\) 対応方法

3\) 優先順位の根拠

4\) 備考

5\) 結果
6\) time/ref
    / cf. %a
   %i
   %U
")
  (setq org-capture-templates
        '(("n" "Note" entry (file+headline nil "Note:")
           "**  %?\n    %i\n    %a\n    %U\n")
          ("t" "TODO" entry (file+headline nil "TODO:")
           (function org-capture-default-template))
          ("d" "DOING" entry (file+headline nil "DOING:")
           (function org-capture-default-template))
          ("b" "Bug" entry (file+headline nil "Bug:")
           (function org-capture-default-template))
          ("p" "Python" entry (file+headline nil "python:")
           (function org-capture-default-template))
          ("l" "lisp" entry (file+headline nil "Lisp:")
           (function org-capture-default-template))
          ("c" "C C++" entry (file+headline nil "C C++:")
           (function org-capture-default-template))
          ("a" "Assenbly" entry (file+headline nil "assembly:")
           (function org-capture-default-template))
          ("s" "Stack" entry (file+headline nil "Stack:")
           (function org-capture-default-template))
          ))
  )



(provide 'org-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; org-setup.el ends here
