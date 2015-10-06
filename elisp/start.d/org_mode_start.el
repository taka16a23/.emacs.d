;;; org_mode_start.el ---  functions for org mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 18:00:12 2012 (+0900)
;; Last-Updated: 2015/10/06 14:21:55 (+0900)
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
;; 2013/02/10    Atami
;;    Add valude: `org-remember-templates'
;;    "stack" todo
;;
;; 2013/02/04    Atami
;;    Modified: `org-remember-templates'
;;    rotate '1)結果' to '5)結果'
;;
;; 2013/01/27    Atami
;;    fixed: `org-mode-hook-predefine'
;;    Temporary escape timestamp to become garbled caracters on Windows OS.
;;
;; 2013/01/19    Atami
;;    Remove: `%t' timestamp from `org-remember-templates'.
;;    Timestamp become to garbled caracters on Windows OS.
;;
;; 2013/01/04    Atami
;;    Rename: org-default-notes-file name.
;;    "memo.org" to "allinone.org"
;;
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerror)
  (require 'subroutines "subroutines" 'noerr)
  (require 'text-adjust "text-adjust" 'noerr)
  (require 'org "org" 'noerr)
  (require 'org-remember "org-remember" 'noerr)
  (require 'auto-complete "auto-complete" 'noerr))


;;;###autoload
(defun org-mode-custom-predefine ()
  "For `eval-after-load' org customize."
  (message "eval-after-load: \"org\" customizing..")
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
   ))

;;;###autoload
(defun org-mode-predefine ()
  "For `eval-after-load' org function."
  (message "eval-after-load: \"org\" setting..")
  (add-hook 'org-mode-hook 'org-mode-hook-predefine)
  ;; org-remember
  (defvar org-remember-eval-after-load-hook nil
    "Hook for org-remember `eval-after-load'.")
  (add-hook 'org-remember-eval-after-load-hook
            'org-remember-mode-custom-predefine)
  (add-hook 'org-remember-eval-after-load-hook
            'org-remember-mode-predefine 'append)
  (add-hook 'org-remember-eval-after-load-hook
            'org-remember-mode-map-predefine 'append)
  (add-hook 'org-remember-eval-after-load-hook
            'org-remember-mode-face-predefine 'append)
  (run-hooks-after-load "org-remember" 'org-remember-eval-after-load-hook)
  )

;;;###autoload
(defun org-mode-map-predefine ()
  "For org key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"org\" keymaping.."))
  (define-many-keys org-mode-map
    ("\C-e"      'ctl-e-map)
    ("\C-k"      'previous-line)
    ("\C-j"      'backward-char)
    ("\M-k"      'outline-previous-visible-heading)
    ("\M-n"      'outline-next-visible-heading)
    ("\M-h"      'org-metaleft)
    ("\M--"      'org-metaright)
    ([24 return] 'org-meta-return) ;(kbd "C-x <return>")
    ("\M-a"      'ispell-complete-word)
    ("\C-y"      'my-kill-line)
    ("\C-x\M-h"  'org-shiftmetaleft)
    ("\C-x\M--"  'org-shiftmetaright)
    ("\C-a"      'sdic-describe-word-at-point)
    ("\C-c\C-k"  'outline-previous-visible-heading)
    ("\C-c\C-h"  'org-insert-heading)
    ([M-return]  'view-mode) ;(kbd "M-<return>")
    ([201326637] 'org-insert-heading) ;(kbd "C-M--")
    ("\C-h"      'my-backward-seq)
    ([S-return]    'org-meta-return)
    ))

;;;###autoload
(defun org-mode-face-predefine ()
  "For org face."
  (message "eval-after-load: \"org\" Setting faces..")
  )

(defun org-mode-hook-predefine ()
  "For `org-mode-hook' function."
  (add-hook 'write-file-hooks 'delete-trailing-blank-lines 'append 'local)
  ;; (remove-hook 'write-file-hooks 'delete-trailing-blank-lines 'local)

  (when (require 'auto-complete "auto-complete" 'noerr)
    (add-to-list 'ac-user-dictionary-files (concat my-data-dir "words")))
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


;;;; org-remember
;;
;;;###autoload
(defun org-remember-mode-custom-predefine ()
  "For `eval-after-load' org-remember customize."
  (message "eval-after-load: \"org-remember\" customizing..")
  (custom-set-variables
   '(org-id-locations-file (concat my-data-dir ".org-id-locations"))
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
  )

;;;###autoload
(defun org-remember-mode-predefine ()
  "For `eval-after-load' org-remember function."
  (message "eval-after-load: \"org-remember\" setting..")
  (org-remember-insinuate)
  (add-hook 'org-remember-mode-hook 'org-remember-mode-map-predefine))

;;;###autoload
(defun org-remember-mode-map-predefine ()
  "For org-remember key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"org-remember\" keymaping.."))
  (define-key org-remember-mode-map "\C-c\C-c" 'org-remember-finalize)
  (define-key org-remember-mode-map "\C-s" 'org-remember-finalize))

;;;###autoload
(defun org-remember-mode-face-predefine ()
  "For org-remember face."
  (message "eval-after-load: \"org-remember\" Setting faces..")
  )

(defadvice org-remember-finalize
  (around inhibit-read-only-remember-finalize activate)
  (let ((inhibit-read-only t))
    ad-do-it
    ))



(provide 'org_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; org_mode_start.el ends here
