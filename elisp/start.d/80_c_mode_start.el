;;; 80_c_mode_start.el --- Setting for c mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:16 2012 (+0900)
;; Last-Updated: 2013/12/02 00:26:45 (+0900)
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
;; 2012/12/10    Atami
;;    Moved: Moved functions to c_mode_start.el
;;    `flymake-cc-init', `c-mode-common-hook-predefine'
;;    `gtags-mode-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'gtags))

;; for c++
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;;; Gtags
(autoload 'gtags-mode "gtags" "" t)
(add-hook 'gtags-mode-hook 'gtags-mode-predefine)

(defvar cc-mode-eval-after-load-hook nil
  "Hook for cc-mode `eval-after-load'.")
(add-hook 'cc-mode-eval-after-load-hook 'cc-mode-mode-custom-predefine)
(add-hook 'cc-mode-eval-after-load-hook 'cc-mode-mode-predefine 'append)
(add-hook 'cc-mode-eval-after-load-hook 'cc-mode-mode-map-predefine 'append)
(add-hook 'cc-mode-eval-after-load-hook 'cc-mode-mode-face-predefine 'append)
(run-hooks-after-load "cc-mode" 'cc-mode-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 80_c_mode_start.el ends here
