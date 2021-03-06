;;; gdb-setup.el ---  
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:27:49 2012 (+0900)
;; Last-Updated:2015/10/15 05:23:16 (+0900)
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
;; 2013/10/27    Atami
;;    Separated file: gdb_mode_start.el
;;    `gud-mode-predefine', `gud-mode-hook-predefine', `gud-mode-map-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package gud
  ;; :disabled
  :defer
  :init

  :config
  (message "Loading \"gud\"")
  (gud-tooltip-mode 1)
  (setq gdb-use-separate-io-buffer t
		gdb-many-windows t)
  (bind-keys :map gud-mode-map
             ("M-n" . gud-next)
             ("M-s" . gud-step)
             ("M-u" . gud-until)
             ("M-f" . gud-finish))
  )

(defun kill-some-gud-buffers () ;[2014/09/09]
  ""
  (interactive)
  (let ((re "^\\*gud"))
    (kill-some-buffers-by-regexp re)))



(provide 'gdb-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; gdb-setup.el ends here


