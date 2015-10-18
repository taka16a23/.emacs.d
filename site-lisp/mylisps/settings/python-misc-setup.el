;;; python-misc-setup.el ---   Setting for Emacs Lisp mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/15 16:13:17 (+0900)
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


;;;; python
;;
;;;; python check point is in the class block.
;;
(defun py-in-class-block-p ()
  "Return t if point in class block.
Also end of block has indented return t."
  (and (save-excursion
         (py--go-to-paren-class)
         (looking-at "^\\_<\\(class\\)\\_>[ \n\t]"))
       (or (<= 4 (current-indentation))
           (looking-at "^\\_<\\(class\\)\\_>[ \n\t]")
           (save-excursion
             (while (and (or (blank-line-p)
                             (eq (what-face-at-point)
                                 (or 'font-lock-string-face
                                     'font-lock-comment-face)))
                         (not (eobp)))
               (forward-line 1))
             (<= 4 (current-indentation)))
           )))

;;; test function so far
(defun py-go-to-end-of-class ()
  "to-end-of-class"
  (interactive)
  (while (py-in-class-block-p) (not (eobp))
         (forward-line)))

(defun py:insert-conma-end-brackets ()
  ""
  (interactive)
  (py:end-of-brackets)
  (unless (save-excursion (skip-chars-backward " \t\n") (looking-back ","))
    (insert ","))
  (newline-and-indent))

(defun yas-argparse-determine-prog ()
  ""
  (save-excursion
    (goto-char (point-min))
    (if (re-search-forward "\\(.+\\)[ ]+=[ ]+sys.argv\\[0\\]" nil 'noerror)
        (match-string 1)
      (goto-char (py--determine-after-import))
      (insert "\n\nPROG_NAME = sys.argv[0]")
      (message "Inserted \"PROG_NAME = sys.argv[0]\"")
      "PROG_NAME")))


;;;; python debugger pdb
;;
(defun pdb-this-buffer ()
  ""
  (interactive)
  (and (buffer-modified-p)
       (y-or-n-p "Save bufffer? ")
       (save-buffer))
  (let ((cmd (read-from-minibuffer
              "pdb command: "
              (concat "python -u "
                      usb-drive-letter "system/PortablePython/App/Lib/pdb.py "
                      (buffer-file-name)))))
    (pdb cmd)))

(defun py-insert-pdb-set-trace ()
  "Python insert-pdb-set-trace."
  (interactive)
  (ll-debug-open-fresh-line)
  (insert "import pdb; pdb.set_trace()")
  (forward-line)
  (indent-according-to-mode)
  )

;;;; transpose
;;
(defun py-transpose-ope ()
  (interactive)
  (cond ((member (thing-at-point 'symbol) '("and" "is" "or"))
         (transpose-by-operation2))
        ((looking-at
          "\\(+\\|=\\|-\\|*\\|&\\|%\\||\\|\\^\\|>>\\|<<\\|<\\|<=\\|>\\|>=\\|==\\|!=\\)")
         (transpose-by-operation))
        (t (message "tes"))))

(defvar skip-ope "\\(+\\|=\\|-\\|*\\|&\\|%\\||\\|\\^\\|>>\\|<<\\|<\\|<=\\|>\\|>=\\|==\\|!=\\)")
(defvar py-trance-re "[ \t]*\\(+\\|=\\|:\\|-\\|*\\|&\\|%\\||\\|\\^\\|>>\\|<<\\|<\\|<=\\|>\\|>=\\|==\\|!=\\|\\_<\\(?:\\(?:and\\|el\\(?:if\\|se\\)\\|if\\|not\\|or\\)\\)\\_>\\)[ \t]*")

(defun transpose-by-operation ()
  "by-operation"
  (let (startr1 endr1 startr2 endr2)
    (save-excursion
      (setq endr1 (progn
                    (skip-chars-backward skip-ope)
                    (skip-chars-backward "[ \t]")
                    (point)))
      (setq startr1 (progn
                      (re-search-backward py-trance-re nil 'noerror)
                      (match-end 0))))
    (save-excursion
      (setq startr2 (progn
                      (skip-chars-forward skip-ope)
                      (skip-chars-forward "[ \t]")
                      (point)))
      (setq endr2 (progn
                    (re-search-forward py-trance-re nil 'noerror)
                    (match-beginning 0))))
    (transpose-regions startr1 endr1 startr2 endr2)
    ))

(defvar py-trance-re2 "[ \t]*\\(:\\|\\_<\\(?:\\(?:and\\|el\\(?:if\\|se\\)\\|if\\|or\\)\\)\\_>\\)[ \t]*")

(defun transpose-by-operation2 ()
  "by-operation"
  (let (startr1 endr1 startr2 endr2)
    (save-excursion
      (setq endr1 (progn
                    (unless (looking-at "\\_<")
                      (backward-sexp))
                    (skip-chars-backward "[ \t]")
                    (point)))
      (setq startr1 (progn
                      (re-search-backward py-trance-re2 nil 'noerror)
                      (match-end 0))))
    (save-excursion
      (setq startr2 (progn
                      (forward-sexp)
                      (skip-chars-forward "[ \t]")
                      (point)))
      (setq endr2 (progn
                    (re-search-forward py-trance-re2 nil 'noerror)
                    (match-beginning 0))))
    (transpose-regions startr1 endr1 startr2 endr2)
    ))

;;;; pycallgraph
;;
(defvar py-callgraph-result-buffer "*pycallgraph*")

(defun py-callgraph-this-buffer ()
  ""
  (interactive)
  (with-current-buffer (get-buffer-create py-callgraph-result-buffer)
    (erase-buffer))
  (start-process
   "pycallgraph" py-callgraph-result-buffer
   "python" (concat usb-drive-letter "system/PortablePython/App/Scripts/pycallgraph")
   (buffer-file-name))
  (display-buffer py-callgraph-result-buffer))

;;;; python
;;
(defun t1-py-insert-debug-print ()
  "debug-print"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((n 0))
      (while (re-search-forward "\\(^[ \t]*\\(:?def[ \t]+\\([a-zA-Z0-9_]+\\)[ \t]*(\\(:?[^:#]*\\))\\)[ \t]*:\\)" nil 'noerror)
        (forward-line)
        (beginning-of-line)
        (setq n (1+ n))
        (insert (make-string (current-indentation) 32)
                "print('"
                (file-name-nondirectory buffer-file-name)
                " [" (number-to-string n) "]" ; increment number
                ": "
                (match-string 3)
                "') # Debug\n")))))

(defun t1-py-delete-debug-print ()
  "delete-debug-print"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "print('.*\\[[[:digit:]]*\\].*#.*Debug" nil 'noerror)
      (kill-whole-line)
      )))

(defun py-comment-def-or-class ()
  ""
  (interactive)
  (py-mark-def-or-class)
  (my-ll-debug-toggle-comment-region-or-line)
  )

(defun py-comment-or-uncomment-def-or-class ()
  "comment-or-uncomment-def-or-class"
  (interactive)
  (if (t1-py--comment-p)
      (py-uncomment)
    (sit-for 0)
    (py-comment-def-or-class)
    ))

(defsubst t1-py--comment-tes-p ()
  ""
  (let ((face (what-face-at-point)))
    (or (eq 'font-lock-comment-face face)
        (eq 'font-lock-comment-delimiter-face face))))

;;;; python overview
;;
(if (windows-p)
    (defcustom python-overview-command (concat usb-drive-letter
                                               "Lib/.pylib/overview.py")
      "Document"
      :type 'string
      :group 'python-overview)

  ;; posix
  (defcustom python-overview-command (expand-file-name "~/.pylib/overview.py")
    "Document"
    :type 'string
    :group 'python-overview))


(defcustom python-result-buffer "*py-overview*"
  "Document"
  :type 'string
  :group 'python-overview)

(defun python-overview ()
  ""
  (interactive)
  (with-current-buffer (get-buffer-create python-result-buffer)
    (erase-buffer))
  (start-process "overview"
                 (get-buffer-create "*py-overview*")
                 "python"
                 ;; python-overview-command
                 "-m" "overview"
                 (let* ((target (buffer-file-name))
                        (command (concat target)))
                   (read-string "python overview.py: " command t command))))


(defvar py-inhibit-replace-tab nil)
(make-local-variable 'py-inhibit-replace-tab)
(defun py-replace-tab ()
  "ARGS"
  (interactive)
  (let ((inhibit-read-only t))
    (save-restriction
      (goto-char (point-min))
      (and (not py-inhibit-replace-tab)
           (re-search-forward "^\t" nil 'noerror)
           (y-or-n-p "This buffer using tab.  replace to space? ")
           (untabify (point-min) (point-max))))))

(add-hook 'python-mode-hook 'py-replace-tab t)
;; (remove-hook 'python-mode-hook 'py-replace-tab)

(defun py-kill-line (arg)
  "If line is blank, delete all surrounding blank lines, leaving just one.
ARG:
On isolated blank line, delete that one.
On nonblank line, kill whole line."
  (interactive "P*")
  (cond (mark-active
         (cua-cut-region arg))
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
         (kill-whole-line))))

(defun py-clean-kill-region (beg end &optional yank-handler)
  "Python clean blank line after kill region.
BEG: begginning of region
END: end of region
YANK-HANDLER"
  (interactive (list (point) (mark)))
  (kill-region beg end)
  (delete-blank-lines))

(defun pyapropos (keyword)
  "Python apropos.
KEYWORD: search keyword."
  (interactive "sSearch keywords as regexp: ")
  ;; (start-process "pyapropos" (get-buffer-create "*pyapropos*")
  ;; "/usr/bin/python" "-m" "apropos" "--color-normal" keyword)
  (let ((cmdline (concat "/usr/bin/python " "-m " "apropos " ;"--color-normal"
                         keyword)))
    (compilation-start cmdline nil (lambda (mode) (concat "*pyapropos*")))))


(defun py:clonedigger-run (&optional target odir interactive) ;[2013/11/24]
  ""
  (save-some-buffers)
  (let* ((cmd "clonedigger")
         (odir (or odir "/tmp/"))
         (output-file (expand-file-name (concat (buffer-name) ".html") odir))
         (options (format "-o %s" output-file))
         (target (or target (file-name-directory (buffer-file-name)) ""))
         (cmdline (s-join " " (list cmd options target)))
         (cmdline (if interactive
                      (read-string "cmdline: " (concat cmdline " ") nil)
                    cmdline)))
    (compilation-start cmdline nil (lambda (mode) (concat "*clonedigger*")))
    (when (functionp 'w3m-find-file)
      (while (not (file-exists-p output-file))
        (sit-for 3))
      (w3m-find-file output-file))))


(defun py:clonedigger () ;[2013/11/25]
  ""
  (interactive)
  (py:clonedigger-run (buffer-file-name) nil 'interactive))

(defun py:clonedigger-project () ;[2013/11/25]
  ""
  (interactive)
  (py:clonedigger-run
   (file-name-directory (buffer-file-name)) nil 'interactive))

;; borrow from dired-aux.el
(defun py:dired-create-directory (directory) ;[2014/01/16]
  "DIRECTORY"
  (interactive
   (list (read-file-name "Create directory: " (dired-current-directory))))
  (let* ((expanded (directory-file-name (expand-file-name directory)))
         (try expanded) new)
    (if (file-exists-p expanded)
        (error "Cannot create directory %s: file exists" expanded))
    ;; Find the topmost nonexistent parent dir (variable `new')
    (while (and try (not (file-exists-p try)) (not (equal new try)))
      (setq new try
            try (directory-file-name (file-name-directory try))))
    ;; (make-directory expanded t)
    (make-directory (concat (file-name-as-directory expanded) "tests") t)
    (shell-command
     (concat "touch " (file-name-as-directory expanded) "tests/__init__.py"))
    (find-file (expand-file-name "__init__.py" expanded))
    )
  )

;;;; python generate tests method
;;
(defvar testsmethod-template "    def test_%s(self, ):
        self.skipTest('Not Implemented')\n")
(defun py:current-classname () ;[2015/02/04]
  ""
  (when (py:in-class-p)
    (py:beginning-of-class 1))
  (when (py:at-beginning-of-class-p)
    (re-search-forward py:class-name-re nil 'noerror)
    (match-string-no-properties 1)))


(defun py:list--testsmethod-template (cls) ;[2015/02/04]
  "CLS"
  (mapcar
   (lambda (x) (format testsmethod-template x))
   (py:list-method-in-class cls)))


;; (defun py:text--testsmethod (cls) ;[2015/02/04]
;;   "CLS"
;;   (kill-new (s-join "\n" (py:list--testsmethod-template cls)))
;;   (message "!tests method text saved to kill-ring.!"))


(defun py:testsmethod-insert-kill-ring (&optional cls) ;[2015/02/04]
  "CLS"
  (interactive)
  (let ((clsname (or cls (py:current-classname))))
    (when (eq clsname nil)
      (setq clsname (read-input "Input class name: ")))
    (kill-new (s-join "\n" (py:list--testsmethod-template clsname)))
    (message "!tests method text saved to kill-ring.!")))


(defun py:current-defname () ;[2015/02/11]
  ""
  (when (py:in-def-p)
    (py:beginning-of-def 1))
  (when (py:at-beginning-of-def-p)
    (re-search-forward py:def-name-re nil 'noerror)
    (match-string-no-properties 1)))

;; for auto-highlight-symbol.el
(defun py:def-start-point () ;[2015/07/25]
  ""
  (car (py:region-def)))

(defun py:def-end-point () ;[2015/07/25]
  ""
  (cdr (py:region-def)))

(defun py:class-start-point () ;[2015/07/25]
  ""
  (car (py:region-class)))

(defun py:class-end-point () ;[2015/07/25]
  ""
  (cdr (py:region-class)))

;;;; for snippet functions
;;

(defun py-snippet:argparse-add_argument-convert-dest-name (text) ;[2015/09/25]
  "ARGS"
  (let* ((lis (mapcar '(lambda (x) (replace-regexp-in-string "[\"' ]" "" x))
                      (split-string text ",")))
         (n 0)
         (length (length lis))
         matched)
    (unless (eq "" (car lis))
      (while (< n length)
        (when (string-match "^--" (nth n lis))
          (setq matched (substring (nth n lis) 2)))
        (incf n))
      (setq n 0)
      (unless matched
        (while (< n length)
          (when (string-match "^-" (nth n lis))
            (setq matched (substring (nth n lis) 1)))
          (incf n)))
      (unless matched
        (setq matched (car lis)))
      (replace-regexp-in-string "-" "_" matched))
    ))

;;;; snippet helper
;;
(defun prev-def-name ()
  (save-excursion
    (if (re-search-backward "def +\\(.+?\\)(" nil t)
        (match-string 1))))

(defun prev-def-args ()
  (save-excursion
    (if (re-search-backward "def +\\(.+?\\)( *self *,? *\\(.*\\))" nil t)
        (match-string 2))))

(defun prev-class-name ()
  (save-excursion
    (if (re-search-backward "class +\\(.+?\\) *[(:]" nil t)
        (match-string 1))))

;;;; python
(defun py--go-to-paren-class ()
  "go-to-paren-class"
  (while (and (not (looking-at "^\\_<\\(def\\|class\\)\\_>[ \n\t]"))
              (re-search-backward
               "[ \t]*\\_<\\(def\\|class\\)\\_>[ \n\t]" nil 'noerror))))



(provide 'python-misc-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python-misc-setup.el ends here
