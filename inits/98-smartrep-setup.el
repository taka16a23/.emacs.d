;;; smartrep_setup.el ---  Setting for smartrep
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/03/03 22:24:21 (+0900)
;; Last-Updated:2015/10/20 15:59:29 (+0900)
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
;; 2013/03/03    Atami
;;    Created
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'python "python" 'noerr)
  (require 'smartrep "smartrep" 'noerr)
  (declare-function smartrep-define-key "smartrep"))

(use-package smartrep
  ;; :disabled
  ;; :defer
  :init
  :config
  (message "Loading \"smartrep\"")
  (smartrep-define-key
      global-map "C-e" '(
                          ;; ("\\" . rep-dir-sep)
                          ("K" . move-text-up)
                          ("N" . move-text-down)
                          ("C-i" . indent-and-next)
                          ("M-@" . mc/mark-next-like-this)
                         ))
  )



(provide 'smartrep_setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; smartrep_setup.el ends here
