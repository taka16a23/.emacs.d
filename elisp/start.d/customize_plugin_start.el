;;; customize_plugin_start.el --- functions for customize
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Thu Dec 13 22:03:09 2012 (+0900)
;; Last-Updated: Fri Dec 14 20:26:58 2012 (+0900)
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
;; 2012/12/13    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defun cus-edit-predefine ()
  "For `eval-after-load' cus-edit function."
  (message "Loading cus-edit..")
  (setq-default custom-file (concat my-var-dir "custom_temp.el"))
  (cus-edit-face-predefine))

;;;###autoload
(defun cus-edit-face-predefine ()
  "For cus-edit key bindings."
  (interactive)
  (face-spec-set 'custom-button-face          '((t (nil))))
  (face-spec-set 'custom-changed-face         '((t (:background "blue" :foreground "white"))))
  (face-spec-set 'custom-documentation-face   '((t (nil))))
  (face-spec-set 'custom-face-tag-face        '((t (:underline t))))
  (face-spec-set 'custom-group-tag-face       '((t (:underline t :foreground "light blue"))))
  (face-spec-set 'custom-group-tag-face-1     '((t (:underline t :foreground "pink"))))
  (face-spec-set 'custom-invalid-face         '((t (:background "red" :foreground "yellow"))))
  (face-spec-set 'custom-modified-face        '((t (:background "blue" :foreground "white"))))
  (face-spec-set 'custom-rogue-face           '((t (:background "black" :foreground "pink"))))
  (face-spec-set 'custom-saved-face           '((t (:underline t))))
  (face-spec-set 'custom-set-face             '((t (:background "white" :foreground "blue"))))
  (face-spec-set 'custom-state-face           '((t (:foreground "lime green"))))
  (face-spec-set 'custom-variable-button-face '((t (:underline t :bold t))))
  (face-spec-set 'custom-variable-tag-face    '((t (:underline t :foreground "light blue"))))
  )


(provide 'customize_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; customize_plugin_start.el ends here
