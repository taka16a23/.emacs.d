;;; 60_pymacs_plugin_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/05 11:11:51 (+0900)
;; Last-Updated: 2015/10/05 11:19:01 (+0900)
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
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  (require 'pymacs "pymacs" 'noerr))


(defvar pymacs-eval-after-load-hook nil
  "Hook for pymacs `eval-after-load'.")
(add-hook 'pymacs-eval-after-load-hook 'pymacs-mode-custom-predefine)
(add-hook 'pymacs-eval-after-load-hook 'pymacs-mode-predefine 'append)
(add-hook 'pymacs-eval-after-load-hook 'pymacs-mode-map-predefine 'append)
(run-hooks-after-load "pymacs" 'pymacs-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 60_pymacs_plugin_start.el ends here
