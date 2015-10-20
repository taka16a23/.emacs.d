;;; usage-memo-setup.el ---   usage memo
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:57 2012 (+0900)
;; Last-Updated:2015/10/21 00:28:55 (+0900)
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
  (require 'usage-memo "usage-memo" 'noerr)
  (require 'environment-setup "environment-setup" 'noerr)
  (declare-function my-data-dir-join "environment-setup"))

(require 'bind-key "bind-key" 'noerr)
(require 'environment-setup "environment-setup" 'noerr)

(use-package usage-memo
  ;; :disabled
  :defer 30
  :commands umemo-initialize
  :init
  :config
  (message "Loading \"usage-memo\"")
  (setq umemo-base-directory (my-data-dir-join "code/umemo"))
  (bind-keys :map usage-memo-mode-map
             ("C-s" . umemo-save))
  (umemo-initialize)
  (define-usage-memo rope-show-doc "python" 0 "*rope-pydoc*"
    (lambda (arg) (goto-char (point-min))
      (let ((text (buffer-substring (point)
                                    (save-excursion (end-of-line) (point)))))
        (replace-regexp-in-string "\s" "_" text))))
  )



(provide 'usage-memo-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; usage-memo-setup.el ends here
