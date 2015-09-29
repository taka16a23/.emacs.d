;;; 50_usage-memo_plugin_start.el --- usage memo
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:57 2012 (+0900)
;; Last-Updated: 2013/11/02 00:51:27 (+0900)
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

(add-hook 'after-init-hook '(lambda ()
                              (require 'usage-memo)
                              (umemo-initialize)))
;; (remove-hook 'after-init-hook '(lambda () ))

(defvar usage-memo-eval-after-load-hook nil
  "Hook for usage-memo `eval-after-load'.")
(add-hook 'usage-memo-eval-after-load-hook 'usage-memo-mode-custom-predefine)
(add-hook 'usage-memo-eval-after-load-hook 'usage-memo-mode-predefine 'append)
(add-hook 'usage-memo-eval-after-load-hook
          'usage-memo-mode-map-predefine 'append)
(run-hooks-after-load "usage-memo" 'usage-memo-eval-after-load-hook)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 50_usage-memo_plugin_start.el ends here
