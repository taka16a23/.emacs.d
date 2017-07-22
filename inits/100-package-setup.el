;;; package-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/04 17:15:26 (+0900)
;; Last-Updated:2015/10/19 14:14:29 (+0900)
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
  (require 'package "package" 'noerr)
  (require 'use-package "use-package" 'noerr))

(use-package package
  ;; :disabled
  ;; :defer
  :commands
  (package-installed-p package-refresh-contents package-install)
  :init
  :config
  (message "Loading \"package\"")
  )

(defadvice package--ensure-init-file
    (around inhibit-read-only-package--ensure-init-file activate)
  (let ((inhibit-read-only t))
    ad-do-it
    ))

(defun package-bundle (name) ;[2015/10/14]
  "NAME"
  (unless (package-installed-p name)
    (package-refresh-contents)
    (package-install name)))

(defadvice package-install
    (around inhibit-read-only-package-install activate)
  (let ((inhibit-read-only t))
    ad-do-it
    ))
;; (progn (ad-disable-advice 'package-install 'around 'inhibit-read-only-package-install) (ad-update 'package-install))

(defadvice package-delete
    (around inhibit-read-only-package-delete activate)
  (let ((inhibit-read-only t))
    ad-do-it
    ))
;; (progn (ad-disable-advice 'package-delete 'around 'inhibit-read-only-package-delete) (ad-update 'package-delete))



(provide 'package-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; package-setup.el ends here
