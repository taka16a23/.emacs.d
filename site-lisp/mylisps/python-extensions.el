;; -*- Mode: Emacs-Lisp -*-

;;; python-extensions.el --- functions for python
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/01/25 01:02:44 (+0900)
;; Last-Updated: 2013/11/17 09:24:15 (+0900)
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
;; 2013/11/14    Atami
;;    Refacted: `py-auto-colon'
;;
;; 2013/09/09    Atami
;;    Modified: `py--insert-imports'
;;    replace by `py--insert-imports-regexp'
;;    and set regexp for detect imports then call `py--insert-imports-regexp'
;;
;; 2013/09/09    Atami
;;    Added: `py--insert-imports-regexp'
;;    base function for insert imports
;;
;; 2013/03/12    Atami
;;    Modified: `py--import-statement-start-point'
;;    if not exists import statement, try determine point.
;;
;; 2013/03/12    Atami
;;    Added: `py--determine-end-doc-point',
;;    `py--determine-first-definition-point',
;;    `py--determine-head-point'
;;    determination point
;;
;; 2013/02/17    Atami
;;    Fixed: `py--import-statement-start-point', `py--import--statement-end-point'
;;    if not exists import statements return other point.
;;
;; 2013/02/14    Atami
;;    Added: functions `py--import-region', `py--import-statement-start-point',
;;    `py--import--statement-end-point', `py--insert-imports'
;;
;; 2013/02/14    Atami
;;    Fixed: `py-auto-colon'
;;    check string or comment at point by `py--at-comment/string-p'
;;
;; 2013/02/14    Atami
;;    Modified: `py-newline'
;;    `new-line' to `py-newline-and-indent'
;;
;; 2013/02/04    Atami
;;    Fixed: `py--get-class', `py--get-def'
;;    "^class[ \t]*\\([^_0-9][a-zA-Z_][a-zA-Z0-9_]+\\)"
;;    => "^class[ \t]+\\([^_0-9][a-zA-Z_][a-zA-Z0-9_]+\\)"
;;    "^def[ \t]*\\([^_0-9][a-zA-Z_][a-zA-Z0-9_]+\\)"
;;    => "^def[ \t]+\\([^_0-9][a-zA-Z_][a-zA-Z0-9_]+\\)"
;;
;; 2013/01/25    Atami
;;    initialize:
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr))

(require '__python__ "__python__" 'noerr)

;;;###
;; (defsubst python-in-string/comment ()
;;   "Return non-nil if point is in a Python literal (a comment or string)."
;;   ;; We don't need to save the match data.
;;   (nth 8 (syntax-ppss)))

;;;###
;; (defalias 'py--at-comment/string-p 'python-in-string/comment)

(defun py--define-start-point ()
  "Return point that start definition of class or def.
If not exists return nil.
Will skip them in string or comment."
  (save-excursion
    (goto-char (point-min))
    (let (point)
      (while (and
              (setq point (re-search-forward "\\_<\\(class\\|def\\)\\_>" nil t))
              (py:at-string|comment-p)))
      (if point
          (match-beginning 0)
        nil))))

;;;###
;; (defun py-auto-colon ()
;;   "Python auto insert ':'."
;;   (interactive "*")
;;   (back-to-indentation)
;;   (when (and (looking-at py:block-start-re)
;;              (not (py:at-string|comment-p)))
;;     (esc-comment-end-of-line)
;;     (skip-chars-backward " \t")
;;     (unless (looking-back ":")
;;       (insert ":"))))

;; ;;;###
;; (defun py-auto-colon-return-on-line ()
;;   "Auto insert ':' and newline at end of lines."
;;   (interactive)
;;   (py-auto-colon)
;;   (py-return-on-line))

;; (defun py-return-on-line()
;;   (interactive)
;;   (end-of-line)
;;   (newline-and-indent))

;;;###
;; (defun t1-py-newline ()
;;   "Auto insert ':' and newline."
;;   (interactive)
;;   (cond ((looking-at "\\([ \t]+$\\|\n\\)")
;;          (py:auto-colon)
;;          (end-of-line)
;;          ;; (py-newline-and-indent)
;;          (newline-and-indent)
;;          )
;;         (t (newline-and-indent)
;;            ;; (py-newline-and-indent)
;;            )))


;;;; Make '__all__' statement
;;
(defun py--find__all__ ()
  "If __all__ statements exists then return point.
  If not exists __all__ statements then will return nil."
  (save-excursion
    (goto-char (point-min))
    (let ((regexp py:__all__-re)
          found)
      (while (and (not found) (re-search-forward regexp nil t))
        (unless (py:at-string|comment-p)
          (setq found (point))))
      found)))

(defun py-delete-__all__ (point)
  "Delete __all__ statements."
  (save-excursion
    (goto-char point)
    (let ((end (re-search-forward "\]" nil t))
          (start (re-search-backward "\\_<__all__\\_>[[:space:]]*=[[:space:]]*\\s(" nil t)))
      (delete-region start end)
      start)))

(defun py--regexp-list (regexp)
  "Return list from regexp."

  (save-beginning-buffer
   (let (result)
     (while (search-forward-regexp regexp nil 'noerr)
       ;; match-string will mismatch if not use sit-for.
       (sit-for 0)
       (when (not (py:at-string|comment-p))
         (push (match-string-no-properties 1) result)))
     result)))

(defun py--get-global-vars ()
  "Get list of global variables."
  (py--regexp-list "^\\([^#_0-9\n][a-zA-Z_][a-zA-Z0-9_]*\\)[ \t]*=[ \t]*"))

(defun py--get-class ()
  "Get list of class names."
  (py--regexp-list "^class[ \t]+\\([^_0-9][a-zA-Z_][a-zA-Z0-9_]+\\)"))

(defun py--get-def ()
  "Get list of function names."
  (py--regexp-list "^def[ \t]+\\([^_0-9][a-zA-Z_][a-zA-Z0-9_]+\\)"))

(defun py--insert-__all__ (list)
  "Insert __all__ statements and set values."
  (just-one-blank-line)
  (insert "\n__all__ = [")
  (when list
    (insert (mapconcat (lambda (s) (format "\'%s\'" s)) list ",")))
  (save-excursion (insert "]\n"))
  (py:refact-list-horizontal))

;;;###autoload
(defun py-make-__all__-from-buffer ()
  "Create __all__ statements from buffer."
  (interactive "*")
  (when (not (eq major-mode 'python-mode))
    (error (message "This function for python-mode.")))
  (let ((point (py--find__all__))
        (class (py--get-class))
        (def (py--get-def))
        (global-vars (py--get-global-vars))
        all)
    ;; list to all
    (dolist (var '(global-vars class def))
      (eval `(when ,var
               (setq all (append ,var all)))))
    ;; delete __all__ statement if exists.
    (if point
        (setq point (py-delete-__all__ point))
      (setq point (py--determine-__all__-point)))
    ;; make __all__ statement
    (goto-char point)
    (py--insert-__all__ (reverse all))))

;;;###autoload
(defun py-add-to-__all__ ()
  "add-to-__all__"
  (interactive "*")
  (when (not (eq major-mode 'python-mode))
    (error (message "This function for python-mode.")))
  (let ((thing (thing-at-point 'symbol))
        (point (py--find__all__))
        all)
    (unless thing (error "no such a things"))
    ;; get values from __all__ statements and delete.
    (if point
        (progn
          (setq all (py--__all__-values point))
          (setq point (py-delete-__all__ point)))
      (setq point (py--determine-__all__-point)))
    ;; make list
    (if all
        (add-to-list 'all thing 'append)
      (setq all thing))
    ;; make __all__ statement
    (save-excursion
      (goto-char point)
      (py--insert-__all__ all))
    ))

(defun py--__all__-values (point)
  "Return list of __all__ values."
  (save-excursion
    (let* ((start point)
           (end (progn
                  (goto-char point)
                  (re-search-forward "\]" nil t)
                  (backward-char 1)
                  (point)))
           (plain-txt (buffer-substring-no-properties start end))
           (trimed-txt (mm-replace-in-string plain-txt "\\(?:[ \t\n']\\|#.+\n\\)" ""))
           (found-list (split-string trimed-txt "," 'nonull)))
      found-list)))


;;;; point
;;
(defun py--determine-end-doc-point (&optional truepoint)
  "Determine point that end of document.
If TRUEPOINT is non-nil, don't move forward-line."
  (save-excursion
    (goto-char (point-min))
    (when(re-search-forward "^\"\"\"" 3000 'noerror)
      (forward-skip-string-regexp)
      (when (not truepoint)
        (forward-line 1))
      (point))))

(defun py--determine-first-definition-point (&optional truepoint)
  "Determine point that first def or class statement.
If TRUEPOINT is non-nil don't move previous-line."
  (save-excursion
    (goto-char (point-min))
    (let (point)
      (while (and (setq point (re-search-forward "^\\_<\\(class\\|def\\)\\_>" nil t))
                  (py:at-string|comment-p)))
      (when point
        (if truepoint
            (match-beginning 0)
          (forward-line -1)
          (skip-fontlocks '(font-lock-comment-face
                            font-lock-comment-delimiter-face
                            font-lock-regexp-grouping-backslash
                            font-lock-regexp-grouping-construct
                            ) -1)
          (point))))))

(defun py--determine-head-point ()
  "Determine point that first writable."
  (save-excursion
    (goto-char (point-min))
    (skip-fontlocks '(font-lock-comment-face
                      font-lock-comment-delimiter-face
                      font-lock-regexp-grouping-backslash
                      font-lock-regexp-grouping-construct
                      ) 1)
    (point)))

(defun py--determine-__all__-point ()
  "Determine python __all__ global variables locations.
Return point that after import statements."
  (save-excursion
    (save-restriction
      ;; narrowing
      (narrow-to-region (point-min) (or (py--determine-first-definition-point)
                                        (point-max)))
      (goto-char (point-max))
      (py--import-statement-end-point))))

;;;; for import statement
(defun py--import-region ()
  "import-region"
  (let ((start (py--import-statement-start-point))
        (end (py--import-statement-end-point)))
    (when (and start end)
      (cons start end))))

;; FIXME: (Atami) [2013/09/10]
;; history function add
(defun py--import-statement-start-point ()
  "import-statement-start-point"
  (save-excursion
    (goto-char (point-min))
    (let (point)
      (while (and (setq point (re-search-forward "^\\(from\\|import\\)\\_>" nil t))
                  (py:at-string|comment-p)))
      (if point
          (match-beginning 0)
        ;; if not exists import statements.
        (or (py--determine-end-doc-point)
            (py--determine-first-definition-point)
            (py--determine-head-point))))))

(defun py--import-statement-end-point ()
  "import--statement-end-point"
  (let (point)
    (save-excursion
      (save-restriction
        (narrow-to-region (point-min) (or (py--define-start-point) (point-max)))
        (goto-char (point-max))
        (setq point
              (re-search-backward
               "^\\(?:from\\|import\\|try[ \t]:.*[ \n\t]*\\(?:import\\|from\\)\\)\\_>" nil t)))
      (if point
          (progn
            (goto-char point)
            (if (looking-at "try")
                (progn (re-search-forward "^except")
                       (forward-paragraph 1))
              (forward-line 1)
              (point)))
        ;; if not exists import statements.
        (py--import-statement-start-point)))))

;;;###autoload
(defun py--insert-imports (modulename str &optional tail)
  "
MODULENAME: strings of module name like 'os', 'sys'
STR: will insert strings
TAIL: if non-nill then insert string tail of imports block."
  (py--insert-imports-regexp
   (concat "\\(?:from\\|import\\)[ \t]+" modulename) str tail))

;;;###autoload
(defun py--insert-imports-regexp (regexp str &optional tail)
  "py-insert-imports
REGEXP: search by regexp
STR: will insert strings
TAIL: if non-nill then insert string tail of imports block.
"
  ;; TODO: (Atami) [2013/02/14]
  ;; skip comments or strings
  (let ((region (py--import-region))
        (re regexp))
    (save-excursion
      (save-restriction
        ;; narrowing
        (when region
          (narrow-to-region (car region) (cdr region)))
        (goto-char (point-min))
        (unless (re-search-forward re nil 'noerror)
          (if tail
              (goto-char (point-max))
            (goto-char (point-min)))
          (insert (concat str "\n"))
          )))))


;;;; indirect import region
;;
;;;###autoload
(defun py-indirect-import ()
  "Indirect import region."
  (interactive)
  (save-excursion
    (let* ((region (py--import-region))
           ;; expand region
           (start (progn (goto-char (car region))
                         (forward-line -1)
                         (point)))
           (end (progn (goto-char (cdr region))
                       (forward-line 5)
                       (point)))
           )
      (indirect-region start end (buffer-name))
      )))



(provide 'python-extensions)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python-extensions.el ends here
