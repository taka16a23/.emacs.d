;;; 60_flycheck_plugin_start.el --- setting flycheck
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/12/05 18:28:52 (+0900)
;; Last-Updated: 2015/10/04 16:39:14 (+0900)
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
;; (auto-install-from-url "https://github.com/flycheck/flycheck/raw/master/flycheck.el")
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  )

(defvar flycheck-eval-after-load-hook nil
  "Hook for flycheck `eval-after-load'.")
(add-hook 'flycheck-eval-after-load-hook 'flycheck-mode-custom-predefine)
(add-hook 'flycheck-eval-after-load-hook 'flycheck-mode-predefine 'append)
(add-hook 'flycheck-eval-after-load-hook 'flycheck-mode-map-predefine 'append)
(add-hook 'flycheck-eval-after-load-hook 'flycheck-mode-face-predefine 'append)
(run-hooks-after-load "flycheck" 'flycheck-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 60_flycheck_plugin_start.el ends here
