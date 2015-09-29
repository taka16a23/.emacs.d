;;; iswitchb_plugin_start.el --- Setting for iswitchb
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/01 17:40:04 (+0900)
;; Last-Updated: 2014/01/17 00:43:05 (+0900)
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
;; 2013/11/01    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'anything nil 'noerror)
  (require 't1macro "t1macro" 'noerror)
  (require 'iswitchb "iswitchb" 'noerr))


;;;###autoload
(defun iswitchb-mode-custom-predefine ()
  "For `eval-after-load' iswitchb customize."
  (message "eval-after-load: \"iswitchb\" customizing..")
  (add-hook 'iswitchb-define-mode-map-hook 'iswitchb-mode-map-predefine)
  ;; (remove-hook 'iswitchb-define-mode-map-hook ')
  (custom-set-variables
   '(iswitchb-regexp t)
   '(iswitchb-newbuffer nil)
   '(iswitchb-prompt-newbuffer nil))
  )

;;;###autoload
(defun iswitchb-mode-predefine ()
  "For `eval-after-load' iswitchb function."
  (message "eval-after-load: \"iswitchb\" setting..")
  (add-to-list 'iswitchb-buffer-ignore "\\`\\*")

  ;; OVERRIDE
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

;;;###autoload
(defun iswitchb-mode-map-predefine ()
  "For iswitchb key bindings."
  (interactive)
  ;; (unless (called-interactively-p 'interactive)
  ;; (message "eval-after-load: \"iswitchb\" keymaping.."))
  (define-many-keys iswitchb-mode-map
    ("\C-l"        'iswitchb-next-match)
    ("\C-j"        'iswitchb-prev-match)
    ([(control :)] 'iswitchb-exit-anything))
  (define-key iswitchb-mode-map [(control :)] 'iswitchb-exit-anything))


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

(defun iswitchb-exit-anything ()
  "Execute anything from iswitchb."
  (interactive)
  (if (minibufferp)
      (let ((inhibit-read-only t)
            (iswitchb-newbuffer nil)
            (iswitchb-prompt-newbuffer nil)
            (iswitchb-rescan t))
        (run-with-timer 0.2 nil 'iswitchb-input-anything iswitchb-text)
        (setq iswitchb-text "qqqqqqqqqq") ;dummy string for not match
        (iswitchb-set-matches)
        (exit-minibuffer))
    (anything)))

(defun iswitchb-input-anything (string)
  "Insert target keyword to anything minibuffer after exit iswitchb.
STRING: for insert string in minibuffer"
  (anything :input string))



(provide 'iswitchb_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; iswitchb_plugin_start.el ends here
