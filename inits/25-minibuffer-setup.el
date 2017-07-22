;;; minibuffer-setup.el ---   key bind setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/19 23:49:20 (+0900)
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


(eval-when-compile
  (require 'bind-key "bind-key" 'noerr)
  (require 'use-package "use-package" 'noerr))

(require 'bind-key "bind-key" 'noerr)

(use-package minibuffer
  ;; :disabled
  ;; :defer
  :init
  :config
  (message "Loading \"minibuffer\"")
  (bind-keys :map minibuffer-local-map
             ("C-n" . next-history-element)
             ("C-k" . previous-history-element)
             ("M-n" . next-matching-history-element)
             ("M-k" . previous-matching-history-element)
             ("C-j" . backward-char)
             ("C-l" . forward-char))
  (bind-keys :map minibuffer-local-must-match-map
             ("C-j" . backward-char)
             ("C-a" . backward-kill-word))
  )



(provide 'minibuffer-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; minibuffer-setup.el ends here
