;;; duplicate-line-setup.el ---   duplicate line
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:57 2012 (+0900)
;; Last-Updated:2015/10/19 15:18:07 (+0900)
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
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-edit-bind-keys "t1-bind-key"))

(use-package duplicate-line
  ;; :disabled
  ;; :defer
  :commands
  (duplicate-previous-line duplicate-following-line)
  :init
  (t1-edit-bind-keys
   '(("k" . duplicate-previous-line)
     ("C-k" . duplicate-previous-line)
     ("n" . duplicate-following-line)
     ("C-n" . duplicate-following-line)
     ))
  :config
  (message "Loading \"duplicate-line\"")
  (defadvice duplicate-line
      (around inhibit-overwrite-kill-ring activate)
    "No insert to kill-ring."
    (let ((tmp (car kill-ring)))
      ad-do-it
      (setcar kill-ring tmp)
      ))
  ;; (progn (ad-disable-advice 'duplicate-line 'around 'inhibit-overwrite-kill-ring) (ad-update 'duplicate-line)))
  )



(provide 'duplicate-line-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; duplicate-line-setup.el ends here
