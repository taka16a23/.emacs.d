;;; python_mode_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/05 10:34:58 (+0900)
;; Last-Updated: 2015/10/06 12:57:26 (+0900)
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
  (require 'subroutines_start))


;;;###autoload
(defun python-mode-custom-predefine ()
  "For `eval-after-load' python customize."
  (message "eval-after-load: \"python\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun python-mode-predefine ()
  "For `eval-after-load' python function."
  (message "eval-after-load: \"python\" setting..")
  (setq-default font-lock-fontify-buffer-function 'jit-lock-refontify)
  (require '__python__ "__python__" 'noerr)
  (python-setenv)
  (when (require 'flycheck "flycheck" 'noerr)
    (add-hook 'python-mode-hook 'flycheck-mode 'append))
  (add-hook 'python-mode-hook 'hotstring-mode)
  ;; (remove-hook 'python-mode-hook 'hotstring-mode)
  (when (require 'auto-complete-yasnippet "auto-complete-yasnippet" 'noerr)
    (add-to-list 'ac-sources ac-source-yasnippet 'append))
  (when (require 'pymacs "pymacs" 'noerr)
    (add-hook 'python-mode-hook 'rope-open-current-or-parent 'append))
  (setq python-shell-interpreter "/usr/bin/ipython"
        ;; python-shell-interpreter "ipython"
        python-shell-interpreter-args ""
        python-shell-prompt-regexp "In \\[[0-9]+\\]: "
        python-shell-prompt-output-Regexp "Out\\[[0-9]+\\]: "
        python-shell-completion-setup-code
        "from IPython.core.completerlib import module_completion"
        python-shell-completion-module-string-code
        "';'.join(module_completion('''%s'''))\n"
        python-shell-completion-string-code
        "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  )

;;;###autoload
(defun python-mode-map-predefine ()
  "For python key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"python\" keymaping.."))
  (defvar ctl-c-n-map nil ;;(make-keymap)
    "Default keymap for C-cn commands.")
  (define-prefix-command 'ctl-c-n-map)

  (defvar ctl-c-ctl-n-map nil ;;(make-keymap)
    "Default keymap for C-c C-n commands.")
  (define-prefix-command 'ctl-c-ctl-n-map)

  (define-many-keys python-mode-map
    ;;;; for nose
    ;;
    ("\C-cn"          'ctl-c-n-map)
    ("\C-c\C-n"       'ctl-c-ctl-n-map)
    ;;;; Simple
    ;;
    ("\C-j"           'backward-char)
    ("\C-m"           'py:newline)
    ([(shift return)] 'py:auto-colon-return-on-line)
    ("\#"             'self-insert-command)
    ("\M-?"           'winner-undo)
    ("\M-i"           'hs-toggle-hiding)
    ("\C-u\M-i"       'hs-show-all)
    ("\C-u\C-u\M-i"   'hs-hide-all)
    ([C-backspace]    'backward-kill-line)
    ;; (","              (smartchr '(", `!!'" ",")))
    ("'"              (smartchr '("'`!!''" "'" "'''`!!''''")))
    ;; ("_"              (smartchr '("_" "__`!!'__" "__")))
    ("\""             (smartchr '("\"`!!'\"" "\"" "\"\"\"`!!'\n\"\"\"" "\"")) )
    ([(meta return)]  't1-py-view-mode-toggle)
    ("="              'py:=)
    ("+"              'py:+)
    (":"              'py:-:)
    ("*"              'py:*)
    ("-"              'py:-)
    (">"              'py:>)
    ("<"              'py:<)
    ("/"              'py:/)
    ("&"              'py:&)
    ("%"              'py:%)
    (","              'py:\,)
    ("|"              'py:|)
    ("?"              'py:?)
    ("\C-y"           'py:kill-line)
    ("\C-d"           'py:kill-line)

    ;;;; Document
    ;;
    ("\C-ch"          'rope-show-doc)
    ("\C-c\C-h"       'rope-show-doc)
    ("\C-cd"          'rope-show-doc)
    ("\C-c\C-x"       'rope-show-doc)
    ;; ("\C-ch"          'jedi:show-doc)
    ;; ("\C-c\C-h"       'jedi:show-doc)
    ;; ("\C-cd"          'jedi:show-doc)
    ;; ("\C-c\C-x"       'jedi:show-doc)
    ("\C-c\C-a"       'py-apropos)
    ("\C-ca"          'py-apropos)

    ;;;; Info
    ;;

    ;;;; Go definitions
    ;;
    ("\C-cf"          'jedi:goto-definition)
    ("\C-c\C-f"       'jedi:goto-definition)
    ("\C-c\C-b"       'pop-stack-point)

    ("." 'jedi:dot-complete)
    ;;;; Comment
    ;;
    ((kbd "C-3")      'py-comment-or-uncomment-def-or-class)

    ;;;; Mark
    ;;
    ([67108896]       't1-mark)

    ;;;; Move
    ;;
    ("\C-p"           'py-beginning-of-def-or-class)
    ("\C-b"           'py-end-of-def-or-class)
    ("\M-k"           'py:beginning-of-class|def)
    ("\M-n"           'py:beginning-of-next-class|def)
    ([(control .)]    'py:usable-next)
    ([(control \,)]   'py:usable-prev)
    ([(control e) (control \,)] 'py:insert-conma-end-brackets)

    ;;;; Edit
    ;;
    ("\C-e\C-c"       'nil)
    ("\C-c\C-e"       'nil)
    ("\C-e\C-t"       'py-transpose-ope)
    ("\C-et"          'py-transpose-ope)
    ;; ([(meta \,)]      'py-shift-left)
    ([(meta \,)]      'python-indent-shift-left)
    ;; ([(meta .)]       'py-shift-right)
    ([(meta .)]       'python-indent-shift-right)
    ((kbd "C-7")      'py:string-cmd)
    ("\C-c\C-a"       'py-add-to-__all__)
    ;; ("\C-e\M-k"       'py:move-up-method)
    ;; ("\C-e\M-n"       'py:move-down-method)
    ;; ("\C-e\C-c\C-a"   'py:add-param)
    ("\C-c\C-e\C-a"   'py:add-param)
    ("\C-c\C-ea"      'py:add-param)
    ;; auto-highlight-symbol.el
    ("\C-eh"          'py:ahs-edit-mode-def-region)
    ("\C-e\C-\M-h"    'py:ahs-edit-mode-class-region)
    ("\C-e\M-h"       'py:ahs-edit-mode-class-region)

    ;;;; Refact
    ;;
    ("\C-c\C-e\C-x"   'py:refact-doc)
    ("\C-c\C-ed"      'py:refact-doc)
    ("\C-c\C-l"       'py:refact-list-toggle)
    ("\C-\M-e"        'py:extract-variable)
    ;; ((kbd "C-c C-7")  'py:refact-split-string)

    ;;;; Flymake
    ;;
    ;; ("\C-ce"          'flymake-goto-next-error)
    ;; ("\C-c\C-e"       'flymake-goto-next-error)

    ;;;; Indent
    ;;
    ;; ("\C-i"           'python-indent-dedent-line)
    ;; ((kbd "TAB")      'python-indent-dedent-line)

    ;;;; Align
    ;;

    ;;;; Interpreter
    ;;
    ("\C-c\C-c"        'nil)
    ;; ("\C-c\C-c\C-c" 'py-execute-buffer)
    ("\C-c\C-c\C-i"    'py-execute-buffer-ipython)
    ("\C-c\C-q"        'quickrun)
    ("\C-cq"           'quickrun)
    ;; ("\C-c\C-ci"    'py-execute-import-or-reload)
    ;; ("\C-c\C-c\C-i" 'py-execute-import-or-reload)
    ;; ("\C-c\C-cs"    'py-execute-string)
    ;; ("\C-c\C-c\C-s" 'py-execute-string)
    ("\C-c\C-cs"       'py-execute-line-ipython)
    ("\C-c\C-c\C-s"    'py-execute-line-ipython)
    ("\C-c\C-c\C-k"    'py-execute-class-ipython)
    ("\C-c\C-ck"       'py-execute-class-ipython)
    ("\C-c\C-cb"       'py-execute-block-ipython)
    ("\C-c\C-c\C-b"    'py-execute-block-ipython)
    ;; ("\C-c\C-cd"    'py-execute-def-or-class)
    ;; ("\C-c\C-c\C-x" 'py-execute-def-or-class)
    ("\C-c\C-cd"       'py-execute-def-ipython)
    ("\C-c\C-c\C-x"    'py-execute-def-ipython)
    ("\C-c\C-c\C-r"    'py-execute-region-ipython)
    ("\C-c\C-cr"       'py-execute-region-ipython)

    ;;;; TEST ;;;;
    ;;;; doctest
    ;;
    ("\C-cD"          'doctest-execute-buffer)
    ("\C-c\C-cD"      'doctest-mode)
    ;;;; TEST END ;;;;

    ;;;; rope
    ;;
    ("\C-cro"         'rope-open-project)
    ("\C-crf"         'rope-find-file)
    ("\C-crg"         'rope-goto-definition)
    ("\C-crr"         'rope-rename)
    ("\C-cri"         'rope-auto-import)

    ;;;; pylint pep8
    ;;
    ("\C-c\C-s"       'pylint)
    ("\C-cs"          'pep8)

    ;;;; helm pydoc
    ;;
    ;; ("\C-cI"          'helm-pydoc)
    ;; ("\C-ci"          'helm-pydoc)
    ;; ("\C-c\C-i"       'helm-pydoc)
    ("\C-ci"          'py:indirect-import)
    ("\C-c\C-i"       'py:indirect-import)
    ;;;; pdb
    ;;
    ("\C-c\C-o"       'py-insert-pdb-set-trace)
    ("\C-co"          'py-insert-pdb-set-trace)
    ;; ("\C-cpb"         'gud-break)
    ;;;;
    ("\C-\M-p"        'py-send-region-ipython)
    )
    ;;;; C-c n
  (define-many-keys ctl-c-n-map
    ("\C-n"     'nosetests-run-all-cover-package)
    ("n"        'nosetests-run-it-cover-package)
    ("\C-i"     'nosetests-run-it)
    ("\C-b"     'nosetests-run-buffer)
    ("b"        'nosetests-run-buffer)
    ("\C-d"     'nosetests-run-dir)
    ("d"        'nosetests-run-dir)
    ("\C-p\C-n" 'nosetests-run-pdb-all)
    ("\C-pn"    'nosetests-run-pdb-it)
    ("\C-p\C-i"    'nosetests-run-pdb-it)
    ("\C-pi"    'nosetests-run-pdb-it)
    ("\C-pb"    'nosetests-run-pdb-buffer)
    ("\C-p\C-b"    'nosetests-run-pdb-buffer)
    ("\C-p\C-d"    'nosetests-run-pdb-dir)
    ("\C-pd"    'nosetests-run-pdb-dir)
    ;;("a"	      'nosetests-all)
    ;;("o"	      'nosetests-one)
    ;;("m"	      'nosetests-module)
    )
  ;;;; C-c C-n
  (define-many-keys ctl-c-ctl-n-map
    ("\C-n"     'nosetests-run-all-cover-package+)
    ("n"        'nosetests-run-it-cover-package+)
    ("\C-i"     'nosetests-run-it)
    ("\C-b"     'nosetests-run-buffer)
    ("b"        'nosetests-run-buffer)
    ("\C-d"     'nosetests-run-dir)
    ("d"        'nosetests-run-dir)
    ("N"        'nosetests-run-it)
    ("\M-N"     'nosetests-run-all+)
    )
  (smartrep-define-key
      python-mode-map "C-c C-e" '(("C-l" . py:refact-list-toggle)
                                  ("C-k" . py:move-up-method)
                                  ("C-n" . py:move-down-method)
                                  ))
  (smartrep-define-key
      python-mode-map "C-e" '(("M-k" . py:move-up-method)
                              ("M-n" . py:move-down-method)))

  )

;;;###autoload
(defun python-mode-face-predefine ()
  "For python face."
  (message "eval-after-load: \"python\" Setting faces..")
  (font-lock-add-keywords
   'python-mode
   '(("#\\([a-z \t]*\\(?:TODO\\|BUG\\|FIXME\\|KLUDGE\\|WARNING\\)\\)"
      1 font-lock-warning-face prepend)))
  )

(defun python-setenv ()
  "Python set environment."
  (interactive)
  (let ((python-path (getenv "PYTHONPATH")))
    (if (and python-path
             (not (string= python-path "")))
        (when (not (string-match
                    (replace-regexp-in-string "\\\\" "\\\\\\\\" my-pylib-dir)
                    python-path))
          (setenv "PYTHONPATH" (concat python-path path-separator my-pylib-dir))
          (message (concat "PYTHONPATH: " (getenv "PYTHONPATH"))))
      (setenv "PYTHONPATH" my-pylib-dir)
      (message "PYTHONPATH false"))))

;;;###autoload
(defun rope-open-current-or-parent ()
  "Rope open current or parent."
  (cond ((file-exists-p ".ropeproject")
    	 (rope-open-project default-directory))
    	((file-exists-p "../.ropeproject")
    	 (rope-open-project (concat default-directory "..")))))


(defun py:kill-line (arg)
  "If line is blank, delete all surrounding blank lines, leaving just one.
ARG:
On isolated blank line, delete that one.
On nonblank line, kill whole line."
  (interactive "P*")
  (cond (mark-active
         (cua-cut-region arg)
         (just-one-blank-line))
        ((progn (beginning-of-line) (looking-at "\\(?:def\\|class\\)"))
         (kill-whole-line))
        ((save-excursion
           (re-search-backward "[^ \t\n]" nil 'noerror)
           (forward-line 1)
           (looking-at "^[ \t\n]+[\n\r]\\(?:def\\|class\\)"))
         (if (eq last-command this-command)
             (progn (delete-blank-lines) (kill-whole-line))
           (delete-blank-lines)
           (save-excursion (insert "\n"))))
        ((progn (beginning-of-line) (looking-at "[ \t]*$"))
         (delete-blank-lines))
        (t
         (kill-whole-line)))
  (when (looking-at "^[ \t\n]+")
    (save-excursion (insert "\n"))))

(defun t1-py-view-mode-toggle ()
  "Python view mode toggle."
  (interactive)
  (if view-mode
      (progn
        (view-mode -1)
        (highlight-indentation-mode -1))
    (view-mode 1)
    (highlight-indentation-mode 1)))


;; for ipython
;; borrow from http://d.hatena.ne.jp/kaz_yos/20131223/1387747252
(defun python-shell-send-region (start end)
  "Send the region delimited by START and END to inferior Python process."
  (interactive "r")
  (python-shell-send-string
   (buffer-substring start end)
   ;; No need to send blank lines in ipython? 2013-12-22
   ;; (concat
   ;;  (let ((line-num (line-number-at-pos start)))
   ;;    ;; When sending a region, add blank lines for non sent code so
   ;;    ;; backtraces remain correct.
   ;;    (make-string (1- line-num) ?\n))
   ;;  (buffer-substring start end))
   nil t))

(defun my-python-start ()
  (interactive)
  (if (not (member "*Python*" (mapcar (function buffer-name) (buffer-list))))
      (progn
        (delete-other-windows)
        (setq w1 (selected-window))
        (setq w1name (buffer-name))
        (setq w2 (split-window w1 nil t))	; Split into two windows
        (call-interactively 'run-python)	; Activate Python if not running (runs ipython)
        (set-window-buffer w1 "*Python*")	; Python on the left (w1)
        (set-window-buffer w2 w1name)		; Script on the right (w2)
        (select-window w2)			; Select script (w2) Added
        )))

;;;###autoload
(defun my-python-eval ()
  (interactive)
  (my-python-start)
  (if (and transient-mark-mode mark-active)			; Check if selection is present
      (python-shell-send-region (point) (mark))			; If selected, send region
    ;; If not selected, do all the following
    (beginning-of-line)						; Move to the beginning of line
    (if (looking-at "def")					; Check if the first word is def (function def)
        (progn							; If it is def
          (python-shell-send-defun ())				; Send whole def
          (python-nav-end-of-defun)				; Move to the end of def
          (python-nav-forward-statement)			; Move to the next statement
          )
      ;; If it is not def, do all the following
      (python-shell-send-region (point-at-bol) (point-at-eol))	; Send the current line
      (python-nav-forward-statement)				; Move to the next statement
      )
    ;; Activate shell window, and switch back
    (progn
      (setq w-script (selected-window))				; Remeber the script window
      (python-shell-switch-to-shell)				; Switch to the shell
      (select-window w-script)					; Switch back to the script window
      )
    ))



(provide 'python_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python_mode_start.el ends here
