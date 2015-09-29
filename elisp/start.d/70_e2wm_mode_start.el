;;; 70_e2wm_mode_start.el --- Setting for e2wm mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 23:33:01 2012 (+0900)
;; Last-Updated: 2015/09/20 01:37:12 (+0900)
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
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  (require 'el-get-bundle "el-get-bundle"))

(el-get-bundle e2wm)

(autoload 'e2wm:start-management "e2wm" nil t)
(autoload 'e2wm:stop-management  "e2wm" nil t)

(defvar e2wm-eval-after-load-hook nil
  "Hook for e2wm `eval-after-load'.")
(add-hook 'e2wm-eval-after-load-hook 'e2wm-mode-custom-predefine)
(add-hook 'e2wm-eval-after-load-hook 'e2wm-mode-predefine 'append)
(add-hook 'e2wm-eval-after-load-hook 'e2wm-mode-map-predefine 'append)
(add-hook 'e2wm-eval-after-load-hook 'e2wm-mode-face-predefine 'append)
(run-hooks-after-load "e2wm" 'e2wm-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 70_e2wm_mode_start.el ends here
