;;; 30_undo_tree_plugin_start.el --- undo tree view
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:12 2012 (+0900)
;; Last-Updated: 2013/11/01 23:00:46 (+0900)
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
  (require 't1macro nil 'noerr))

(require 'undo-tree "undo-tree" 'noerr)
(global-undo-tree-mode 1)
(define-many-keys global-map
  ("\C-\M-z"   'undo-tree-visualize)
  ("\M-z"      'redo)
  ("\M-/"      'undo-tree-redo)
  ([201326639] 'undo-tree-visualize) ;"C-M-/"
  )

(setq undo-tree-auto-save-history nil)
(setcar (cdr (assq 'undo-tree-mode minor-mode-alist)) "") ;Minor mode name nil


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 30_undo_tree_plugin_start.el ends here
