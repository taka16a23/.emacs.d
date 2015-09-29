;;; 20_auto-async-byte-compile_plugin_start.el --- auto byte compile
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:19 2012 (+0900)
;; Last-Updated: 2015/09/19 21:53:13 (+0900)
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
  (require 't1macro "t1macro"))

(autoload 'enable-auto-async-byte-compile-mode "auto-async-byte-compile")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(defvar auto-async-byte-compile-eval-after-load-hook nil
  "Hook for auto-async-byte-compile `eval-after-load'.")
(add-hook 'auto-async-byte-compile-eval-after-load-hook
          'auto-async-byte-compile-mode-custom-predefine)
(add-hook 'auto-async-byte-compile-eval-after-load-hook
          'auto-async-byte-compile-mode-predefine 'append)
(run-hooks-after-load "auto-async-byte-compile" 'auto-async-byte-compile-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 20_auto-async-byte-compile_plugin_start.el ends here
