;;; auto-yasnippet-extension.el --- for auto yasnippet extension
;;
;; Copyright (C) 2014 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2014/03/24 05:17:04 (+0900)
;; Last-Updated: 2014/05/07 09:40:50 (+0900)
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
;; 2014/03/24    Atami
;;    Added: `auto-yasnippet-ext'
;;
;; 2014/03/24    Atami
;;    Created this header.
;;
;;
;;; Code:



;;;###autoload
(defun auto-yasnippet-ext (start end)
  "Compact command with `create-auto-yasnippet', `expand-auto-yasnippet'.
Do `create-auto-yasnippet' if mark is active.
Else do `expand-auto-yasnippet'.
ARGS: prefix"
  (interactive "r")
  (let ((yas/indent-line 'fixed)
        (yas/wrap-around-region 'fixed))
    (if mark-active
        (progn
          (save-restriction
            (narrow-to-region start end)
            (create-auto-yasnippet)
            (delete-region (point-min) (point-max)))
          (expand-auto-yasnippet)
          )
      (expand-auto-yasnippet))))



(provide 'auto-yasnippet-extension)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-yasnippet-extension.el ends here
