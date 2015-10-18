;;; help-mode-setup.el ---   snippet
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:29 2012 (+0900)
;; Last-Updated:2015/10/15 23:14:29 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 'help-mode "help-mode" 'noerr)
  (require 'bind-key "bind-key" 'noerr))

(use-package help-mode
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"help-mode\"")
  (bind-keys :map help-mode-map
             ("n" . next-line)
             ("l" . forward-char)
             ("j" . backward-char)
             ("k" . previous-line)
             ("-" . my-forward-seq)
             ("o" . other-window)
             ("p" . cua-scroll-down)
             ("h" . my-backward-seq)
             ("v" . next-line)
             ("f" . forward-char)
             ("d" . previous-line)
             ("s" . backward-char)
             ("g" . my-forward-seq)
             ("e" . cua-scroll-down)
             ;; common
             ("a" . my-backward-seq)
             ("\d" . nil)
             ("c" . nil)
             ("b" . cua-scroll-up))
  )



(provide 'help-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; help-mode-setup.el ends here
