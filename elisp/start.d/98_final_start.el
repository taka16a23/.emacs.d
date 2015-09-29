;;; 98_final_start.el ---
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:44 2012 (+0900)
;; Last-Updated: 2013/11/08 21:42:02 (+0900)
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

(defalias 'tab-to-space 'untabify)
(defalias 'space-to-tab 'tabify)
(defalias 'bfn 'buffer-file-name)

;;;; purge-package.el
;;
(defvar purge-package-eval-after-load-hook nil
  "Hook for purge-package `eval-after-load'.")
(add-hook 'purge-package-eval-after-load-hook
          'purge-package-mode-custom-predefine)
(add-hook 'purge-package-eval-after-load-hook
          'purge-package-mode-predefine 'append)
(run-hooks-after-load "purge-package" 'purge-package-eval-after-load-hook)

(add-hook 'rest-room-hook 'purge-package)

;;;; chmod-x
;;
(unless (windows-p)
  (add-hook 'after-save-hook 'make-file-executable))



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 98_final_start.el ends here
