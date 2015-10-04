;;; 70_dired_mode_start.el --- setting for dired mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 16:13:20 (+0900)
;; Last-Updated: 2015/10/04 16:39:32 (+0900)
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
  (require 't1macro "t1macro"))

(defvar dired-eval-after-load-hook nil
  "Hook for dired `eval-after-load'.")
(add-hook 'dired-eval-after-load-hook 'dired-mode-custom-predefine)
(add-hook 'dired-eval-after-load-hook 'dired-mode-predefine 'append)
(add-hook 'dired-eval-after-load-hook 'dired-mode-map-predefine 'append)
(add-hook 'dired-eval-after-load-hook 'dired-mode-face-predefine 'append)
(run-hooks-after-load "dired" 'dired-eval-after-load-hook)



(defvar dired+-eval-after-load-hook nil
  "Hook for dired+ `eval-after-load'.")
(add-hook 'dired+-eval-after-load-hook 'dired+-mode-custom-predefine)
(add-hook 'dired+-eval-after-load-hook 'dired+-mode-predefine 'append)
(add-hook 'dired+-eval-after-load-hook 'dired+-mode-map-predefine 'append)
(add-hook 'dired+-eval-after-load-hook 'dired+-mode-face-predefine 'append)
(run-hooks-after-load "dired+" 'dired+-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 70_dired_mode_start.el ends here
