;;; __python__operator.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/05 13:03:20 (+0900)
;; Last-Updated: 2015/10/06 12:38:45 (+0900)
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


(defun py--in-condition-p ()
  "If in condition return t.
Else nil."
  (let ((orig (point)))
    (save-excursion
      (re-search-backward
       "^[[:blank:]]*\\_<\\(?:if\\|elif\\|while\\)\\_>[[:blank:]]+"
       nil 'noerror)
      (and (looking-at
            "^[[:blank:]]*\\(?:\\_<\\(?:if\\|elif\\|while\\)\\_>[[:blank:]]+\\([^:]*.*\\):\\).*$")
           (<= (match-beginning 1) orig)
           (>= (match-end 1) orig))
      )))

(defun py--in-return-line-p () ;[2015/07/15]
  ""
  (save-excursion
    (beginning-of-line)
    (looking-at "^[[:blank:]]*\\_<\\(?:return\\)\\_>")))

;;;###autoload
(defun py:= (n) ;[2015/10/05]
  "N"
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?=))
    (delete-horizontal-space)
    (cond ((py:in-parameter-p)
           (insert (make-string n ?=)))
          ((or (py:in-brackets-p)
               (py--in-condition-p))
           (insert " == "))
          ((or (looking-back "[=<>%+*/&|\!-]\\{2\\}" 1)
               (looking-at "[=<>%+*/&|\!-]\\{2\\}"))
           (insert " ="))
          ((looking-back "[=<>%+*/&|\!-]" 1)
           (insert "= "))
          (t
           (insert " = ")))))

;;;###autoload
(defun py:* (n) ;[2014/02/25]
  "Wrap smart-operator-*.
N"
  ;; TODO: (Atami) [2015/10/06] not completed
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?*))
    (delete-horizontal-space)
    (cond ((py:in-parameter-p)
           (if (looking-back "[(*]" 1)
               (insert "*")
             (insert " *")))
          ((< 0 (nth 0 (syntax-ppss)))
           (if (looking-back "," 1)
               (insert " *")
             (insert "*")))
          ((or (looking-back "[=<>%+*/&|\!-]\\{2\\}" 1)
               (looking-at "[=<>%+*/&|\!-]\\{2\\}"))
           (insert " * "))
          ((looking-back "\*" 1)
           (insert "* "))
          (t (insert " * ")))))

;;;###autoload
(defun py:\, (n) ;[2014/05/14]
  "Wrap smart-operator-,.
N"
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?,))
    (delete-horizontal-space)
    (insert ", ")))

;; TODO: (Atami) [2015/10/06]
;; create macro for define interactive functions
;; similar behave operators.
;;;###autoload
(defun py:- (n) ;[2014/05/14]
  "Wrap smart-operator--.
N"
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?-))
    (delete-horizontal-space)
    (cond ((or (looking-back "[=<>%+*/&|\!-]\\{2\\}" 1)
               (looking-at "[=<>%+*/&|\!-]\\{2\\}"))
           (insert " - "))
          ((looking-back "-" 1)
           (insert "- "))
          (t (insert " - ")))))


;;;###autoload
(defun py:+ (n) ;[2014/05/14]
  "Wrap smart-operator-+.
N"
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?+))
    (delete-horizontal-space)
    (cond ((or (looking-back "[=<>%+*/&|\!-]\\{2\\}" 1)
               (looking-at "[=<>%+*/&|\!-]\\{2\\}"))
           (insert " + "))
          ((looking-back "\+" 1)
           (insert "+ "))
          (t (insert " + ")))))

;;;###autoload
(defun py:/ (n) ;[2014/05/14]
  "Wrap smart-operator-/.
N"
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?/))
    (delete-horizontal-space)
    (cond ((or (looking-back "[=<>%+*/&|\!-]\\{2\\}" 1)
               (looking-at "[=<>%+*/&|\!-]\\{2\\}"))
           (insert " / "))
          ((looking-back "/" 1)
           (insert "/ "))
          (t (insert " / ")))))

;;;###autoload
(defun py:% (n) ;[2014/05/14]
  "Wrap smart-operator-%.
N"
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?%))
    (delete-horizontal-space)
    (cond ((or (looking-back "[=<>%+*/&|\!-]\\{2\\}" 1)
               (looking-at "[=<>%+*/&|\!-]\\{2\\}"))
           (insert " % "))
          ((looking-back "%" 1)
           (insert "% "))
          (t (insert " % ")))))

;;;###autoload
(defun py:> (n) ;[2014/05/14]
  "Wrap smart-operator->.
N"
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?>))
    (delete-horizontal-space)
    (cond ((or (looking-back "[=<>%+*/&|\!-]\\{2\\}" 1)
               (looking-at "[=<>%+*/&|\!-]\\{2\\}"))
           (insert " > "))
          ((looking-back ">" 1)
           (insert "> "))
          (t (insert " > ")))))

;;;###autoload
(defun py:< (n) ;[2014/05/14]
  "Wrap smart-operator-<.
N"
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?<))
    (delete-horizontal-space)
    (cond ((or (looking-back "[=<>%+*/&|\!-]\\{2\\}" 1)
               (looking-at "[=<>%+*/&|\!-]\\{2\\}"))
           (insert " < "))
          ((looking-back "<" 1)
           (insert "< "))
          (t (insert " < ")))))

;;;###autoload
(defun py:& (n) ;[2014/05/14] [2015/07/11]
  "Wrap smart-operator-&.
N"
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?&))
    (delete-horizontal-space)
    (cond ((or (looking-back "[=<>%+*/&|\!-]\\{2\\}" 1)
               (looking-at "[=<>%+*/&|\!-]\\{2\\}"))
           (insert " & "))
          ((looking-back "&" 1)
           (insert "& "))
          (t (insert " & ")))))

;;;###autoload
(defun py:| (n) ;[2014/05/14] [2015/07/11]
  "Wrap smart-operator-|.
N"
  (interactive "p")
  (if (or (py:at-string|comment-p)
          (looking-back "^[[:blank:]]*" 1))
      (insert (make-string n ?|))
    (delete-horizontal-space)
    (cond ((or (looking-back "[=<>%+*/&|\!-]\\{2\\}" 1)
               (looking-at "[=<>%+*/&|\!-]\\{2\\}"))
           (insert " | "))
          ((looking-back "|" 1)
           (insert "| "))
          (t (insert " | ")))))



(provide '__python__operator)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; __python__operator.el ends here
