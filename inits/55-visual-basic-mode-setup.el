;;; 55-visual-basic-mode-setup.el ---  for visula basic mode setup
;;
;; Copyright (C) 2023 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2023/05/17 06:52:47 (+0900)
;; Last-Updated:2023/05/17 07:07:14 (+0900)
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

(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package visual-basic-mode
  ;; :disabled
  :defer
  :mode (("\\.\\(?:frm\\|\\(?:ba\\|cl\\|vb\\)s\\)\\'" . visual-basic-mode))
  :init
  (message "Loading \"visual-basic-mode\"")
  (require 'visual-basic-mode "visual-basic-mode" 'noerr)
  (add-hook 'visual-basic-mode-hook 'yas/minor-mode 'append)
  (add-hook 'visual-basic-mode-hook 'auto-complete-mode 'append)
  (add-hook 'visual-basic-mode-hook 'auto-highlight-symbol-mode 'append)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 55-visual-basic-mode-setup.el ends here
