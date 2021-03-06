;;; iswitchb-setup.el ---   Setting for iswitchb
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/02/14 08:04:49 (+0900)
;; Last-Updated:2015/10/19 15:03:22 (+0900)
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
;; 2013/10/28    Atami
;;    splited file: `iswitchb-mode-predefine',
;;    `iswitchb-define-mode-map-predefine', `iswitchb-exhibit',
;;    `iswitchb-exit-anything', `iswitchb-input-anything',
;;    to iswitchb-plugin_start.el
;;
;; 2013/10/17    Atami
;;    Added: `iswitchb-input-anything' input string from iswitchb.
;;    fixed: `iswitchb-exit-anything' for above.
;;
;; 2013/10/16    Atami
;;    fixed: `iswitchb-exit-anything'
;;    freezed buged when execute by null string.
;;
;; 2013/10/16    Atami
;;    advised: `iswitchb-exhibit' for hide beginning of "*" buffer
;;
;; 2013/10/16    Atami
;;    advised: `iswitchb-set-matches' for filitering by space.
;;
;; 2013/02/14    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'iswitchb "iswitchb" 'noerr)
  (require 'binding_setup "binding_setup" 'noerr)
  (require 'use-package "use-package" 'noerr)
  (require 'bind-key "bind-key" 'noerr)
  (declare-function iswitchb-set-matches "iswitchb")
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (require 'switch-buffer "switch-buffer" 'noerr)
  (declare-function t1-switch-bind-keys "switch-buffer")
  (require 'helm "helm" 'noerr)
  (declare-function helm "helm")
  )

;; TODO: (Atami) [2015/10/14]
;; iswitchb-exit
(defun iswitchb-mode-map-predefine () ;[2015/10/12]
  ""
  (interactive)
  (bind-keys :map iswitchb-mode-map
             ("C-l" . iswitchb-next-match)
             ("C-j" . iswitchb-prev-match)
             ([(control :)] . iswitchb-exit-helm)
             )
  )

(use-package iswitchb
  ;; :disabled
  ;; :defer 1
  :commands
  (iswitchb-mode iswitchb-buffer)
  :init
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (t1-switch-bind-keys '(("C-:" . iswitchb-buffer)))
  ;; (define-key ctl-colon-map (kbd "C-:") 'iswitchb-buffer)
  :config
  (message "Loading \"iswitchb\"")
  (add-hook 'iswitchb-define-mode-map-hook 'iswitchb-mode-map-predefine)
  (custom-set-variables
   '(iswitchb-regexp t)
   '(iswitchb-newbuffer nil)
   '(iswitchb-prompt-newbuffer nil))
  (iswitchb-mode 1)
  (defadvice iswitchb-set-matches
      (around space-filter-iswitch-set-match activate)
    (if iswitchb-rescan
        (setq iswitchb-matches
              (let ((buflist iswitchb-buflist))
                (dolist (text (split-string iswitchb-text))
                  (setq buflist
                        (iswitchb-get-matched-buffers text iswitchb-regexp
                                                      buflist)))
                buflist)
              iswitchb-virtual-buffers nil)))
  ;; (progn (ad-disable-advice 'iswitchb-set-matches 'around 'space-filter-iswitch-set-match) (ad-update 'iswitch-set-match))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; test
;;;; iswitchb exit to anything
;;
(defvar iswitchb-buffer-ignore-asterisk-orig nil)
(defadvice iswitchb-exhibit (before iswitchb-exhibit-asterisk activate)
  "*が入力されている時は*で始まるものだけを出す."
  ;; http://d.hatena.ne.jp/holidays-l/20120217/p1#days
  (if (equal (char-after (minibuffer-prompt-end)) ?*)
      (when (not iswitchb-buffer-ignore-asterisk-orig)
        (setq iswitchb-buffer-ignore-asterisk-orig iswitchb-buffer-ignore)
        (setq iswitchb-buffer-ignore '("^ "))
        (iswitchb-make-buflist iswitchb-default)
        (setq iswitchb-rescan t))
    (when iswitchb-buffer-ignore-asterisk-orig
      (setq iswitchb-buffer-ignore iswitchb-buffer-ignore-asterisk-orig)
      (setq iswitchb-buffer-ignore-asterisk-orig nil)
      (iswitchb-make-buflist iswitchb-default)
      (setq iswitchb-rescan t))))

(defun iswitchb-exit-helm ()
  "Execute anything from iswitchb."
  (interactive)
  (if (minibufferp)
      (let ((inhibit-read-only t)
            (iswitchb-newbuffer nil)
            (iswitchb-prompt-newbuffer nil)
            (iswitchb-rescan t))
        (run-with-timer 0.2 nil 'iswitchb-input-helm iswitchb-text)
        (setq iswitchb-text "qqqqqqqqqq") ;dummy string for not match
        (iswitchb-set-matches)
        (exit-minibuffer))
    (call-interactively 'helm-mini)))

(defun iswitchb-input-helm (string)
  "Insert target keyword to anything minibuffer after exit iswitchb.
STRING: for insert string in minibuffer"
  (helm :input string))



(provide 'iswitchb-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; iswitchb-setup.el ends here
