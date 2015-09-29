;;; 22_multi-term_plugin_start.el --- multi terminal
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:42 2012 (+0900)
;; Last-Updated: 2015/09/29 22:16:26 (+0900)
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
;; 2013/10/20    Atami
;;    removed: autoload by supported on multi-term.el.
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  ;; (require 'el-get-bundle "el-get-bundle")
  )


;; (el-get-bundle multi-term)

(defvar multi-term-eval-after-load-hook nil
  "Hook for multi-term `eval-after-load'.")
(add-hook 'multi-term-eval-after-load-hook 'multi-term-mode-custom-predefine)
(add-hook 'multi-term-eval-after-load-hook 'multi-term-mode-predefine 'append)
(add-hook 'multi-term-eval-after-load-hook 'multi-term-mode-map-predefine 'append)
(run-hooks-after-load "multi-term" 'multi-term-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 22_multi-term_plugin_start.el ends here
