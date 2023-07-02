;;; 56-markdown-model-setup.el ---  markdown mode
;;
;; Copyright (C) 2023 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2023/07/03 05:04:51 (+0900)
;; Last-Updated:2023/07/03 05:08:14 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (package-initialize))

(use-package markdown-mode
  ;; :disabled
  :defer
  :mode (("\\.md" . markdown-mode))
  :init
  (message "Loading \"markdown mode\"")
  (require 'markdown-mode "markdown-mode" 'noerr)
  )

(provide '56-markdown-model-setup)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 56-markdown-model-setup.el ends here

