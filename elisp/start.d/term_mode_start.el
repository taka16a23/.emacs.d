;;; term_mode_start.el --- functions for term mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 18:37:41 2012 (+0900)
;; Last-Updated: 2015/09/11 22:51:35 (+0900)
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
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'multi-term "multi-term" 'noerr))

;;;###autoload
(defvar launch-term (cond ((windows-p) 'shell)
						  (t 'multi-term)))

;;;###autoload
(defun term-mode-custom-predefine ()
  "For `eval-after-load' term customize."
  (message "eval-after-load: \"term\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun term-mode-predefine ()
  "For `eval-after-load' term function."
  (message "eval-after-load: \"term\" setting..")
  (add-hook 'term-mode-hook 'term-mode-map-predefine)
  )

;;;###autoload
(defun term-mode-map-predefine ()
  "For term key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"term\" keymaping.."))
  (define-many-keys term-raw-map
    ("\C-h"        'term-send-raw)
    ("\C-n"        'term-send-raw)
    ("\M-j"        'term-send-raw)
    ("\M-l"        'term-send-raw)
    ("\M-k"        'term-send-raw)
    ("\M-n"        'term-send-raw)
    ("\C-r"        'term-send-raw)
    ("\C-y"        'term-send-raw)
    ("\C-s"        'term-send-raw)
    ("\C-z"        'term-send-raw)
    ("\C-a"        'term-send-raw)
    ("\C-o"        'term-send-raw)
    ("\C-b"        'term-send-raw)
    (""          'term-send-raw) ;(kbd "C-_")
    ("\M-x"        'term-send-raw)
    ("\C-e"        'term-send-raw)
    ([67108909]    'term-send-raw) ;(kbd "C--")
    ([67108923]    'term-send-raw) ;(kbd "C-;")
    ;; other
    ("\C-c\C-p"    'clipboard-kill-ring-save)
    ("\C-c\C-v"    'term-paste)
    ([(control -)] 'term-send-raw)
    ("\C-c\C-q"    'term-send-raw-meta)
    ("\C-t"        'set-mark-command)
    ("\C-c\C-a"    'sdic-describe-word-at-point)
    ("\C-c\M-a"    'dabbrev-expand)
    ("\M-N"        'windmove-down)
    ;; ("\C-r"    'term-send-input)
    ("\M-j"    'term-send-backward-word)
    ("\M-l"    'term-send-forward-word)
    ([C-return]    'term-spawn)
    ([M-backspace] 'term-send-raw-meta)
	))

;;;###autoload
(defun term-mode-face-predefine ()
  "For term face."
  (message "eval-after-load: \"term\" Setting faces..")
  (face-spec-set 'term '((t (:foreground "white" :background "black"))))
  )


(defun term-spawn ()
  (interactive)
  (term-send-raw-string "&")
  (term-send-raw-string "")
  )



(provide 'term_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; term_mode_start.el ends here
