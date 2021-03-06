;;; python-pylint-setup.el ---   setting python-pylint
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 05:18:48 (+0900)
;; Last-Updated:2015/10/20 14:48:50 (+0900)
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


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'python "python" 'noerr))

(use-package python-pylint
  ;; :disabled
  :defer
  :commands pylint
  :init
  :config
  (message "Loading \"python-pylint\"")
  (custom-set-variables
   '(python-pylint-options '("-ry -f parseable")))
  (when (windows-p)
    (custom-set-variables
     '(python-pylint-command "pylint.bat")))
  (bind-keys :map python-mode-map
             ("C-c C-s" . pylint)
             )
  )



(provide 'python-pylint-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python-pylint-setup.el ends here
