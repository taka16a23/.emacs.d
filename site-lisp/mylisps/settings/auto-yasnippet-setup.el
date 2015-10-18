;;; auto-yasnippet-setup.el ---   key bind setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/18 12:13:35 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  )

(declare-function 't1-edit-bind-keys "t1-bind-key")

(when (require 'package-setup "package-setup" 'noerr)
  (ignore-errors (package-bundle 'auto-yasnippet)))


(use-package auto-yasnippet
  ;; :disabled
  :defer
  :commands
  (aya-create aya-expand)
  :init
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (t1-edit-bind-keys '(("Y" . aya-create)
                       ("y" . aya-expand)
                       ("C-y" . aya-expand)
                       ))
  :config
  (message "Loading \"auto-yasnippet\"")
  (require 'yasnippet "yasnippet" 'noerr)
  (custom-set-variables
   '(aya-persist-snippets-dir yas-snippet-dirs))
  )



(provide 'auto-yasnippet-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-yasnippet-setup.el ends here
