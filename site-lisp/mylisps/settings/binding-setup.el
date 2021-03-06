;;; binding-setup.el ---   key bind setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:06 2012 (+0900)
;; Last-Updated:2015/10/18 03:05:52 (+0900)
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
;; 2015/07/31    Atami
;;    Added: ctrl-: "h" or "C-h" `switch-hotstring'
;;
;; 2015/02/01    Atami
;;    Added: keybind "C-e C-w", "C-e w" to `query-replace' in `ctl-e-map'
;;
;; 2015/02/01    Atami
;;    Removed: remove keybind "C-e C-w", "C-e w" `ispell-complete-word'
;;    in `ctl-e-map'
;;
;; 2015/02/01    Atami
;;    Added: "C-e C-SPC", "C-e SPC" bind `remark' in `ctl-e-map'
;;
;; 2014/03/24    Atami
;;    Added: Prefix C-e map
;;
;; 2013/09/22    Atami
;;    Added: ctrl-: `switch-ipython'
;;
;; 2012/12/12    Atami
;;    Added: Ctrl+tab mapped to Alt+tab
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'bind-key "bind-key" 'noerr)
  )

;; translate key
(keyboard-translate ?\C-x ?\C-d) ;C-x => C-d
(keyboard-translate ?\C-d ?\C-x) ;C-d => C-x

;; Undefine control-digits.
(let ((i ?0))
  (while (<= i ?9)
    (global-unset-key (read (format "[?\\C-%c]" i)))
    (setq i (1+ i))))

;; Ctrl+tab mapped to Alt+tab
(define-key function-key-map [(control tab)] [?\M-\t])

;; Prefix C-x map
(define-key ctl-x-map "\C-n" nil) ;Disable Goal Colum On

;; global map
(global-unset-key (kbd "M-<down-mouse-1>"))
(bind-keys :map global-map
  ;; prefix
  ("C-j" . backward-char)
  ("C-l" . forward-char)
  ("C-M-k" . scroll-down)
  ("C-M-n" . scroll-up)
  ("M-B" . scroll-other-window)
  ;; simple.el
  ("C-k" . previous-line)
  ("M-j" . backward-word)
  ("M-l" . forward-word)
  ("C-M-g" . keyboard-escape-quit)
  ("C-d" . kill-region)
  ("M-g" . goto-line)
  ("C-M-t" . transpose-lines)
  ([C-return] . open-line)
  ("C-m" . default-indent-new-line)
  ;; paragraphs.el
  ("M-k" . backward-sentence)
  ("M-n" . forward-sentence)
  ("M-p" . backward-paragraph)
  ("M-b" . forward-paragraph)
  ;; files.el
  ("C-s" . save-buffer)
  ;; mule-cmds.el
  ([zenkaku-hankaku] . toggle-input-method)
  )



(provide 'binding-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; binding-setup.el ends here
