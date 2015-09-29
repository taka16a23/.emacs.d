;;; nosetests_plugin_start.el ---
;;
;; Copyright (C) 2014 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2014/12/24 13:05:17 (+0900)
;; Last-Updated: 2014/12/24 13:10:02 (+0900)
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


;;;###autoload
(defun nosetests-mode-custom-predefine ()
  "For `eval-after-load' nosetests customize."
  (message "eval-after-load: \"nosetests\" customizing..")
  (custom-set-variables
   '(nosetests-verbose-level 3)
   '(nosetests-exe t)
   '(nosetests-rednose t)
   '(nosetests-with-coverage t)
   '(nosetests-failure-detail t)
   '(nosetests-with-id t)
   '(nosetests-ignore-file (list "^\\." "^_" "^setup\\.py$" "^flycheck"))))


;;;###autoload
(defun nosetests-mode-predefine ()
  "For `eval-after-load' nosetests function."
  (message "eval-after-load: \"nosetests\" setting..")
  )

;;;###autoload
(defun nosetests-mode-map-predefine ()
  "For nosetests key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"nosetests\" keymaping.."))

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



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; nosetests_plugin_start.el ends here
