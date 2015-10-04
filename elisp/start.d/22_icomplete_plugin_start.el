;;; 22_icomplete_plugin_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/04 15:39:59 (+0900)
;; Last-Updated: 2015/10/04 15:56:49 (+0900)
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
  (require 't1macro "t1macro"))

(defvar icomplete-eval-after-load-hook nil
  "Hook for icomplete `eval-after-load'.")
(add-hook 'icomplete-eval-after-load-hook 'icomplete-mode-custom-predefine)
(add-hook 'icomplete-eval-after-load-hook 'icomplete-mode-predefine 'append)
(add-hook 'icomplete-eval-after-load-hook 'icomplete-mode-map-predefine 'append)
(add-hook 'icomplete-eval-after-load-hook 'icomplete-mode-face-predefine 'append)
(run-hooks-after-load "icomplete" 'icomplete-eval-after-load-hook)


(add-hook 'after-init-timer-hook
          '(lambda()
             (require 'icomplete "icomplete" 'noerr)
             (icomplete-mode 1)))



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 22_icomplete_plugin_start.el ends here
