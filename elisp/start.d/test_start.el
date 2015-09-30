;;; test_start.el --- test setting space
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:29:09 2012 (+0900)
;; Last-Updated: 2015/09/30 12:34:57 (+0900)
;; Last-Updated: 2013/11/04 17:50:44 (+0900)
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
  (require 't1macro "t1macro")
  (require 'cl "cl" 'noerr)
  (require 'subroutines_start "subroutines_start" 'noerr)
  (require 't1macro "t1macro" 'noerr)
  (require '04_bindings_start "04_bindings_start" 'noerr))


(unless (windows-p)
  (defvar usb-drive-letter))

;;;; for debug
;;
(defun debug-on ()
  "Debug mode on."
  (interactive)
  (setq debug-on-error t))

(defun degug-off ()
  "Debug mode off."
  (interactive)
  (setq debug-on-error nil))

(defun mode-line-point-on ()
  "Set viewable point in mode line."
  (interactive)
  (setq mode-line-format
		'("%e"
		  mode-line-position
		  ",P"
		  (:eval (format "%4d" (point)))
		  " "
		  "%z"   ;mode-line-mule-info
		  " "
		  mode-line-buffer-identification
		  " "
		  "%*"   ;mode-line-modified
		  "%2@"  ;mode-line-remote
		  mode-name
		  )))

(defun mode-line-point-off ()
  "Unset viewable point in mode line."
  (interactive)
  (setq mode-line-format
		'("%e"
		  mode-line-position
		  " "
		  "%z"   ;mode-line-mule-info
		  " "
		  mode-line-buffer-identification
		  " "
		  "%*"   ;mode-line-modified
		  "%2@"  ;mode-line-remote
		  mode-name
		  )))


;; 透明
;; (set-frame-parameter nil 'alpha '(75 65))
;; (set-frame-parameter nil 'alpha '(100 65))

(define-key esc-map "g" goto-map)

;;;; mark-multiple
;;
;; (require 'inline-string-rectangle)
(global-set-key (kbd "s-r") 'inline-string-rectangle)

;; (require 'mark-more-like-this)
(global-set-key (kbd "s-p") 'mark-previous-like-this)
(global-set-key (kbd "s-n") 'mark-next-like-this)
(global-set-key (kbd "s-m") 'mark-more-like-this) ; like the other two, but takes an argum

;;;; expand-region
;;
;; (require 'expand-region)
(global-set-key (kbd "s-@") 'er/expand-region)

;;;; for other window
(global-set-key "\C-x\C-o"     'nil)
(global-set-key "\C-x\C-o\C-f" 'find-file-other-window)
(global-set-key "\C-x\C-o\C-r" 'find-file-read-only-other-window)

;;;; reopen as root
;;
(defun file-root-p (filename)
  "Return t if file FILENAME created by root."
  (eq 0 (nth 2 (file-attributes filename))))

(defun change-as-root ()
  "Opens FILE with root privileges."
  (interactive)
  (set-buffer (find-file (concat "/sudo::" buffer-file-name))))
;;
;;;; end

;;;; multi-region
;;
;; (require 'multi-region)
;; (define-key global-map (kbd "C-x C-SPC") 'multi-region-mark-region)
;; (define-key global-map (kbd "M-@") 'multi-region-execute-command)
;; (define-key global-map (kbd "C-x M-@") 'multi-region-unmark-regions)
;;
;;;;


(define-key cua-global-keymap [C-return] 'open-line-indent)
(defun open-line-indent (n)
  (interactive "*p")
  (open-line n)
  (when (member major-mode '(emacs-lisp-mode
                             lisp-mode lisp-interaction-mode
                             clojure-mode    scheme-mode
                             haskell-mode    ruby-mode
                             rspec-mode      ;python-mode
                             c-mode          c++-mode
                             objc-mode       latex-mode
                             ;; plain-tex-mode
                             ))
    (save-excursion
      (forward-line n)
      (indent-for-tab-command))))

;;;; reverse things
;;
(defun reverse-words (beg end)
  "Reverse the order of words in region.
BEG: start of region
END: end of region"
  (interactive "*r")
  (apply 'insert (reverse (split-string
                           (delete-and-extract-region beg end) "\\b"))))

(defalias 'reverse-line-region 'reverse-region)
;;
;;;;

;;;; popup do functions
;;
(defun popup-functions (list)
  (let ((func (popup-menu*
               (mapcar (lambda (x)
                         (popup-make-item x :value x))
                       list)
               :scroll-bar t)))
    (and func (call-interactively func))
    ))

(defun popup-reverse-commands ()
  (interactive)
  (popup-functions '(reverse-chars-in-region
                     reverse-line-region
                     reverse-words)))

;; (define-key ctl-e-map "V" 'popup-reverse-commands)

;; (defun popup-transpose-commands ()
;;   (interactive)
;;   (popup-functions '(transpose-chars
;;                      transpose-lines
;;                      transpose-paragraphs
;;                      trans-multi-regions
;;                      transpose-regions
;;                      transpose-sentences
;;                      transpose-sexps
;;                      transpose-words)))
;; (define-key ctl-e-map "T" 'popup-transpose-commands)

;; (defun popup-upcase-commands ()
;;   (interactive)
;;   (popup-functions '(upcase-char
;;                      upcase-initials-region
;;                      upcase-region
;;                      upcase-word)))
;; (define-key ctl-e-map "U" 'popup-upcase-commands)

;; (defun popup-downcase-commands ()
;;   (interactive)
;;   (popup-functions '(downcase-char
;;                      downcase-word
;;                      downcase-region
;;                      )))
;; (define-key ctl-e-map "L" 'popup-downcase-commands)

;; (defun popup-sort-commands ()
;;   (interactive)
;;   (popup-functions '(sort-columns
;;                      sort-lines
;;                      sort-lines-random
;;                      sort-numeric-fields
;;                      sort-words
;;                      sort-symbols
;;                      sort-pages
;;                      sort-paragraphs
;;                      sort-regexp-fields)))
;; (define-key ctl-e-map "S" 'popup-sort-commands)

;; http://www.google.com/url?q=http://stackoverflow.com/questions/6172054/how-can-i-random-sort-lines-in-a-buffer&sa=U&ei=IcjXUOe3EcfDmQWynID4CQ&ved=0CC8QFjAJOAo&usg=AFQjCNEjRUrW_v7iAjaq3MpOoS_1WtwyCA
(defun sort-lines-random (beg end)
  "Sort lines in region randomly.
Argument BEG Region of beggining.
Argument END Region of ending."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr nil 'forward-line 'end-of-line nil nil
                   (lambda (s1 s2) (eq (random 2) 0)))))))

;; http://www.emacswiki.org/emacs/SortWords
(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.

    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.

    See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(defun sort-symbols (reverse beg end)
  "Sort symbols in region alphabetically, in REVERSE if negative.
    See `sort-words'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\(\\sw\\|\\s_\\)+" "\\&" beg end))
;;
;;;;

;;;; renumber
;;
(defun renumber (&optional num)
  "Renumber the list items in the current paragraph,
    starting at point."
  (interactive "p")
  (setq num (or num 1))
  (let ((end (save-excursion
               (forward-paragraph)
               (point))))
    (while (re-search-forward "^[0-9]+" end t)
      (replace-match (number-to-string num))
      (setq num (1+ num)))))

(defun renumber-list (start end &optional num)
  "Renumber the list items in the current START..END region.
    If optional prefix arg NUM is given, start numbering from that number
    instead of 1."
  (interactive "*r\np")
  (save-excursion
    (goto-char start)
    (setq num (or num 1))
    (save-match-data
      (while (re-search-forward "^[0-9]+" end t)
        (replace-match (number-to-string num))
        (setq num (1+ num))))))

;;;; increment
;;
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun decrement-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1- (string-to-number (match-string 0))))))

;; (define-key ctl-e-map "+" 'increment-number-at-point)

(add-hook 'rest-room-hook 'garbage-collect)

;;;; clear overlays for interactive
;;
(defun clear-overlays ()
  (interactive)
  (remove-overlays)
  )

(eval-when-compile
  (require 'subroutines_start nil 'noerror))
(when (windows-p)
  ;; (setenv "PATH" (format "I:\\Dos\\unixutils\\;%s" (getenv "PATH")))
  (setq find-dired-find-program (concat (substring usb-drive-letter 0 2)
                                        "\\Dos\\unixutils\\find.exe"))
  (setq find-program (concat (substring usb-drive-letter 0 2)
                             "\\Dos\\unixutils\\find.exe")))

(defun insert-buffer-file-name ()
  (interactive)
  (insert (buffer-file-name)))

(defun insert-file-name-nondirectory ()
  (interactive)
  (insert (file-name-nondirectory (buffer-file-name))))

(defun insert-capitalize-file-name-nondirectory-nonextension ()
  (interactive)
  (insert (upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))))

(defun insert-capitalize-file-name-nondirectory ()
  (interactive)
  (insert (upcase (file-name-nondirectory (buffer-file-name)))))

;;;; ll-debug advance.
;;;; if last-command equal 'yank' then comment or uncomment region
(defun my-ll-debug-toggle-comment-region-or-line ()
  ""
  (interactive)
  (if (eq last-command 'yank)
      (if (save-excursion
            (goto-char (region-beginning))
            (ll-debug-region-or-line-comment-start))
          (ll-debug-uncomment-region (region-beginning) (region-end))
        (comment-region (region-beginning) (region-end))))
  (ll-debug-toggle-comment-region-or-line))

;;;; move edge of font-lock
;;
(defsubst what-face-at-point ()
  (get-char-property (point) 'face))

(defun skip-fontlocks (font-locks arg)
  "Move fontlock edges."
  (let ((orig (point))
        faces)
    (while (and (setq faces (what-face-at-point))
                (dolist-member faces font-locks))
      (forward-char arg))
    (when (not (eq orig (point)))
      (point))))

(defun dolist-member (targets members)
  ""
  (let ((targets (if (listp targets) targets (list targets)))
        (members (if (listp members) members (list members)))
        (result t))
    (dolist (tg targets)
      (unless (member tg members)
        (setq result nil)))
    result))


(defun forward-skip-string-regexp ()
  ""
  (interactive)
  (skip-fontlocks '(font-lock-string-face
                    font-lock-regexp-grouping-backslash
                    font-lock-regexp-grouping-construct) 1)
  )

(defun backward-skip-string-regexp ()
  ""
  (interactive)
  (skip-fontlocks '(font-lock-string-face
                    font-lock-regexp-grouping-backslash
                    font-lock-regexp-grouping-construct) -1)
  )

;;;; move
;;
(defun t1-forward-thing (arg)
  "ARG"
  (interactive "p")
  (cond ((eq (what-face-at-point) (or 'font-lock-string-face
                                      'font-lock-regexp-grouping-backslash
                                      'font-lock-regexp-grouping-construct))
         (forward-skip-string-regexp))
        (t (forward-list arg))))

(defun t1-backward-thing (arg)
  "ARG"
  (interactive "p")
  (cond ((eq (what-face-at-point) (or 'font-lock-string-face
                                      'font-lock-regexp-grouping-backslash
                                      'font-lock-regexp-grouping-construct))
         (backward-skip-string-regexp))
        (t (backward-list arg))))


;;;; align space
;;
(defun align--space (arg)
  ""
  (let ((count 0)
        (startc (current-column))
        endc)
    (save-excursion
      (line-move arg nil nil 'try-vscroll)
      (while (and (blank-line-p)
                  (not (bobp))
                  (> 10 count))
        (incf count)
        (line-move arg nil nil 'try-vscroll))
      (skip-chars-forward " \t")
      (setq endc (current-column)))
    (insert-char 32 (- endc startc))
    ))

(defun backward-align-space (arg)
  "align-space"
  (interactive "p")
  (align--space (- arg)))

(defun forward-align-space (arg)
  "align-space"
  (interactive "p")
  (align--space arg))
;; (define-key ctl-e-map "F" 'backward-align-space)
;; (define-key ctl-e-map "\M-f" 'backward-align-space)


;;;; reopen file
;;
(defun re-find-file ()
  ""
  (interactive)
  (let ((buf-name (buffer-file-name)))
    (kill-this-buffer)
    (find-file buf-name)
    (message "reopened %s" buf-name)))
(defalias 're-open 're-find-file)
(global-set-key "\C-x\C-\M-s" 're-find-file)


;;;; alias
;;
(defalias 'symf 'symbol-file)

;;;; python
(defun py--go-to-paren-class ()
  "go-to-paren-class"
  (while (and (not (looking-at "^\\_<\\(def\\|class\\)\\_>[ \n\t]"))
              (re-search-backward
               "[ \t]*\\_<\\(def\\|class\\)\\_>[ \n\t]" nil 'noerror))))

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



;;;; python outline
;;
;; (defun py-outline-level ()
;;   (let (buffer-invisibility-spec)
;;     (save-excursion
;;       (skip-chars-forward "    ")
;;       (current-column))))

;; (add-hook 'outline-minor-mode-hook
;;           (lambda ()
;;             (require 'outline-magic)
;;             ))
;; (add-hook 'python-mode-hook 'my-python-outline-hook)

;; (defun py-outline-hook ()
;;   ""
;;   (setq outline-regexp "[ \t]*# \\|[ \t]+\\(class\\|def\\|if\\|elif\\|else\\|while\\|for\\|try\\|except\\|with\\) ")
;;   (setq outline-level 'py-outline-level)

;;   (outline-minor-mode t)
;;   (hide-body)
;;   (show-paren-mode 1)
;;   (define-key python-mode-map "\M-i" 'indent-for-tab-command)
;;   ;; (define-key outline-minor-mode-map "KEY" 'FUNC)
;;   )



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


;;;; duplicate-line
;;
(defadvice duplicate-line
  (around inhibit-overwrite-kill-ring activate)
  (let ((tmp (car kill-ring)))
    ad-do-it
    (setcar kill-ring tmp)
    ))
;; (progn (ad-disable-advice 'duplicate-line 'around 'inhibit-overwrite-kill-ring) (ad-update 'duplicate-line)))


;;;; alias
;;
(defalias 're-in-string 'string-match)

;;;; toggle-mode-line
;;
(defvar orig-mode-line-format nil)

(defun toggle-mode-line ()
  "Toggle-mode-line."
  (interactive)
  (if orig-mode-line-format
      (progn (setq mode-line-format orig-mode-line-format
                   orig-mode-line-format nil))
    (setq orig-mode-line-format mode-line-format)
    (setq mode-line-format '("%e"
                             mode-line-position
                             ",P"
                             (:eval (format "%4d" (point)))
                             " "
                             "%z"   ; mode-line-mule-info
                             " "
                             mode-line-buffer-identification
                             " "
                             "%*"   ; mode-line-modified
                             "%2@"  ; mode-line-remote
                             mode-name
                             )))
  )

;;;; key bind overwrite
(global-set-key "\M-<" 'tabbar-backward-tab)


;;;; replace "\" to "\\"
;;
(defun replace-dir-sep ()
  "replace-dir-sep"
  (interactive)
  (query-replace "\\" "\\\\"))
;; (define-key ctl-e-map "\\" 'replace-dir-sep)


;;;; moccur
;;
(defadvice moccur-set-key
  (after moccur-set-key-hook activate)
  (color-moccur-mode-map-predefine)
  )
;; (progn (ad-disable-advice 'moccur-set-key 'after 'moccur-set-key-hook) (ad-update 'moccur-set-key))

;; (defadvice moccur-mode-edit-set-key
  ;; (after moccur-mode-edit-set-key-hook activate)
  ;; (moccur-edit-mode-map-predefine)
  ;; )
;; (progn (ad-disable-advice 'moccur-mode-edit-set-key 'after 'moccur-mode-edit-set-key-hook) (ad-update 'moccur-mode-edit-set-key))



;;;; void function at startup
;;(defalias 'line-end-position 'eol)
;;(defalias 'line-beginning-position 'bol)

(defun narrow-to-line ()
"Narrowing line."
  (narrow-to-region (line-beginning-position) (line-end-position)))


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

;;;; text translate
;;
(global-set-key "\C-ed" 'text-translator-all-by-auto-selection)

;;;; edit server for chrome
;;
(autoload 'edit-server-start "edit-server")
(add-hook 'after-init-idle-timer-hook 'edit-server-start)

(defun edit-server-predefine ()
  "For `eval-after-load edit-server' function."
  (message "Loading edit-server..")
  (setq edit-server-new-frame nil)
  )

(eval-after-load 'edit-server '(edit-server-predefine))


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

;;;; replace directory separator
;;
(autoload 'replace-string "replace")
(defun rep-dir-sep (start end)
  "Replace directory separator.
START: start of region
END: end of region"
  (interactive "r")
  (save-excursion
    (cond
     ((save-excursion (search-backward "\\\\" start 'noerror))
      (replace-string "\\\\" "/" nil start end))
     ((save-excursion (search-backward "\\" start 'noerror))
      (replace-string "\\" "\\\\" nil start end))
     ((save-excursion (search-backward "/" start 'noerror))
      (replace-string "/" "\\" nil start end))
     )))
;; (define-key ctl-e-map "\\" 'rep-dir-sep)

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


;;;; yasnippet
;;
(defun t1-parence ()
  ""
  (interactive)
  (cond
   ;; ((and (looking-at ")")
   ;; (eq last-command this-command))
   ;; (delete-char 1))
   ((and (eq last-command this-command)
         (looking-back "("))
    (insert "())")
    (backward-char 2)
    )
   (t (insert "()")
      (backward-char))))

(global-set-key "(" 't1-parence)


;;;; stack point
;;
(defvar stack-point nil)
(defvar stack-point-max 20)
(defun stack-point ()
  ""
  (setq stack-point (cons (list (buffer-file-name) (point)) stack-point))
  (length stack-point)
  (when (> (length stack-point) stack-point-max)
    (setcdr (nthcdr (1- stack-point-max) stack-point) nil))
  )

(defun pop-stack-point ()
  ""
  (interactive)
  (let ((dst (pop stack-point)))
    (when (eq dst nil)
      (error "No stack point"))
    (when (not (eq (car dst) nil))
      (find-file (car dst))
      (goto-char (car (cdr dst)))
      )))

(defadvice jedi:goto-definition
  (before stack-point-jedi:goto-definition activate)
  (stack-point)
  )
;; (progn (ad-disable-advice 'jedi:goto-definition 'before 'stack-point-jedi:goto-definition) (ad-update 'jedi:goto-definition))

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

;;;; windows bat mode
;;
(setq auto-mode-alist
      (append
       (list (cons "\\.[bB][aA][tT]$" 'bat-mode))
       ;; For DOS init files
       (list (cons "CONFIG\\."   'bat-mode))
       (list (cons "AUTOEXEC\\." 'bat-mode))
       auto-mode-alist))

(autoload 'bat-mode "bat-mode"
  "DOS and WIndows BAT files" t)


;;;; shell mode
;;
(add-hook 'sh-mode-hook 'sh-mode-hook-predefine)

;;;; uniq region
;;
(defun uniq-region (start end)
  ""
  (interactive "*r")
  (shell-command-on-region start end "uniq" nil 'replace)
  )

;;;; alias
;;
(defalias 'bookmark-most-using-t1 'bookmark-set)

;;;; emacswiki
;;
;; (add-to-list 'load-path "~/.emacswikipages/" t)

;;;; recompile recursively
(defun myrecompile-recursively (dirs)
  "Recompile recursively.
DIRS: directory."
  (interactive)
  (dolist (dir (recursive-directory dirs))
    (dolist (f (directory-files dir 'full "\\.el\\`"))
      (unless (file-accessible-directory-p f)
        (batch-byte-compile-file f)))))

(defun recursive-files (dir &optional regexp) ;[2013/11/24]
  "DIR
REGEXP"
  (flatten (mapcar
            (lambda (d) (directory-files d 'full regexp))
            (recursive-directory dir))))

(defun flatten (list)
  (cond ((null list) nil)
        ((atom list) (list list))
        (t
         (append (flatten (car list)) (flatten (cdr list))))))

(defun walk-edit (func dir &optional regexp exclude save kill) ;[2013/11/25]
  "DIR
REGEXP"
  (let ((co-check-type-miss t))
    (dolist (file (recursive-files dir regexp))
      (unless (and exclude (string-match exclude file))
        (with-current-buffer (find-file-noselect file)
          (read-only-mode -1)
          (goto-char (point-min))
          (widen)
          (funcall func)
          (and save (save-buffer))
          (and (not (buffer-modified-p)) kill (kill-this-buffer)))))))

;;;; walk-edit
;;
(defun walk-edit-dirs (func dirs &optional nosave nokill)
  "edit-dirs
ex. (\"l:/Office/emacs/.emacs.d/elisp/mylisp\" 'fullpath \".el$\")"
  (let ((files (walk--edit-target-files-from-dirs dirs)))
    (walk--edit func files nosave nokill)
    ))
;; ex. (walk-edit-dirs 'delete-header '(("p:/Office/emacs/.emacs.d/elisp/start.d" 'full ".el$")))

;; ex. (walk-edit-dirs 'python-refactor '(("D:/MYTEMP/updater" 'fullpath ".py$")))
(defun walk--edit (func file-list &optional nosave nokill)
  (dolist (file file-list)
    (do-func--on-file func file nosave nokill)
    ))

(defun walk--edit-target-files-from-dirs (dirs)
  (let (files)
    (dolist (d dirs)
      (message (car d))
      (setq files (append (eval `(directory-files ,@d)) files)))
    files))

(defun do-func--on-file (func file &optional nosave nokill)
  "walk-edit"
  (let ((inhibit-read-only t)
        (no-check-type-miss t))
    (with-current-buffer
        (find-file-noselect file)
      (funcall func)
      (and (buffer-modified-p) (not nosave) (save-buffer))
      (and (not nokill) (kill-this-buffer))
      )
    ))





;; return buffer after auto-async-byte-compile
;; (defadvice auto-async-byte-compile
  ;; (around save-current-buffer-auto-async-byte-compile activate)
  ;; (let ((buffname (current-buffer)))
    ;; ad-do-it
    ;; (sleep-for 1 500)
    ;; (switch-to-buffer buffname)
    ;; ))
;; (progn (ad-disable-advice 'auto-async-byte-compile 'around 'save-current-buffer-auto-async-byte-compile) (ad-update 'auto-async-byte-compile))

(defun pyapropos (keyword)
  "Python apropos.
KEYWORD: search keyword."
  (interactive "sSearch keywords as regexp: ")
  ;; (start-process "pyapropos" (get-buffer-create "*pyapropos*")
  ;; "/usr/bin/python" "-m" "apropos" "--color-normal" keyword)
  (let ((cmdline (concat "/usr/bin/python " "-m " "apropos " ;"--color-normal"
                         keyword)))
    (compilation-start cmdline nil (lambda (mode) (concat "*pyapropos*")))))


;;;; indirect region
;;
;; [2013/09/27]
;; copied from http://www.emacswiki.org/emacs/IndirectBuffers and modified.
(defvar indirect-mode-name nil
  "Mode to set for indirect buffers.")
(make-variable-buffer-local 'indirect-mode-name)

(defun indirect-region (start end &optional buffname)
  "Edit the current region in another buffer.
START:start of region.
END:end of region.
BUFFNAME:extention buffer name.
    If the buffer-local variable `indirect-mode-name' is not set, prompt
    for mode name to choose for the indirect buffer interactively.
    Otherwise, use the value of said variable as argument to a funcall."
  (interactive "r")
  (if buffname
      (setq buffname (concat " " buffname))
    (setq buffname ""))
  (let ((buffer-name (generate-new-buffer-name (concat "*indirect" buffname "*")))
        (mode
         (if (not indirect-mode-name)
             (setq indirect-mode-name
                   (intern
                    (completing-read
                     "Mode: "
                     (mapcar (lambda (e)
                               (list (symbol-name e)))
                             (apropos-internal "-mode$" 'commandp))
                     nil t)))
           indirect-mode-name)))
    (pop-to-buffer (make-indirect-buffer (current-buffer) buffer-name))
    (funcall mode)
    (narrow-to-region start end)
    (goto-char (point-min))
    ;; (shrink-window-if-larger-than-buffer)
    ))


;; for hang up tramp connection
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))

;; advice eval-last-sexp
(defadvice eval-last-sexp
  (before align-eval-last-sexp activate)
  "Align indent before `eval-last-sexp'."
  (unless buffer-read-only
    (save-excursion
      (let ((orig-line (1+ (count-lines 1 (point))))
            start-line)
        (backward-list 1)
        (indent-and-next (- orig-line (1+ (count-lines 1 (point)))))
        ))))
;; (progn (ad-disable-advice 'eval-last-sexp 'before 'align-eval-last-sexp) (ad-update 'eval-last-sexp))

;;;; elisp
(defun at-string|comment-p ()
  "Return non-nil if point is in a literal (a comment or string)."
  ;; We don't need to save the match data.
  (nth 8 (syntax-ppss)))


;;;; smartrep
;;
;; (autoload 'smartrep-define-key "smartrep" nil nil)
;; (smartrep-define-key
    ;; )


;;;; move-text-up basic-edit-toolkit.el
;;
(defadvice move-text-up
  (after move-text-up-previous-line activate)
  (let ((column (current-column)))
    (forward-line (- arg))
    (line-move-to-column column))
  )
;; (progn (ad-disable-advice 'move-text-up 'after 'move-text-up-previous-line) (ad-update 'move-text-up)))

;;;###autoload
(defun rainbow-delimiters-mode-custom-predefine ()
  "For `eval-after-load' rainbow-delimiters customize."
  (message "eval-after-load: \"rainbow-delimiters\" customizing..")
  ;; (custom-set-variables
   ;; '())
  )

;;;###autoload
(defun rainbow-delimiters-mode-predefine ()
  "For `eval-after-load' rainbow-delimiters function."
  (message "eval-after-load: \"rainbow-delimiters\" setting..")
  )

;;;###autoload
(defun rainbow-delimiters-mode-map-predefine ()
  "For rainbow-delimiters key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"rainbow-delimiters\" keymaping.."))
  )

;;;###autoload
(defun rainbow-delimiters-mode-face-predefine ()
  "For rainbow-delimiters face."
  (message "eval-after-load: \"rainbow-delimiters\" Setting faces..")
  (face-spec-set 'rainbow-delimiters-depth-1-face
                 '((((background light)) (:foreground "#707183"))
                   (((background dark)) (:foreground "OrangeRed2"))))
  (face-spec-set 'rainbow-delimiters-depth-2-face
                 '((((background light)) (:foreground "#887070"))
                   (((background dark)) (:foreground "DeepSkyBlue1"))))
  (face-spec-set 'rainbow-delimiters-depth-3-face
                 '((((background light)) (:foreground "#887070"))
                   (((background dark)) (:foreground "gold"))))
  (face-spec-set 'rainbow-delimiters-depth-4-face
                 '((((background light)) (:foreground "#887070"))
                   (((background dark)) (:foreground "SpringGreen3"))))
  (face-spec-set 'rainbow-delimiters-depth-5-face
                 '((((background light)) (:foreground "#887070"))
                   (((background dark)) (:foreground "HotPink"))))
  (face-spec-set 'rainbow-delimiters-depth-6-face
                 '((((background light)) (:foreground "#887070"))
                   (((background dark)) (:foreground "BlueViolet"))))
  (face-spec-set 'rainbow-delimiters-depth-7-face
                 '((((background light)) (:foreground "#887070"))
                   (((background dark)) (:foreground "sienna4"))))
  (face-spec-set 'rainbow-delimiters-depth-8-face
                 '((((background light)) (:foreground "#887070"))
                   (((background dark)) (:foreground "seashell4"))))
  (face-spec-set 'rainbow-delimiters-depth-9-face
                 '((((background light)) (:foreground "#887070"))
                   (((background dark)) (:foreground "white"))))
  )

(defvar rainbow-delimiters-eval-after-load-hook nil
  "Hook for rainbow-delimiters `eval-after-load'.")
(add-hook 'rainbow-delimiters-eval-after-load-hook 'rainbow-delimiters-mode-custom-predefine)
(add-hook 'rainbow-delimiters-eval-after-load-hook 'rainbow-delimiters-mode-predefine 'append)
(add-hook 'rainbow-delimiters-eval-after-load-hook 'rainbow-delimiters-mode-map-predefine 'append)
(add-hook 'rainbow-delimiters-eval-after-load-hook 'rainbow-delimiters-mode-face-predefine 'append)
(run-hooks-after-load "rainbow-delimiters" 'rainbow-delimiters-eval-after-load-hook)

(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
;; (remove-hook 'emacs-lisp-mode-hook '(lambda () ))



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

;;;; override log-edit for svn commit auto insert Author name
;;
(eval-after-load 'log-edit
  '(progn
     (message "eval-after-loaded log-edit")
     (define-key log-edit-mode-map "\C-s" 'log-edit-done)
     (defadvice log-edit
       (around override-log-edit activate)
       (let ((parent (current-buffer)))
         (if buffer (pop-to-buffer buffer))
         (when (and log-edit-setup-invert (not (eq setup 'force)))
           (setq setup (not setup)))
         (when setup
           (erase-buffer)
           (insert "Summary: \nAuthor: " user-full-name)
           (save-excursion (insert "\n\n")))
         (if mode
             (funcall mode)
           (log-edit-mode))
         (set (make-local-variable 'log-edit-callback) callback)
         (if (listp params)
             (dolist (crt params)
               (set (make-local-variable (car crt)) (cdr crt)))
           ;; For backward compatibility with log-edit up to version 22.2
           ;; accept non-list PARAMS to mean `log-edit-list'.
           (set (make-local-variable 'log-edit-listfun) params))

         (if buffer (set (make-local-variable 'log-edit-parent-buffer) parent))
         (set (make-local-variable 'log-edit-initial-files) (log-edit-files))
         (when setup (run-hooks 'log-edit-hook))
         (goto-char (point-min)) (push-mark (point-max))
         (message "%s" (substitute-command-keys
                        "Press \\[log-edit-done] when you are done editing.")))
       )
     ;; (progn (ad-disable-advice 'log-edit 'around 'override-log-edit) (ad-update 'log-edit)))
     (defadvice log-edit
       (after move-editable-point-log-edit activate)
       (end-of-line)
       )
     ;; (progn (ad-disable-advice 'log-edit 'after 'move-editable-point-log-edit) (ad-update 'log-edit)))
     ))


;;;; memo
;;
;; (auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/deferred.el")
;; (auto-install-from-url "https://github.com/kiwanami/emacs-deferred/raw/master/concurrent.el")
;; (auto-install-from-url "https://github.com/magnars/dash.el/raw/master/dash.el")
;; (auto-install-from-url "https://github.com/rejeep/f.el/raw/master/f.el")
;; (auto-install-from-url "https://github.com/magnars/s.el/raw/master/s.el")
;; (auto-install-from-url "https://github.com/syohex/emacs-import-popwin/raw/master/import-popwin.el")
;; (auto-install-from-url "https://github.com/emacs-jp/init-loader/raw/master/init-loader.el")
;; (auto-install-from-url "http://homepage1.nifty.com/bmonkey/emacs/elisp/mcomplete.el")
;; (auto-install-from-url "http://www.meadowy.org/~shirai/elips/sorter.el")
;; (auto-install-from-url "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")


(defvar package-user-dir (expand-file-name "~/.emacs.d/elisp/plugin"))


(defun before-save-align-tail () ;[2013/11/03]
  "For `before-save-hook'."
  (let ((inhibit-read-only t))
    (save-excursion
      (goto-char (point-max))
      (when (and (re-search-backward "" nil 'noerror)
                 (not (looking-back "\n\n\n")))
        (forward-char -1)
        (delete-blank-lines)
        (insert "\n\n"))
      )))

;; for no log on anything *Anything Log*
(setq debug-on-error nil)

(defun elisp-save-buffer (ARGS) ;[2013/11/03]
  "For `before-save-hook'.
ARGS:"
  (interactive "p")
  (let ((inhibit-read-only t))
    (save-excursion
      (goto-char (point-max))
      (when (and (re-search-backward "" nil 'noerror)
                 (or (looking-back "\n\n\n\n")
                     (not (looking-back "\n\n\n"))))
        (forward-char -1)
        (delete-blank-lines) ;for no blank line
        (delete-blank-lines)
        (insert "\n\n"))))
  (save-buffer ARGS))


;;;; after init
;;
(add-hook 'after-init-idle-timer-hook '(lambda ()
                                         (require 't1macro "t1macro" 'noerr)))
;; (remove-hook 'after-init-idle-timer-hook '(lambda () ))


(defun mark-wrap (n) ;[2013/11/04]
  "Wrap marked statements.
N: `self-insert-command' number."
  (interactive "*p")
  (if mark-active
      (save-excursion
        (let ((start (region-beginning))
              (end (region-end))
              (char (case last-input-event
                      (41 "(")
                      (93 "[")
                      (125 "{")
                      (39  "'")
                      (34  "\"")
                      (62  "<")
                      )))
          (princ last-input-event)
          (deactivate-mark)
          (goto-char end)
          (self-insert-command n)
          (goto-char start)
          (insert char)))
    (self-insert-command n)))


(add-hook 'prog-mode-hook '(lambda () (setq backup-inhibited nil)))
;; (remove-hook 'prog-mode-hook '(lambda () (setq backup-inhibited nil)))

(defadvice save-buffer
  (before save-buffer-make-backup activate)
  (when (called-interactively-p 'interactive)
    (setq backup-inhibited nil))
  )
;; (progn (ad-disable-advice 'save-buffer 'before 'save-buffer-make-backup) (ad-update 'save-buffer)))

;;;###autoload
(defun checkdoc-mode-custom-predefine ()
  "For `eval-after-load' checkdoc customize."
  (message "eval-after-load: \"checkdoc\" customizing..")
  (custom-set-variables
   '(checkdoc-autofix-flag 'automatic))
  )

;;;###autoload
(defun checkdoc-mode-predefine ()
  "For `eval-after-load' checkdoc function."
  (message "eval-after-load: \"checkdoc\" setting..")
  )

;;;###autoload
(defun checkdoc-mode-map-predefine ()
  "For checkdoc key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"checkdoc\" keymaping.."))
  )

;;;###autoload
(defun checkdoc-mode-face-predefine ()
  "For checkdoc face."
  (message "eval-after-load: \"checkdoc\" Setting faces..")
  )

(defvar checkdoc-eval-after-load-hook nil
  "Hook for checkdoc `eval-after-load'.")
(add-hook 'checkdoc-eval-after-load-hook 'checkdoc-mode-custom-predefine)
(add-hook 'checkdoc-eval-after-load-hook 'checkdoc-mode-predefine 'append)
(add-hook 'checkdoc-eval-after-load-hook 'checkdoc-mode-map-predefine 'append)
(add-hook 'checkdoc-eval-after-load-hook 'checkdoc-mode-face-predefine 'append)
(run-hooks-after-load "checkdoc" 'checkdoc-eval-after-load-hook)



;;;; beep handling
;;
(defun my-bell-function ()
  (unless (memq this-command
                '(isearch-abort
                  abort-recursive-edit
                  exit-minibuffer
                  keyboard-quit
                  mwheel-scroll
                  down
                  up
                  next-line
                  previous-line
                  backward-char
                  forward-char))
    (ding)))

(setq ring-bell-function 'my-bell-function)


;;;; keyboard macro
(global-set-key (kbd "s-<f4>") 'kmacro-edit-macro)
(global-set-key (kbd "C-x <f4>") 'name-last-kbd-macro)
(global-set-key (kbd "C-x s-<f4>") 'insert-kbd-macro)


;; (eval-when-compile
;;   (require 't1macro "t1macro"))


(defalias 'symbol-to-string 'symbol-name)


;;;; for anything M-x history
;;
;; (add-hook 'after-init-idle-timer-hook '(lambda () (desktop-save-mode 1)))

;; ;;;###autoload
;; (defun desktop-mode-custom-predefine ()
;;   "For `eval-after-load' desktop customize."
;;   (message "eval-after-load: \"desktop\" customizing..")
;;   (custom-set-variables
;;    '(desktop-globals-to-save '(extended-command-history))
;;    '(desktop-file-not-to-save "")
;;    '(desktop-path my-var-dir)
;;    '(desktop-load-locked-desktop t))
;;   )

;; ;;;###autoload
;; (defun desktop-mode-predefine ()
;;   "For `eval-after-load' desktop function."
;;   (message "eval-after-load: \"desktop\" setting..")
;;   )

;; (defvar desktop-eval-after-load-hook nil
;;   "Hook for desktop `eval-after-load'.")
;; (add-hook 'desktop-eval-after-load-hook 'desktop-mode-custom-predefine)
;; (add-hook 'desktop-eval-after-load-hook 'desktop-mode-predefine 'append)
;; (run-hooks-after-load "desktop" 'desktop-eval-after-load-hook)

;;;; quickrun
;;
(autoload 'quickrun "quickrun" nil 'intractive)

;;;###autoload
(defun quickrun-mode-custom-predefine ()
  "For `eval-after-load' quickrun customize."
  (message "eval-after-load: \"quickrun\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun quickrun-mode-predefine ()
  "For `eval-after-load' quickrun function."
  (message "eval-after-load: \"quickrun\" setting..")
  (quickrun-add-command
   "c++/g++" '((:command . "g++")
               (:exec    . ("%c -std=c++11 -x c++ %o -o %e %s" "%e %a"))
               (:compile-only . "%c -std=c++11 -Wall -Werror %o -o %e %s")
               (:remove  . ("%e"))
               (:description . "Compile C++ file with g++ and execute"))
   :override t)

  (quickrun-add-command
   "c++/clang++" '((:command . "clang++")
                   (:exec    . ("%c -std=c++11 -x c++ %o -o %e %s" "%e %a"))
                   (:compile-only . "%c -std=c++11 -Wall -Werror %o -o %e %s")
                   (:remove  . ("%e"))
                   (:description . "Compile C++ file with llvm/clang++ and execute"))
   :override t))

;;;###autoload
(defun quickrun-mode-map-predefine ()
  "For quickrun key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"quickrun\" keymaping.."))
  )

;;;###autoload
(defun quickrun-mode-face-predefine ()
  "For quickrun face."
  (message "eval-after-load: \"quickrun\" Setting faces..")
  )

(defvar quickrun-eval-after-load-hook nil
  "Hook for quickrun `eval-after-load'.")
(add-hook 'quickrun-eval-after-load-hook 'quickrun-mode-custom-predefine)
(add-hook 'quickrun-eval-after-load-hook 'quickrun-mode-predefine 'append)
(add-hook 'quickrun-eval-after-load-hook 'quickrun-mode-map-predefine 'append)
(add-hook 'quickrun-eval-after-load-hook 'quickrun-mode-face-predefine 'append)
(run-hooks-after-load "quickrun" 'quickrun-eval-after-load-hook)


;; (defadvice quickrun
;;   (around inhibit-read-only-quick-run activate)
;;   (let ((inhibit-read-only t))
;;     ad-do-it
;;     (with-current-buffer (get-buffer quickrun/buffer-name)
;;       (scroll-down 1))))
;; (progn (ad-disable-advice 'quickrun 'around 'inhibit-read-only-quick-run) (ad-update 'quickrun))
;; (push '("*quickrun*") popwin:special-display-config)

;; (defadvice quickrun
;;   (before kill-quickrun-buffer activate)
;;   (let ((buf (get-buffer quickrun/buffer-name)))
;;     (when buf
;;       (kill-buffer buf))))
;; (progn (ad-disable-advice 'quickrun 'before 'kill-quickrun-buffer) (ad-update 'quickrun))


;; (require 'anything-c-moccur)

;; (defvar anything-cycle-task-count 0)

;; ;; fixme-mode.el と ik:anything-cycle-pattern を参考にした
;; (defun anything-cycle-task ()
;;   (interactive)
;;   (let ((los '("\\_<todo\\_>"
;;                "\\_<kludge\\_>"
;;                "\\_<fixme\\_>"
;;                "\\_<bug\\_>"
;;                "\\_<todo\\_>\\|\\_<fixme\\_>\\|\\_<bug\\_>\\|\\_<kludge\\_>")))
;;     (if (eq this-command real-last-command)
;;         (incf anything-cycle-task-count)
;;       (setq anything-cycle-task-count 0))
;;     (when (>= anything-cycle-task-count (length los))
;;       (setq anything-cycle-task-count 0))
;;     (delete-minibuffer-contents)
;;     (let ((sep (nth anything-cycle-task-count los)))
;;       (insert sep))))

;; (define-key anything-c-moccur-anything-map (kbd "T") 'anything-cycle-task)

;;;; syslog-mode
;;
(add-to-list
 'auto-mode-alist
 '("\\(messages\\(\\.[0-9]\\)?\\|SYSLOG\\)\\'" . syslog-mode))


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


(defalias 'expandmacro 'macroexpand)
(defalias 'expand-macro 'macroexpand)
(defalias 'macro-expand 'macroexpand)


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

(autoload 'anything-c-moccur-buffer-list "anything-c-moccur"  t)


(defun insert-register-disable-exchange (register) ;[2014/06/12]
  "REGISTER"
  (interactive "*cInsert register: ")
  (insert-register register t)
  )


;;;###autoload
(defun grep-edit-finish-save (save) ;[2014/09/05]
  "SAVE"
  (interactive "p")
  (grep-edit-finish-edit)
  (when (or (= save 4) (y-or-n-p "Save some buffer? y or n: "))
    (let ((inhibit-read-only t))
      (save-some-buffers 'noquetion))))

;;;###autoload
(defun list-matched-buffers (re) ;[2014/09/11]
  "RE"
  (interactive)
  (let (buffers)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (string-match re (buffer-name))
          (add-to-list 'buffers buf))))
    buffers))

(defun kill-some-buffers-by-regexp (re) ;[2014/09/09] [2014/09/11]
  "RE"
  (dolist (buf (list-matched-buffers re))
    (kill-buffer buf)))

(defun kill-some-buffers-by-extension (ext) ;[2013/11/25] [2014/09/09]
  "EXT"
  (interactive "sExtension: ")
  (let ((re (format "\\.%s\\'" ext)))
    (message "kill-buffer by %s" re)
    (kill-some-buffers-by-regexp re)
    (message "Finished." )))

;;;###autoload
(defun kill-some-gud-buffers () ;[2014/09/09]
  ""
  (interactive)
  (let ((re "^\\*gud"))
    (kill-some-buffers-by-regexp re)))



;; 'grow-only to t for flycheck
(setq resize-mini-windows t)

(require 's "s" 'noerr)


(defun e2wm:dp-pycode-navi-relaunch-sub-ipython () ;[2014/12/28]
  ""
  (interactive)
  (let ((buf (get-buffer "*IPython*")))
    (when buf
      (kill-buffer buf))
    (e2wm:dp-pycode-navi-sub-ipython)))


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


;;;; e2wm
;;
;; override
(defun e2wm:def-plugin-files (frame wm winfo)
  (let* ((buf (wlf:get-buffer (e2wm:pst-get-wm) 'main))
         (wname (wlf:window-name winfo))
         (opts (wlf:window-option-get winfo :plugin-args))
         (opt-sort-key (or (plist-get opts ':sort) 'name))
         (opt-hide-hidden (not (plist-get opts ':show-hidden)))
         (dir (with-current-buffer buf
                (or default-directory ".")))
         (buf-name (format " *WM:Files-%s*" wname))
         (dbuf (get-buffer buf-name)) pos)
    (unless (and dbuf (buffer-live-p dbuf))
      (setq dbuf (get-buffer-create buf-name))
      (with-current-buffer dbuf
        (e2wm:def-plugin-files-mode)
        (set (make-local-variable 'e2wm:def-plugin-files-dir) dir)
        (set (make-local-variable 'e2wm:def-plugin-files-sort-key) opt-sort-key)
        (set (make-local-variable 'e2wm:def-plugin-files-hide-hidden-files) opt-hide-hidden)
        (setq buffer-read-only t)
        (buffer-disable-undo dbuf)
        (setq pos (point-min))
        (hl-line-mode 1)))
    (with-current-buffer dbuf
      (unwind-protect
          (progn
            (setq buffer-read-only nil)
            (setq pos
                  (if (and e2wm:def-plugin-files-dir
                           (equal e2wm:def-plugin-files-dir dir))
                      (point) (point-min)))
            (setq e2wm:def-plugin-files-dir dir)
            (erase-buffer)
            (e2wm:def-plugin-files-update-buffer dir)
            (goto-char pos))
        (setq buffer-read-only t)))
    (wlf:set-buffer wm wname dbuf)))

;; org-doing
(require 'org-doing "org-doing" 'noerr)
(autoload 'org-doing "org-doing")
(defadvice org-doing-log
  (around org-do-log-inhibit-read-only activate)
  (let ((inhibit-read-only t))
    ad-do-it
    )
  )
;; (progn (ad-disable-advice 'org-do-log 'around 'NAME) (ad-update 'org-do-log))

(custom-set-variables '(org-doing-file "~/.emacs.d/doing.org"))


;; auto-highlight-symbol
;; ahs-edit-mode
;;;###autoload
(defun ahs-edit-mode-tmp-whole-buffer () ;[2015/07/25]
  "ARG
%OPTIONAL
TEMPORARY"
  (interactive)
  (ahs-onekey-edit-function 'whole-buffer nil)
  )

;;;###autoload
(defun py:ahs-edit-mode-def-region () ;[2015/07/25]
  ""
  (interactive)
  (ahs-onekey-edit-function 'pythondef nil)
  )

;;;###autoload
(defun py:ahs-edit-mode-class-region () ;[2015/07/25]
  ""
  (interactive)
  (ahs-onekey-edit-function 'pythonclass nil))

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


(defadvice svn-status
  (before before-delelte-other-window activate)
  (e2wm:stop-management)
  (delete-other-windows)
  )
;; (progn (ad-disable-advice 'svn-status 'before 'before-delelte-other-window) (ad-update 'svn-status))

(defun delete-buffer-regexp (regexp) ;[2015/08/06]
  ""
  (interactive "sSearch keywords as regexp: ")
  (dolist (buffer (buffer-list))
    (when (string-match regexp (buffer-name buffer))
      (kill-buffer buffer)

      )))


(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)


(setq sql-user "root")
(setq sql-password "toor")
(setq sql-database "coop")
(setq sql-server "localhost")
(setq sql-port 3306)

;; (sql-set-product-feature
;;  'mysql :font-lock 'sql-mode-mysql-font-lock-keywords)

;; (sql-set-product-feature 'mysql :sql-program 'sql-mysql-program)
;; (sql-set-product-feature 'mysql :sqli-prompt-regexp "^[0-9]*>")
;; (sql-set-product-feature 'mysql :sqli-prompt-length 5)

(setq sql-postgres-login-params
      '((user :default "root")
        (database :default "coop")
        (server :default "localhost")
        (port :default 3306)))

;;;###autoload
(defun sql-mode-custom-predefine ()
  "For `eval-after-load' sql customize."
  (message "eval-after-load: \"sql\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun sql-mode-predefine ()
  "For `eval-after-load' sql function."
  (message "eval-after-load: \"sql\" setting..")
  (setq truncate-lines t)
  )

;;;###autoload
(defun sql-mode-map-predefine ()
  "For sql key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"sql\" keymaping.."))
  (define-many-keys sql-interactive-mode-map
    ([C-return] 'sql-interactive-auto-semicolon)
    )
  )

;;;###autoload
(defun sql-mode-face-predefine ()
  "For sql face."
  (message "eval-after-load: \"sql\" Setting faces..")
  )

(defvar sql-eval-after-load-hook nil
  "Hook for sql `eval-after-load'.")
(add-hook 'sql-eval-after-load-hook 'sql-mode-custom-predefine)
(add-hook 'sql-eval-after-load-hook 'sql-mode-predefine 'append)
(add-hook 'sql-eval-after-load-hook 'sql-mode-map-predefine 'append)
(add-hook 'sql-eval-after-load-hook 'sql-mode-face-predefine 'append)
(add-hook 'sql-eval-after-load-hook 'sql-interactive-mode-map-predefine 'append)
(run-hooks-after-load "sql" 'sql-eval-after-load-hook)

;;;###autoload
(defun sql-interactive-mode-map-predefine () ;[2015/08/24]
  ""
  (interactive)
  (define-many-keys sql-interactive-mode-map
    ("\C-j" 'backward-char))
  )


(defun sql-interactive-auto-semicolon () ;[2015/08/26]
  ""
  (interactive)
  (when (not (looking-back "[\s]*;"))
    (insert ";"))
  (comint-send-input))


;; (defalias 'window-width 'window-body-width)

;; (defun term-window-width ()
;;   (if (and (not (featurep 'xemacs))
;;            (display-graphic-p)
;;            overflow-newline-into-fringe
;;            (/= (frame-parameter nil 'right-fringe) 0))
;;       (/ (window-body-width nil t) (frame-char-width))
;;     (1- (window-width))))

(setq term-prompt-regexp "^[^#$%>\\n]*[#$%>] *")


;; (defadvice package-initialize
;;     (around inhibit-read-only-package-initialize activate)
;;   (let ((inhibit-read-only t))
;;     ad-do-it
;;     ))
;; ;; (progn (ad-disable-advice 'package-initialize 'around 'inhibit-read-only-package-initialize) (ad-update 'package-initialize))

;; inhibit error "read-only init.el"
(setq package-enable-at-startup nil)

;; inhibit slowly cursor move
;; http://d.hatena.ne.jp/daimatz/20120215/1329248780
(defadvice linum-schedule (around delay-linum-schedule () activate)
  (run-with-idle-timer 0.3 nil #'linum-update-current))


;; transparent
;; (set-frame-parameter (selected-frame) 'alpha '(70 50))


;;;###autoload (add-to-list 'auto-mode-alist '("\\.device\\'" . systemd-mode))
;;;###autoload (add-to-list 'auto-mode-alist '("\\.path\\'" . systemd-mode))
;;;###autoload (add-to-list 'auto-mode-alist '("\\.swap\\'" . systemd-mode))
;;;###autoload (add-to-list 'auto-mode-alist '("\\.snapshot\\'" . systemd-mode))
;;;###autoload (add-to-list 'auto-mode-alist '("\\.scope\\'" . systemd-mode))
;;;###autoload (add-to-list 'auto-mode-alist '("\\.service\\'" . systemd-mode))


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



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; no-update-autoloads: t
;; End:
;;; test_start.el ends here
