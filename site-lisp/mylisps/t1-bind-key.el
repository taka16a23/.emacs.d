;;; t1-bind-key.el ---    key bind setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:06 2012 (+0900)
;; Last-Updated:2015/10/18 00:27:28 (+0900)
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
;;
;;; Code:


(eval-when-compile
  (require 'bind-key "bind-key" 'noerr))

(defvar t1-edit-map nil ;(make-keymap)
  "Default keymap for <control>-<e> commands.")

(defvar t1-switch-map nil ;(make-keymap)
  "Default keymap for <control>-<:> commands.")

;; TODO: (Atami) [2015/10/16]
;; imprement to macro
;; (defmacro t1-edit-bind-keys (&rest args)
;;   "For my t1's edit bind keys.
;; ARGS key-bindings like (\"a\" . end-of-line)."
;;   (require 'bind-key "bind-key" 'noerr)
;;   (when (eq t1-edit-map nil)
;;     (define-prefix-command 't1-edit-map)
;;     (bind-key "C-e" 't1-edit-map)
;;     )
;;   (when (eq t1-edit-map nil)
;;     (bind-keys :prefix-map t1-edit-map
;;                :prefix "C-e")
;;     )
;;   (let ((key-bindings args))
;;     (macroexp-progn
;;      (append `()
;;              (apply #'nconc
;;                     (mapcar (lambda (form)
;;                               `((bind-key ,(car form) ',(cdr form) t1-edit-map)))
;;                             key-bindings)))
;;      )))

;;;###autoload
(defun t1-edit-bind-keys (maps)
  "For my edit binding keys.
MAPS like '((\"a\" . end-of-line)).
"
  (when (eq t1-edit-map nil)
    (define-prefix-command 't1-edit-map)
    (bind-key "C-e" 't1-edit-map)
    )
  (mapcar (lambda (form) (bind-key (car form) (cdr form) t1-edit-map)) maps)
  )

;;;###autoload
(defun t1-switch-bind-keys (maps) ;[2015/10/16]
  "ARGS"
  (when (eq t1-switch-map nil)
    (define-prefix-command 't1-switch-map)
    (bind-key "C-:" 't1-switch-map))
  (mapcar (lambda (form) (bind-key (car form) (cdr form) t1-switch-map)) maps)
  )

;;;###autoload
(defun t1-ctl-x-bind-keys (maps) ;[2015/10/17]
  "MAPS"
  (mapcar (lambda (form) (bind-key (car form) (cdr form) ctl-x-map)) maps))

(defun t1-view-bind-keys (maps) ;[2015/10/17]
  "MAPS"
  (when (eq t1-view-map nil)
    (define-prefix-command 't1-view-map)
    )
  )

;;;; for view bind
;;
(defvar common-view-map-table (make-hash-table :test 'equal)
  "My Common view maps.")

(defun bind-from-table (keymap keytable) ;[2015/10/17]
  "KEYMAP
KEYTABLE"
  (maphash (lambda (k f) (bind-key k f keymap)) keytable))

(defun common-view-map-register (key func) ;[2015/10/17]
  "MAPS"
  (puthash key func common-view-map-table))

(defun common-view-map-many-register (maps) ;[2015/10/17]
  "MAPS"
  (dolist (pair maps)
    (common-view-map-register (car pair) (cdr pair))))

(defun common-view-map-unregister (key) ;[2015/10/18]
  "KEY"
  (remhash key common-view-map-table))

(defun common-view-map-bind-keys (keymap) ;[2015/10/17]
  "KEYMAP"
  (bind-from-table keymap common-view-map-table))



(provide 't1-bind-key)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; t1-bind-key.el ends here
