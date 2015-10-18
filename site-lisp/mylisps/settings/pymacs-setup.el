;;; pymacs-setup.el ---  
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/05 11:11:51 (+0900)
;; Last-Updated:2015/10/15 01:23:10 (+0900)
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
  (require 'pymacs "pymacs" 'noerr))

(use-package pymacs
  ;; :disabled
  :defer
  :commands
  (pymacs-load)
  :init
  :config
  (message "Loading \"pymacs\"")
  (setq pymacs-timeout-at-start 45
        pymacs-timeout-at-reply 7
        ropemacs-guess-project       t
        ;; ropemacs-codeassist-maxfixes 3
        ropemacs-enable-autoimport   t
        ropemacs-autoimport-modules  '("os" "shutil" "sys" "logging"
                                       "django.*" "re"))
  (require 'py-environment-setup "py-environment-setup" 'noerr)
  (add-to-list 'pymacs-load-path my-pylib-dir) 
  )



(provide 'pymacs-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; pymacs-setup.el ends here


