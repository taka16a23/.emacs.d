;;; undo-tree-setup.el ---   undo tree view
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:12 2012 (+0900)
;; Last-Updated:2015/10/19 12:56:41 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  )

(use-package undo-tree
  ;; :disabled
  ;; :defer
  :init
  :config
  (message "Loading \"undo-tree\"")
  (custom-set-variables
   '(undo-tree-auto-save-history nil))
  (global-undo-tree-mode 1)
  :bind
  (("C-M-z" . undo-tree-visualize)
   ("M-z" . undo-tree-redo)
   ("M-/" . undo-tree-redo)
   ([201326639] . undo-tree-visualize)
   )
  :diminish undo-tree-mode ;hide from modeline
  )



(provide 'undo-tree-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; undo-tree-setup.el ends here
