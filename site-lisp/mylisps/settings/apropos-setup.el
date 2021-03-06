;;; apropos-setup.el ---   setting for apropos
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 16:01:54 (+0900)
;; Last-Updated:2015/10/18 00:35:14 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package apropos
  ;; :disabled
  :defer
  :commands
  (apropos)
  :init
  :config
  (message "Loading \"apropos\"")
  ;; (default-view-bind-set apropos-mode-map)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (common-view-map-bind-keys apropos-mode-map)
  ;;;; apropos color
  ;; http://d.hatena.ne.jp/sonota88/20101216/1292453078
  ;; hi-apro.el
  ;; author: sonota
  ;; license: GPL
  (defvar hi-apro:type2face-alist
    ;;(setq hi-apro:type2face-alist
    '(("Command"  . font-lock-keyword-face)
      ("Face"     . font-lock-string-face)
      ("Function" . font-lock-function-name-face)
      ("Group"    . font-lock-constant-face)
      ("Macro"    . font-lock-warning-face)
      ("Plist"    . font-lock-type-face)
      ("Variable" . font-lock-variable-name-face)
      ("Widget"   . font-lock-builtin-face)
      ))

  (defvar hi-apro:default-header-face
    'font-lock-comment-face)

  (defun hi-apro:heading-line-p ()
    ;;(interactive)
    (eq 'bold (face-at-point)))

  (defun hi-apro:type-of-item ()
    (save-excursion
      (goto-char (+ 2 (point)))          ; forward-char だと動かない
      (if (thing-at-point 'word)
          (substring-no-properties (thing-at-point 'word))
        nil)))

  (defun hi-apro:type2face (type)
    (or (assoc-default type hi-apro:type2face-alist)
        hi-apro:default-header-face))

  (defun hi-apro:sub ()
    (let ((item-type nil)
          (face nil))
      (goto-char (point-max))
      (while (> (point) (point-min))
        (unless (hi-apro:heading-line-p)
          (setq item-type (hi-apro:type-of-item)))
        (when (hi-apro:heading-line-p)
          (setq face (hi-apro:type2face item-type))
          (let ((beg (point)))
            (end-of-line)
            (put-text-property beg (point) 'face face)))
        ;;(message "%d" (point)) (sit-for 0.5)
        (forward-line -1)
        )))

  (defun hi-apro ()
    ;;(interactive)
    (setq buffer-read-only nil)
    (save-excursion (hi-apro:sub))
    (setq buffer-read-only t))

  (defadvice apropos
      (after hi-apro:advice activate)
    (hi-apro))
  (ad-activate 'apropos)
  )



(provide 'apropos-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; apropos-setup.el ends here
