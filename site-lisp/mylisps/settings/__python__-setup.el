;;; __python__-setup.el ---    setting for org mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/20 16:14:16 (+0900)
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
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'python "python" 'noerr))

(require 'bind-key "bind-key" 'noerr)

(use-package __python__
  ;; :disabled
  :defer
  :commands
  py:newline
  py:auto-colon-return-on-line
  py:refact-doc
  py:refact-list-toggle
  py:extract-variable
  :init
  :config
  (message "Loading \"__python__\"")
  (bind-keys :map python-mode-map
             ("C-c C-e" . nil)
             ("C-m" . py:newline)
             ([(shift return)] . py:auto-colon-return-on-line)
             ("C-c C-e C-x" . py:refact-doc)
             ("C-c C-e d" . py:refact-doc)
             ("C-c C-l" . py:refact-list-toggle)
             ("C-\ M-e" . py:extract-variable)
             ("C-p" . py:beginning-of-class|def)
             ("C-b" . py:end-of-class|def)
             ("M-k" . py:beginning-of-class|def)
             ("M-n" . py:beginning-of-next-class|def)
             ([(control .)] . py:usable-next)
             ([(control \,)] . py:usable-prev)
             ("C-7" . py:string-cmd)
             ("C-c C-e C-a" . py:add-param)
             ("C-c C-e a" . py:add-param)

             )
  )



(provide '__python__-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; __python__-setup.el ends here

