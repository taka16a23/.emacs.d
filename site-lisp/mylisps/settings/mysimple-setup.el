;;; mysimple-setup.el ---   basic editing commands for Emacs
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:12 2012 (+0900)
;; Last-Updated:2015/10/15 18:19:49 (+0900)
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
;; 2013/10/16    Atami
;;    Added: `indent-and-next'
;;    indent and forward line
;;
;; 2013/03/12    Atami
;;    Fixed: `my-kill-line'
;;    `save-excursion' to `progn'
;;
;; 2013/02/05    Atami
;;    Fixed: `my-forward-seq'
;;    before. did'nt move end of line on comment delimiters.
;;    after. fixed avobe by branch font-lock.
;;
;; 2013/01/24    Atami
;;    Fixed: `my-backward-delete-word', `backward-kill-line'
;;    If active-region then `cua-cut-region'
;;
;; 2012/12/24    Atami
;;    Fixed: `backward-kill-line' functions.
;;    `delete-region' to `kill-region'.
;;
;; 2012/12/24    Atami
;;    Fixed: `my-backward-delete-word' functions.
;;    No insert to clipboard. Only kill-ring.
;;
;; 2012/12/24    Atami
;;    Fixed: `my-kill-line' functions.
;;    If mark-active, do cua-cut-region.
;;
;; 2012/12/12    Atami
;;    Added: Added functions.
;;    `scroll-window-to-top'
;;
;; 2012/12/12    Atami
;;    Added: Added functions.
;;    `move-text-internal', `move-text-down'
;;    `move-text-up'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'cl-macs "cl-macs" 'noerr))

(require 'mysimple "mysimple" 'noerr)

(define-key global-map "\C-\M-j" 'my-backward-whitespace)

;;;; auto indent when yank
;;
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode
                                     lisp-mode lisp-interaction-mode
                                     clojure-mode    scheme-mode
                                     haskell-mode    ruby-mode
                                     rspec-mode      ;python-mode
                                     c-mode          c++-mode
                                     objc-mode       latex-mode
                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))


;;;; clear overlays for interactive
;;
(defun clear-overlays ()
  (interactive)
  (remove-overlays)
  )

(global-set-key (kbd "C-SPC") 't1-mark)

(global-set-key "(" 't1-parence)

;; (defun mark-wrap (n) ;[2013/11/04]
;;   "Wrap marked statements.
;; N: `self-insert-command' number."
;;   (interactive "*p")
;;   (if mark-active
;;       (save-excursion
;;         (let ((start (region-beginning))
;;               (end (region-end))
;;               (char (case last-input-event
;;                       (41 "(")
;;                       (93 "[")
;;                       (125 "{")
;;                       (39  "'")
;;                       (34  "\"")
;;                       (62  "<")
;;                       )))
;;           (princ last-input-event)
;;           (deactivate-mark)
;;           (goto-char end)
;;           (self-insert-command n)
;;           (goto-char start)
;;           (insert char)))
;;     (self-insert-command n)))



(provide 'mysimple-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; mysimple-setup.el ends here
