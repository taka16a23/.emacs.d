;;; python_mode_start.el --- functions for python mode1
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 22:33:33 2012 (+0900)
;; Last-Updated: 2015/10/05 13:25:58 (+0900)
;; Last-Updated: 2013/11/03 16:25:37 (+0900)
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
;; 2015/09/25    Atami
;;    Remoded: `python-ac-jedi-setup'
;;    supported by jedi
;;
;; 2015/07/27    Atami
;;    Modified: `py:*' `self-insert-command' after "(", "[", ":"
;;
;; 2015/07/27    Atami
;;    Modified: `py:-' `self-insert-command' slice "[-1:-1]"
;;
;; 2015/07/25    Atami
;;    Modified: `python-mode-map-predefine'
;;    Add Keybinding
;;    "\C-eh" `py:ahs-edit-mode-def-region'
;;    "\C-e\C-\M-h" "\C-e\M-h" `py:ahs-edit-mode-class-region'
;;
;; 2015/07/15    Atami
;;    Added: `py--in-return-line-p' predicate on return line
;;
;; 2015/07/15    Atami
;;    Modified: `py-=' `py:in-brackets-p' to insert "=="
;;    if in parameter to insert "="
;;
;; 2015/07/11    Atami
;;    Modified: `py:|' remove `start-operator-|'
;;
;; 2015/07/11    Atami
;;    Modified: `py:&' remove `smart-operator-&'
;;
;; 2015/05/29    Atami
;;    Added: `python-mode-hook-predefine' rotate-text "str" <=> "unicode"
;;
;; 2015/02/01    Atami
;;    Modified: `python-mode-map-predefine'
;;    keybind "C-M-p" to `py-send-region-ipython'
;;
;; 2014/12/26    Atami
;;    Added: `py:&', `py:?', `py:,', `py:|'
;;    Wrap smart-operator and Do `self-insert-command' if at string or comment.
;;
;; 2014/12/24    Atami
;;    Modified: `python-mode-custom-predefine'
;;    `nosetests-ignore-file' move to nosetests_plugin_start.el
;;
;; 2014/12/23    Atami
;;    Modified: `python-mode-custom-predefine'
;;    add custom variable `nosetests-ignore-file'.
;;
;; 2014/12/15    Atami
;;    Added: `py:+', `py:/', `py:%', `py:>', `py:<'
;;    Wrap smart-operator and Do `self-insert-command' if at string or comment.
;;
;; 2014/05/14    Atami
;;    Added: `py:-' Wrap smart-operator and
;;    Do `self-insert-command' if at string or comment.
;;
;; 2014/05/14    Atami
;;    Renamed: `py-*' to `py:*'
;;    Modified: `py:*'
;;    Do `self-insert-command' if at string or comment.
;;
;; 2014/04/28    Atami
;;    Modified: `py-kill-line' insert "\n" if on "^L" after kill-line.
;;
;; 2014/02/25    Atami
;;    Added: `py-*' branch smart-operator
;;
;; 2013/11/16    Atami
;;    Fixed: `py-kill-line' if mark active, `just-one-blank-line', after kiill
;;
;; 2013/10/17    Atami
;;    Added: `t1-py-view-mode-toggle'
;;
;; 2013/09/27    Atami
;;    Modified: `quote-doublequote-toggle'
;;    if not wraped by quote, then wraped it.
;;
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (defvar auto-complete-mode)
  (defvar ac-sources)
  (defvar usb-drive-letter)
  (defvar my-pylib-dir)
  (defvar ropemacs-guess-project)
  (defvar ropemacs-enable-autoimport)
  (defvar ropemacs-autoimport-modules)
  (defvar typemiss-list)
  (defvar rotate-text-rotations)
  (defvar pymacs-timeout-at-start)
  (defvar pymacs-timeout-at-reply)
  (defvar pymacs-load-path)
  (require 'cl "cl" 'noerr)
  (require 't1macro "t1macro" 'noerr)
  (require 'yasnippet "yasnippet" 'noerr)
  (require 'auto-complete "auto-complete" 'noerr)
  (require 'pymacs "pymacs" 'noerr)
  (require 'smartrep "smartrep" 'noerr)
  (require 'smartchr "smartchr" 'noerr)
  (require 'usage-memo "usage-memo" 'noerr)
  (require 'python-mode "python-mode" 'noerr)
  )

(require '__python__ nil 'noerror)

;;;###autoload
(defun python-mode-custom-predefine ()
  "For `eval-after-load' python customize."
  (message "eval-after-load: \"python\" customizing..")
  (custom-set-variables
   '(py-prepare-autopair-mode-p nil)
   '(py-smart-indentation nil)
   '(py-imenu-create-index-p t)
   '(py-trailing-whitespace-smart-delete-p t)
   '(imenu-create-index-function 'py-imenu-create-index-function))
  )

;;;###autoload
(defun python-mode-predefine ()
  "For `eval-after-load' python function."
  (message "eval-after-load: \"python\" setting..")
  ;; before load jedi. escape to override dot keybind.
  (require 'smart-operator "smart-operator" 'noerr)
  (python-setenv)
  (require 'python "python" 'noerr)
  (add-hook 'python-mode-hook 'python-coding-style)
  (add-hook 'python-mode-hook 'python-mode-hook-predefine 'append)
  (add-hook 'python-mode-hook 'hs-minor-mode 'append)
  (add-hook 'python-mode-hook 'smart-operator-mode-on 'append)
  (add-hook 'python-mode-hook 'rope-open-current-or-parent 'append)
  ;; (add-hook 'python-mode-hook '(lambda ()
  ;;                                (unless (eq buffer-file-name nil)
  ;;                                  (flymake-mode 1))) 'append)
  (add-hook 'python-mode-hook 'flycheck-mode 'append)
  (add-hook 'inferior-python-mode-hook 'inferior-python-mode-hook-predefine)
  (add-hook 'py-shell-hook 'py-shell-hook-predefine)
  ;; (remove-hook 'py-shell-hook 'py-shell-hook-predefine)
  (require 'auto-complete-yasnippet "auto-complete-yasnippet" 'noerr)
  (add-to-list 'ac-sources ac-source-yasnippet 'append)
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
    (","              (smartchr '(", `!!'" ",")))
    ("'"              (smartchr '("'`!!''" "'" "'''`!!''''")))
    ;; ("_"              (smartchr '("_" "__`!!'__" "__")))
    ("\""             (smartchr '("\"`!!'\"" "\"" "\"\"\"`!!'\n\"\"\"" "\"")) )
    ([(meta return)]  't1-py-view-mode-toggle)
    ("="              'py-=)   ;must bind in smart-operator_plugin_start.el
    ("+"              'py:+)   ; "
    (":"              'py:-:)  ; "
    ("*"              'py:*)   ; "
    ("-"              'py:-)   ; "
    (">"              'py:>)   ; "
    ("&"              'py:&)   ; "
    ("%"              'py:%)   ; "
    ;; (","              'py:\,)  ; "
    ("|"              'py:|)   ; "
    ("?"              'py:?)   ; "
    ("\C-y"           'py-kill-line)
    ("\C-d"           'py-kill-line)

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
    ([67108896]       'py-seq-set-mark)

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
    ("\C-i"           'py-indent-line)
    ((kbd "TAB")      'py-indent-line)

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
  (message "eval-after-load: \"python\" setting faces..")
  (font-lock-add-keywords
   'python-mode
   '(("#\\([a-z \t]*\\(?:TODO\\|BUG\\|FIXME\\|KLUDGE\\|WARNING\\)\\)"
      1 font-lock-warning-face prepend)))
  ;; pep8 "Names to Avoid"
  (font-lock-add-keywords 'python-mode
                          '(("\\_<\\(l\\|I\\|O\\)\\_>"
                             1 '((t (:inherit flymake-warnline))))))
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
(defun pymacs-predefine ()
  "For `eval-after-load' pymacs function."
  (message "Loading pymacs..")
  (when (require 'pymacs "pymacs" 'noerr)
    (setq pymacs-timeout-at-start 45
          pymacs-timeout-at-reply 7)
    (add-to-list 'pymacs-load-path my-pylib-dir)
    (pymacs-load "ropemacs" "rope-" 'noerror)
    (setq ropemacs-guess-project       t
          ;; ropemacs-codeassist-maxfixes 3
          ropemacs-enable-autoimport   t
          ropemacs-autoimport-modules  '("os" "shutil" "sys" "logging"
                                         "django.*" "re"))
    ;; for usage memo
    (define-usage-memo rope-show-doc "python" 0 "*rope-pydoc*"
      (lambda (arg) (goto-char (point-min))
        (let ((text (buffer-substring (point)
                                      (save-excursion (end-of-line) (point)))))
          (replace-regexp-in-string "\s" "_" text))))
    ))

;;;; python-mode-hook
;;
;;;###autoload
(defun python-coding-style ()
  "Coding style for python."
  (setq indent-tabs-mode nil
        tab-width        4
        ;; python-indent    4   ; for python-mode.el
        python-indent-offset 4 ;for python-mode.el
        fill-column      80))


;;;###autoload
(defun python-mode-hook-predefine ()
  "Python mode hooks."
  (message "run-hooks: python-mode-hook-predefine")
  (hotstring-mode 1)
  (add-hook 'write-file-hooks 'delete-trailing-whitespace 'append 'local)
  (add-hook 'write-file-hooks 'delete-trailing-blank-lines 'append 'local)
  ;; (remove-hook 'write-file-hooks 'delete-trailing-whitespace 'local)
  ;; (remove-hook 'write-file-hooks 'delete-trailing-blank-lines 'local)

  ;; check misstype
  (dolist (el '(("startwith" . "startswith")
                ("endwith" . "endswith")
                ("\\_<slef\\_>" . "self")))
    (add-to-list 'typemiss-list el))
  ;; rotate-text
  (dolist (el '(("import"   "from")
                ("if" "elif" "else")
                ("try" "except" "else" "final")
                ("continue" "break")
                ("is"       "==")
                ("True"     "False")
                ("encode"   "decode")
                ("get"      "set")
                ("self"     "cls")
                ("str"      "unicode")
                ("debug" "error" "fatal" "info" "warn" "critical")
                ("int" "long" "oct" "hex")
                ("TODO" "FIXME" "BUG" "WARNING" "KLUDGE")
                ("globals" "locals")
                ("startswith" "endswith")
                ("len" "bool")
                ))
    (add-to-list 'rotate-text-rotations el))
  ;; indirect
  (setq indirect-mode-name 'python-mode))

;;;###autoload
(defun rope-open-current-or-parent ()
  "Rope open current or parent."
  (cond ((file-exists-p ".ropeproject")
    	 (rope-open-project default-directory))
    	((file-exists-p "../.ropeproject")
    	 (rope-open-project (concat default-directory "..")))))


;; this one is to activate django snippets
;;;###autoload
(defun epy-django-snippets ()
  "Load django snippets."
  (interactive)
  ;; (yas/load-directory (concat my-data-dir "snippets/django"))
  )

;;;###autoload
(defun workon-postactivate (virtualenv)
  "Workon post activate.
VIRTUALENV: virtualenv"
  (require 'virtualenv)
  (virtualenv-activate virtualenv)
  (desktop-change-dir virtualenv))


;;;###autoload
(defun python-flymake-show-help ()
  "Flaymake show help."
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help
          (format
           (concat (propertize "Error: " 'face
                               'flymake-message-face) "%s") help)))))



;;;###autoload
(defun py-quote (args)
  "Pyquote.
ARGS:"
  ;;TODO: self-insert-command with args
  (interactive "p")
  (cond ((looking-at "'")
         (if (eq this-command last-command)
             (save-excursion (replace-match " " nil nil))
           (self-insert-command args)))
        ((eq ?\' (char-after (+ (point) 1)))
         (self-insert-command args) (forward-char 1))
        ((eq ?\' (char-before))
         (self-insert-command args) (backward-char 1))
        ((looking-at "[ \t\n]")
         (self-insert-command 2) (backward-char 1))
        (t (self-insert-command args))
        ))

(defun py-kill-line (arg)
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




;;;; INTERPRETER
;;
(defvar ipython-log-file-format "ipython-log-%Y-%m.py")

(defvar ipython-log-file
  (concat my-emacs-dir
          "data_e/code/python/interpreter/"
          (format-time-string ipython-log-file-format (current-time))
          ))

(defun inferior-python-mode-predefine ()
  "Inferior python mode predefine."
  (message "eval-after-load: \"python\" setting inferior..")
  (if (windows-p)
      (custom-set-variables
       '(python-shell-interpreter-args
         (concat
          "-i " usb-drive-letter
          "system/PortablePython/App/Scripts/ipython-script.py "
          "--ipython-dir="
          usb-drive-letter
          "Office/emacs/.emacs.d/data_e/code/python/interpreter/.ipython"))
       '(py-pylint-command "pylint.bat")
       '(py-pylint-command-args '("-ry -f parseable"))
       '(py-python-command-args
         (list "-i"
               (concat usb-drive-letter
                       "system/PortablePython/App/Scripts/ipython-script.py")
               (concat "--ipython-dir=" my-code-dir
                       "/python/interpreter/.ipython")
               (concat "--logappend=" ipython-log-file)
               )))
    (setq ipython-command "/usr/bin/ipython")
    (custom-set-variables
     '(py-shell-name "ipython")
     '(py-python-command "ipython")
     '(python-shell-interpreter "ipython")
     '(python-shell-prompt-regexp "In \[[0-9]+\]: ")
     '(python-shell-prompt-output-regexp "Out\[[0-9]+\]: ")
     '(python-shell-completion-setup-code "")
     '(python-shell-completion-string-code  "';'.join(get_ipython().complete('''%s''')[1])\n")
     '(python-shell-interpreter-args
       (concat "-i " (concat my-pylib-dir "\\pyStartup.py"))))
    )
  )

;;;###autoload
(defun inferior-python-mode-hook-predefine ()
  "Inferior python mode hook predefine."
  (message "inferior python launched")
  ;; KLUDGE: (Atami) [2013/10/21]
  (setq ipython0.10-completion-command-string "print(';'.join(get_ipython().Completer.all_completions('%s'))) #PYTHON-MODE SILENT\n")
  (setq py-complete-function 'ipython-complete)
  (inferior-python-mode-map-predefine))

(defun inferior-python-mode-map-predefine ()
  "Python inferior map predefine."
  ;; (define-key compilation-shell-minor-mode-map "\C-\M-n" 'cua-scroll-up)
  (define-many-keys py-shell-map
    ("\C-\M-n" 'cua-scroll-up                             )
    ("'"       (smartchr '("'`!!''" "'"))                 )
    ;; ("\C-k"    'comint-previous-input                     )
    ;; ("\C-n"    'comint-next-input                         )
    ;; ("\M-k"    'comint-previous-matching-input-from-input )
    ;; ("\M-n"    'comint-next-matching-input-from-input     )
    ;; ("\C-i"    'py-indent-line                            )
    )
  )

(defun py-shell-hook-predefine () ;[2013/11/16]
  ""
  (local-set-key "\C-\M-n" 'cua-scroll-up)
  (local-set-key "'" (smartchr '("'`!!''" "'")))

  )


(defun py-buffer-name-prepare (name &optional sepchar dedicated)
  "Return an appropriate name to display in modeline.
SEPCHAR is the file-path separator of your system.
NAME:
SEPCHAR:
DEFICATED:"
  (let ((sepchar (or sepchar (char-to-string py-separator-char)))
        prefix erg suffix)
    (when (string-match (regexp-quote sepchar) name)
      (unless py-modeline-acronym-display-home-p
        (when (string-match (concat "^" (expand-file-name "~")) name)
          (setq name (replace-regexp-in-string (concat "^" (expand-file-name "~")) "" name))))
      (save-match-data
        (setq liste (split-string name sepchar)))
      (dolist (ele liste)
        (unless (string= "" ele)
          (setq prefix (concat prefix (char-to-string (aref ele 0))))))
      (unless py-modeline-display-full-path-p

        (setq name (substring name (1+ (string-match (concat sepchar "[^" sepchar "]+$") name))))))
    (setq erg
          (cond ((string= "ipython" name)
                 (replace-regexp-in-string "ipython" "IPython" name))
                ((string= "jython" name)
                 (replace-regexp-in-string "jython" "Jython" name))
                ((string= "python" name)
                 (replace-regexp-in-string "python" "Python" name))
                ((string-match "python2" name)
                 (replace-regexp-in-string "python2" "Python2" name))
                ((string-match "python3" name)
                 (replace-regexp-in-string "python3" "Python3" name))
                (t name)))
    (when (and (windows-p) (string= "Python" erg))
      (setq erg "IPython"))
    (when dedicated
      (setq erg (make-temp-name (concat erg "-"))))
    (cond ((and prefix (string-match "^\*" erg))
           (setq erg (replace-regexp-in-string "^\*" (concat "*" prefix " ") erg)))
          (prefix
           (setq erg (concat "*" prefix " " erg "*")))

          (t (setq erg (concat "*" erg "*"))))
    erg))


;;;; test
;;
(defun py-apropos (keyword)
  "Python apropos.
KEYWORD: keyword"
  (interactive (list (read-string "keyword: ")))
  (compilation-start (concat "pydoc -k " keyword))
  )


;;;; CODE READING
;;;; Edit SOURCE
;;;; Compile BUILD
;;;; RUN
;;;; DEBUG
;;;; PROFILE



(provide 'python_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python_mode_start.el ends here
