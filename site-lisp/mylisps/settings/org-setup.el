;;; org-setup.el ---   setting for org mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 16:52:41 (+0900)
;; Last-Updated:2015/10/16 13:34:29 (+0900)
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
  (if (windows-p)
      (custom-set-variables
       '(org-log-done nil))
    (custom-set-variables
     '(org-log-done 'time)))
  (custom-set-variables
   '(org-directory "~/")
   '(org-default-notes-file (expand-file-name "allinone.org" my-emacs-dir))
   '(org-todo-keywords '("TODO" "DONE" "WAIT" "POSTPONES"))
   '(org-todo-interpretation 'sequence)
   '(browse-url-browser-function 'w3m-browse-url-new-tab)
   '(org-todo-keyword-faces
     '(("TODO"      . org-warning)
       ("WAIT"      . shadow)
       ("POSTPONES" . (:foreground "blueviolet" :weight bold))))
   )
  (when (require 'auto-complete "auto-complete" 'noerr)
    (add-to-list 'ac-user-dictionary-files (my-data-dir-join "words")))
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

(use-package org-remember
  ;; :disabled
  :defer
  :commands (org-remember)
  :init
  :config
  (message "Loading \"org-remember\"")
  (custom-set-variables
   '(org-id-locations-file (my-data-dir-join ".org-id-locations"))
   '(org-remember-templates
     '(("Note"     ?n "**  %?\n    %i\n    %a\n    " nil "Note:")
       ("Todo"     ?t "** TODO [#C] %?\n    %i\n    %a\n    " nil "Todo:")
       ("Emacs" ?e
        "\
** TODO [#C] %?

1\) 背景(問題点)

2\) 対応方法

3\) 優先順位の根拠

4\) 備考

5\) 結果
6\) time/ref
    / cf. %a
   %i" nil "Emacs:")
       ("Python"   ?p "\
** TODO [#C] %?

1\) 背景(問題点)

2\) 対応方法

3\) 優先順位の根拠

4\) 備考

5\) 結果
6\) time/ref
    / cf. %a
   %i" nil "python:")
       ("Bug"   ?b"\
** TODO [#C] %?

1\) 背景(問題点)

2\) 対応方法

3\) 優先順位の根拠

4\) 備考

5\) 結果
6\) time/ref
    / cf. %a
   %i" nil "Bug:")

       ("lisp"     ?l "** TODO [#C] %?\n    %i\n    %a\n    " nil "Lisp:")
       ("C C++"    ?c "** TODO [#C] %?\n    %i\n    %a\n    " nil "C C++:")
       ("Assenbly" ?a "** TODO [#C] %?\n    %i\n    %a\n    " nil "assembly:")
       ("Stack"    ?s "** TODO [#C] %?\n    %i\n    %a\n    " nil "Stack:")
       ;; %a           アノテーション(C-c lで保存したリンク)
       ;; %i           選択されたリージョンの内容
       ;; %t           タイムスタンプ(年月日)
       ;; %T           タイムスタンプ(年月日と時間)
       ;; %u           非活性なタイムスタンプ(年月日)
       ;; %U           非活性なタイムスタンプ(年月日と時間)
       ;; %n           ユーザ名
       ;; %x           クリップボードの内容
       ;; %?           カーソルの位置
       )))
  (org-remember-insinuate)
  (define-key org-remember-mode-map "\C-c\C-c" 'org-remember-finalize)
  (define-key org-remember-mode-map "\C-s" 'org-remember-finalize)
  (defadvice org-remember-finalize
      (around inhibit-read-only-remember-finalize activate)
    (let ((inhibit-read-only t))
      ad-do-it
      ))
  )



(provide 'org-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; org-setup.el ends here
