;;; window-setup.el ---   Setting for misc windows
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/19 23:53:04 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-switch-bind-keys "t1-bind-key"))

(use-package window
  ;; :disabled
  :defer
  :commands previous-buffer
  :init
  (t1-switch-bind-keys '(("C-f" . previous-buffer)))
  :config
  (message "Loading \"window\"")
  :bind
  (("M-X" . shrink-window)
   ("M-E" . enlarge-window)
   ("M-S" . shrink-window-horizontally)
   ("M-F" . enlarge-window-horizontally)
   ("M-P" . scroll-other-window-down)
   ))



(provide 'window-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; window-setup.el ends here
