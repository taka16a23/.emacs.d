;;; eldoc_plugin_start.el --- setting for eldoc
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 00:55:39 (+0900)
;; Last-Updated: 2013/11/02 00:57:04 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defun eldoc-mode-custom-predefine ()
  "For `eval-after-load' eldoc customize."
  (message "eval-after-load: \"eldoc\" customizing..")
  (custom-set-variables
   '(eldoc-idle-delay 0.7)
   '(eldoc-echo-area-use-multiline-p t))
  )

;;;###autoload
(defun eldoc-mode-predefine ()
  "For `eval-after-load' eldoc function."
  (message "eval-after-load: \"eldoc\" setting..")
  )

;;;###autoload
(defun eldoc-mode-map-predefine ()
  "For eldoc key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"eldoc\" keymaping.."))
  )

;;;###autoload
(defun eldoc-mode-face-predefine ()
  "For eldoc face."
  (message "eval-after-load: \"eldoc\" Setting faces..")
  (custom-set-faces
   '(eldoc-highlight-function-argument ((t (:foreground "yellow" :weight bold)))))
  )



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; eldoc_plugin_start.el ends here
