;;; icomplete_plugin_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/04 15:49:19 (+0900)
;; Last-Updated: 2015/10/04 15:49:51 (+0900)
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
(defun icomplete-mode-custom-predefine ()
  "For `eval-after-load' icomplete customize."
  (message "eval-after-load: \"icomplete\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun icomplete-mode-predefine ()
  "For `eval-after-load' icomplete function."
  (message "eval-after-load: \"icomplete\" setting..")
  )

;;;###autoload
(defun icomplete-mode-map-predefine ()
  "For icomplete key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"icomplete\" keymaping.."))
  (define-many-keys icomplete-minibuffer-map
    ("\C-l" 'icomplete-forward-completions)
    ("\C-j" 'icomplete-backward-completions)
    ))

;;;###autoload
(defun icomplete-mode-face-predefine ()
  "For icomplete face."
  (message "eval-after-load: \"icomplete\" Setting faces..")
  (custom-set-faces
   '(icomplete-first-match ((((class color) (background dark))
                             :whight bold :foreground "cyan"))))
  )



(provide 'icomplete_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; icomplete_plugin_start.el ends here
