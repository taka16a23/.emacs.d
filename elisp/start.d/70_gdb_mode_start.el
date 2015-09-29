;;; 70_gdb_mode_start.el ---
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:27:49 2012 (+0900)
;; Last-Updated: 2013/11/02 02:11:07 (+0900)
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
  (require 't1macro "t1macro"))

(defvar gud-eval-after-load-hook nil
  "Hook for gud `eval-after-load'.")
(add-hook 'gud-eval-after-load-hook 'gud-mode-custom-predefine)
(add-hook 'gud-eval-after-load-hook 'gud-mode-predefine 'append)
(add-hook 'gud-eval-after-load-hook 'gud-mode-map-predefine 'append)
(run-hooks-after-load "gud" 'gud-eval-after-load-hook)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 70_gdb_mode_start.el ends here
