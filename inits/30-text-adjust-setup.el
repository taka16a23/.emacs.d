;;; text-adjust-setup.el ---   Setting for text adjust
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:25 2012 (+0900)
;; Last-Updated:2015/10/19 15:46:52 (+0900)
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
  (require 'use-package "use-package" 'noerr))

;;;###autoload
(defun text-adjust-space-before-save-if-needed ()
  (when (memq major-mode
              '(org-mode text-mode mew-draft-mode))
    (text-adjust-space-buffer)))

(use-package text-adjust
  ;; :disabled
  :defer
  :commands
  (text-adjust
   text-adjust-fill
   text-adjust-space
   text-adjust-buffer
   text-adjust-region
   text-adjust-hankaku
   text-adjust-kutouten
   text-adjust-codecheck
   text-adjust-fill-buffer
   text-adjust-fill-region
   text-adjust-space-buffer
   text-adjust-space-region
   text-adjust-hankaku-region
   text-adjust-hankaku-buffer
   text-adjust-kutouten-buffer
   text-adjust-kutouten-region
   text-adjust-codecheck-buffer
   text-adjust-codecheck-region
   text-adjust-kutouten-read-rule
   )
  :init
  (add-hook 'before-save-hook 'text-adjust-space-before-save-if-needed)
  :config
  (message "Loading \"text-adjust\"")
  (defalias 'spacer 'text-adjust-space-buffer)
  )



(provide 'text-adjust-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; text-adjust-setup.el ends here
