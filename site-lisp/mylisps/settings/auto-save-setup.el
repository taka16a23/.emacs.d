;;; auto-save-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/11 07:48:28 (+0900)
;; Last-Updated:2015/10/28 06:58:55 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(require 'environment-setup "environment-setup" 'noerr)

(defvar my-auto-save-dir (concat (my-bk-autosave-dir-get) "/"))

(custom-set-variables
 '(auto-save-timeout 10)
 '(auto-save-interval 300)
 '(auto-save-list-file-prefix (my-var-dir-join "auto-save-list/save-"))
 '(auto-save-file-name-transforms `((".*" ,my-auto-save-dir t))))

(declare-function msdos-long-file-names "msdos.c")
(declare-function dos-8+3-filename "dos-fns" (filename))

(defadvice kill-emacs (around inhibit-delete-autosave-file activate)
  "Inhibit delete auto save files."
  (let ((delete-auto-save-files nil))
    ad-do-it
    ))



(provide 'auto-save-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-save-setup.el ends here
