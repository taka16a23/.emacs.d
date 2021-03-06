;;; t1-simple.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/11 11:59:30 (+0900)
;; Last-Updated:2015/10/23 14:40:39 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(eval-when-compile
  (require 'newcomment)
  (require 'cua-base))

;;;; back forward sequential ;[2012/09/20] ;[2012/10/19]
;;
(defvar seq-start-point nil "Return point for back or forward seq move.")

;;;###autoload
(defun my-backward-seq (&optional args)
  "Sequential Backward Move. \
Beginning of LINE, WINDOW, BUFFER. And return START-POINT.
Args:  4 = start point
       8 = beginning of line
      12 = beginning of window
      16 = beginning of buffer"
  (interactive "p")
  (if (not (eq last-command this-command))
      (setq seq-start-point (point)))
  (cond ((or (eq args 4)
			 (eq (buffer-end -1) (point))) (goto-char seq-start-point))
		((eq (window-start) (point)) (goto-char (point-min)))
		((looking-at "^") (if (or (eq last-command this-command)
								  (= 0.0 (car temporary-goal-column)))
							  (move-to-window-line 0)
							(setq temporary-goal-column '(0.0 . 0))))
		(t (beginning-of-line-or-indentation))))

;;;###autoload
(defun my-forward-seq (&optional args)
  "Sequential Forward Move. \
End of LINE, WINDOW, BUFFER. And return START-POINT.
Args:  4 = start point
       8 = end of line
      12 = end of window
      16 = end of buffer"
  (interactive "p")
  ;; keep point if called first time
  (if (not (eq last-command this-command))
      (setq seq-start-point (point)))
  (if (looking-at "$")
      (cond
	   ;; back to first point
	   ((or (eq args 4)
			(eq (buffer-end 1) (point))) (goto-char seq-start-point))
	   ;; go to end of buffer
	   ((eq (point)
			(save-excursion
			  (let ((auto-window-vscroll nil))
				(move-to-window-line -1) (end-of-line) (point)))) (goto-char (point-max)))
	   ;; go to end of window
	   (t (let ((auto-window-vscroll nil)) (move-to-window-line -1) (end-of-line))))
    (if (member (what-face-at-point) '(font-lock-comment-face font-lock-comment-delimiter-face))
        (end-of-line)
      (seq-esc-comment-end-of-line))))

(autoload 'comment-search-forward "newcomment" nil t)

;;;###autoload
(defun esc-comment-end-of-line ()
  "Skip backward comment when end-of-line"
  (interactive)
  (when (comment-search-forward (line-end-position) t)
    (goto-char (match-beginning 0))
    (skip-syntax-backward " " (line-beginning-position))))

;;;###autoload
(defun seq-esc-comment-end-of-line ()
  ""
  (interactive)
  (let ((beforepoint (point))
		(afterpoint (progn (esc-comment-end-of-line) (point))))
	(when (or (eq beforepoint afterpoint)
			  (>  beforepoint afterpoint))
	  (end-of-line))))

;;;;
(fset 'kill-left-current-line
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item (quote (" " 0 "%d")) arg)))

;;;; Swich 2 Buffer
;;
;;;###autoload
(defun swap-screen()
  "Swap two screen,leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))

;;;###autoload
(defun swap-screen-with-cursor()
  "Swap two screen,with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))

;;;; [2012/10/14]
;;
;;;###autoload
(defun scroll-window-to-top (point)
  "Scroll window up to top.
POINT: "
  (interactive
   (list (save-excursion
           (beginning-of-line) (point))))
  (set-window-start (selected-window) point))

;;;; Zoom in or out
;;
;;;###autoload
(defun text-scale-decrease ()
  "Zoom out."
  (interactive)
  (text-scale-increase -1))

;;;###autoload
(defun text-scale-enlarge ()
  "Zoom up."
  (interactive)
  (text-scale-increase 1))

;;;###autoload
(defun text-scale-default ()
  "Reset zoom in or out."
  (interactive)
  (text-scale-increase 0))

;; EDIT
;; ============================================================================
;;;###autoload
(defun return-on-line()
  (interactive)
  (end-of-line)
  (reindent-then-newline-and-indent))

;;;; Kill the character from cursor to begginning of line ;[2012/09/19]
;;
;;;###autoload
(defun beginning-of-line-or-indentation ()
  (interactive)
  (let ((orig-point (point)))
    (back-to-indentation)
    (if (>= (point) orig-point) (beginning-of-line))))

;;;###autoload
(defun backward-kill-line (arg)
  "Delete characters beginning of line from point.
ARG:
If pointer set beginning of line then join line.
If set prefix <C-u> then delete string to yank."
  (interactive "*P")
  (cond ((region-active-p) (cua-cut-region arg))
        ((looking-at "^") (join-line)) ;join-line alias delete-indentation
        (arg (kill-line 0))
        (t (kill-region (point) (progn (beginning-of-line-or-indentation) (point))))
        ))

;;;; Kill the character backward encountering the beginning of a word.
;;
;;;###autoload
(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
ARG:
With argument, do this that many times."
  (interactive "*p")
  (delete-region (point) (progn (forward-word arg) (point))))

;;;###autoload
(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
ARG:
With argument, do this that many times."
  (interactive "*p")
  (delete-word (- arg)))

;; ファイル末尾の改行を削除
;; http://www.emacswiki.org/emacs/DeletingWhitespace
;;;###autoload
(defun delete-trailing-blank-lines ()
  "Deletes all blank lines at the end of the file."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))

;;;###autoload
(defun my-backward-delete-word (arg)
  "Delete backward word.
ARG:"
  (interactive "P*")
  (cond  ((region-active-p) (cua-cut-region arg))
         ((looking-at "^") (join-line))
         ((looking-back "^[ \t]*") (delete-region (point) (match-beginning 0)))
         (t
          (let ((x-select-enable-clipboard nil))
            (unless arg (setq arg (cons 1 nil)))
            (kill-region (point) (progn (forward-word (- (car arg))) (point)))))))

;; kill line ;[2012/10/27] ;[2012/11/01]
;;;###autoload
(defun t1-kill-line (arg)
  "If line is blank, delete all surrounding blank lines, leaving just one.
ARG:
On isolated blank line, delete that one.
On nonblank line, kill whole line."
  (interactive "P*")
  (cond (mark-active
         (cua-cut-region arg))
        ((progn (beginning-of-line) (looking-at "[ \t]*$"))
         (delete-blank-lines))
        (t
         (kill-whole-line))))

;;;; Copy whole line
;;
;;;###autoload
(defun copy-whole-line (&optional arg)
  "Copy current line.
ARG:"
  (interactive "p")
  (or arg (setq arg 1))
  (if (and (> arg 0) (eobp) (save-excursion (forward-visible-line 0) (eobp)))
      (signal 'end-of-buffer nil))
  (if (and (< arg 0) (bobp) (save-excursion (end-of-visible-line) (bobp)))
      (signal 'beginning-of-buffer nil))
  (unless (eq last-command 'copy-region-as-kill)
    (kill-new "")
    (setq last-command 'copy-region-as-kill))
  (cond ((zerop arg)
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))))
        ((< arg 0)
         (save-excursion
           (copy-region-as-kill (point) (progn (end-of-visible-line) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line (1+ arg))
                                       (unless (bobp) (backward-char))
                                       (point)))))
        (t
         (save-excursion
           (copy-region-as-kill (point) (progn (forward-visible-line 0) (point)))
           (copy-region-as-kill (point)
                                (progn (forward-visible-line arg) (point))))))
  (message (substring (car kill-ring-yank-pointer) 0 -1)))

;; copied from http://stackoverflow.com/questions/2423834/move-line-region-up-and-down-in-emacs
;;;###autoload
(defun move-text-internal (arg)
  "Move text internal function.
ARG:"
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

;;;###autoload
(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line.
ARG lines down."
  (interactive "*p")
  (move-text-internal arg))

;;;###autoload
(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line.
ARG lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(defadvice move-text-up
    (after move-text-up-previous-line activate)
  (let ((column (current-column)))
    (forward-line (- arg))
    (line-move-to-column column))
  )
;; (progn (ad-disable-advice 'move-text-up 'after 'move-text-up-previous-line) (ad-update 'move-text-up)))

;;;; check blank line
;;
;;;###autoload
(defun blank-line-p ()
  "Return non-nil if and only if current line is blank."
  (save-excursion
    (beginning-of-line)
    (looking-at "\\s-*$")))

;;;; my-move-whitespace ;[2012/11/01]
;;
;; edit: bindings_init.el
;;;###autoload
(defun my-forward-whitespace (arg)
  (interactive "p")
  (when (natnump arg)
    (skip-chars-forward " \t\n")
    (if (re-search-forward "[ \t]+\\|\n" nil 'move arg)
        (skip-chars-backward " \t\n"))))

;;;###autoload
(defun my-backward-whitespace (arg)
  (interactive "p")
  (when (natnump arg)
    (skip-chars-backward " \t\n")
    (if (re-search-backward "[ \t]+\\|\n" nil 'move arg)
        (skip-chars-forward " \t\n"))))

;;;###autoload
(defun backward-whitespace (arg)
  "Move back to whitespace."
  (interactive "p")
  (if (natnump arg)
      (re-search-backward "[ \t]+\\|\n" nil 'move)))

;;;; just one blank line
;;
;;;###autoload
(defun just-one-blank-line ()
  "On blank line, delete all surrounding blank lines, leaving just one."
  (interactive "*")
  (let (thisblank singleblank)
    (save-excursion
      (beginning-of-line)
      (setq thisblank (looking-at "[ \t]*$"))
      ;; Set singleblank if there is just one blank line here.
      (setq singleblank
            (and thisblank
                 (not (looking-at "[ \t]*\n[ \t]*$"))
                 (or (bobp)
                     (progn (forward-line -1)
                            (not (looking-at "[ \t]*$")))))))
    ;; Delete preceding blank lines, and this one too if it's the only one.
    (if (and thisblank (not singleblank))
        (progn
          (beginning-of-line)
          (if singleblank (forward-line 1))
          (delete-region (point)
                         (if (re-search-backward "[^ \t\n]" nil t)
                             (progn (forward-line 1) (point))
                           (point-min)))))
    ;; there are no following blank lines.
    (if (and thisblank (not singleblank))
        (save-excursion
          (end-of-line)
          (forward-line 1)
          (delete-region (point)
                         (if (re-search-forward "[^ \t\n]" nil t)
                             (progn (beginning-of-line) (point))
                           (point-max)))))
    ;; Handle the special case where point is followed by newline and eob.
    ;; Delete the line, leaving point at eob.
    (if (looking-at "^[ \t]*\n\\'")
        (delete-region (point) (point-max)))))

;;;###autoload
(defun indent-and-next (args)
  "Indent and forward line.
ARGS: dotimes number."
  (interactive "p")
  (dotimes (i args)
    (indent-for-tab-command)
    (forward-line 1)))

;;;###autoload
(defun t1-parence ()
  ""
  (interactive)
  (cond
   ;; ((and (looking-at ")")
   ;; (eq last-command this-command))
   ;; (delete-char 1))
   ((and (eq last-command this-command)
         (looking-back "(" 1))
    (insert "())")
    (backward-char 2)
    )
   (t (insert "()")
      (backward-char))))

(defun dolist-member (targets members)
  ""
  (let ((targets (if (listp targets) targets (list targets)))
        (members (if (listp members) members (list members)))
        (result t))
    (dolist (tg targets)
      (unless (member tg members)
        (setq result nil)))
    result))

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

;;;###autoload
(defun forward-skip-string-regexp ()
  ""
  (interactive)
  (skip-fontlocks '(font-lock-string-face
                    font-lock-regexp-grouping-backslash
                    font-lock-regexp-grouping-construct) 1)
  )

;;;###autoload
(defun backward-skip-string-regexp ()
  ""
  (interactive)
  (skip-fontlocks '(font-lock-string-face
                    font-lock-regexp-grouping-backslash
                    font-lock-regexp-grouping-construct) -1)
  )

;;;###autoload
(defun t1-forward-thing (arg)
  "ARG"
  (interactive "p")
  (cond ((eq (what-face-at-point) (or 'font-lock-string-face
                                      'font-lock-regexp-grouping-backslash
                                      'font-lock-regexp-grouping-construct))
         (forward-skip-string-regexp))
        (t (forward-list arg))))

;;;###autoload
(defun t1-backward-thing (arg)
  "ARG"
  (interactive "p")
  (cond ((eq (what-face-at-point) (or 'font-lock-string-face
                                      'font-lock-regexp-grouping-backslash
                                      'font-lock-regexp-grouping-construct))
         (backward-skip-string-regexp))
        (t (backward-list arg))))

;;;###autoload
(defun clear-overlays ()
  (interactive)
  (remove-overlays)
  )

;;;###autoload
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



(provide 't1-simple)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; t1-simple.el ends here
