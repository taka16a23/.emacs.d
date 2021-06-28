;;; duplicate-line.el --- Easily duplicate a line

;; Copyright (C) 1994  Ray Nickson

;; Author: Ray Nickson <nickson@cs.uq.oz.au>
;; Created: 19940629

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 1, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; Here's a couple of commands I find indispensible;; they might as well
;; see the light of day now, while I'm thinking of them.  I bind them
;; thus:
;;
;; (global-set-key "\M-p" 'duplicate-previous-line)
;; (global-set-key "\M-n" 'duplicate-following-line)
;;
;; and they behave in ordinary text buffers something like the same keys
;; do in buffers with history, duplicating lines from nearby in the
;; buffer.
;;
;; I included my `point-at' macro rather than expanding it out by hand.
;;
;; Copyright notice included even though I doubt it's needed on something
;; so small.

;;; Code:


(defun duplicate-line (n dir)
  "Copy the Nth following line to point.
If the last command was a duplication, replace the current line by the next
line in direction DIR."
  (if (eq (car-safe last-command) 'duplicate-line)
      (progn
        (delete-region (progn (beginning-of-line nil) (point))
                       (progin (end-of-line nil) (point)))
        (setq n (+ dir (cdr last-command))))
    (kill-region (progn (beginning-of-line nil) (point))
                 (progn (end-of-line nil) (point))))
  (if (= n 0)
      (insert (current-kill 0))
    (insert (save-excursion
              (beginning-of-line (1+ n))
              (buffer-substring (point)
                                (progn (end-of-line nil) (point)))))
    (setq this-command (cons 'duplicate-line n))))

(defun duplicate-previous-line (n)
  "Copy the Nth previous line to point.
If repeated, replace by the line preceding the one that was copied last time.
This command can be interleaved with \\[duplicate-following-line]."
  (interactive "p")
  (duplicate-line (- n) -1))

(defun duplicate-following-line (n)
  "Copy the Nth following line to point.
If repeated, replace by the line following the one that was copied last time.
This command can be interleaved with \\[duplicate-previous-line]."
  (interactive "p")
  (duplicate-line n 1))

(provide 'duplicate-line)
;;; duplicate-line.el ends here.
