;;; nosetests-setup.el ---
;;
;; Copyright (C) 2014 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2014/12/24 13:04:09 (+0900)
;; Last-Updated:2015/10/20 06:17:03 (+0900)
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
  (require 'python "python" 'noerr))

(use-package nosetests
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"nosetests\"")
  (custom-set-variables
   '(nosetests-verbose-level 3)
   '(nosetests-exe t)
   '(nosetests-rednose t)
   '(nosetests-with-coverage t)
   '(nosetests-failure-detail t)
   '(nosetests-with-id t)
   '(nosetests-ignore-file (list "^\\." "^_" "^setup\\.py$" "^flycheck")))
  (bind-keys :map python-mode-map
             ("C-c n C-n" . nosetests-run-all-cover-package)
             ("C-c n n" . nosetests-run-it-cover-package)
             ("C-c n C-i" . nosetests-run-it)
             ("C-c n C-b" . nosetests-run-buffer)
             ("C-c n b" . nosetests-run-buffer)
             ("C-c n C-d" . nosetests-run-dir)
             ("C-c n d" . nosetests-run-dir)
             ("C-c n C-p C-n" . nosetests-run-pdb-all)
             ("C-c n C-p n" . nosetests-run-pdb-it)
             ("C-c n C-p C-i" . nosetests-run-pdb-it)
             ("C-c n C-p i" . nosetests-run-pdb-it)
             ("C-c n C-p b" . nosetests-run-pdb-buffer)
             ("C-c n C-p C-b" . nosetests-run-pdb-buffer)
             ("C-c n C-p C-d" . nosetests-run-pdb-dir)
             ("C-c n C-p d" . nosetests-run-pdb-dir)
             ;;("C-c n a" . nosetests-all)
             ;;("C-c n o" . nosetests-one)
             ;;("C-c n m" . nosetests-module)
             ("C-c C-n C-n" . nosetests-run-all-cover-package+)
             ("C-c C-n n" . nosetests-run-it-cover-package+)
             ("C-c C-n C-i" . nosetests-run-it)
             ("C-c C-n C-b" . nosetests-run-buffer)
             ("C-c C-n b" . nosetests-run-buffer)
             ("C-c C-n C-d" . nosetests-run-dir)
             ("C-c C-n d" . nosetests-run-dir)
             ("C-c C-n N" . nosetests-run-it)
             ("C-c C-n M-N" . nosetests-run-all+)
             )
  )

;;;###autoload
(defun nosetests-mode-predefine ()
  "For `eval-after-load' nosetests function."
  (message "eval-after-load: \"nosetests\" setting..")
  )

;;;###autoload
(defun nosetests-mode-face-predefine ()
  "For nosetests face."
  (message "eval-after-load: \"nosetests\" Setting faces..")
  )

;;;###autoload
(defun nosetests-run-all+ (args) ;[2014/09/10]
  ""
  (interactive "p")
  (when (and (list-matched-buffers "^\\*gud")
             (y-or-n-p "'*gud' kill buffer?"))
    (kill-some-gud-buffers))
  (nosetests-run-all args))

;;;###autoload
(defun nosetests-run-it-cover-package+ (args) ;[2014/12/23]
  "ARGS"
  (interactive "p")
  (when (and (list-matched-buffers "^\\*gud")
             (y-or-n-p "'*gud' kill buffer?"))
    (kill-some-gud-buffers))
  (nosetests-run-it-cover-package args))

;;;###autoload
(defun nosetests-run-all-cover-package+ (args) ;[2014/12/23]
  "ARGS"
  (interactive "p")
  (when (and (list-matched-buffers "^\\*gud")
             (y-or-n-p "'*gud' kill buffer?"))
    (kill-some-gud-buffers))
  (nosetests-run-all-cover-package args))



(provide 'nosetests-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; nosetests-setup.el ends here
