;;; auto-install-setup.el ---   auto install elisp
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:35 2012 (+0900)
;; Last-Updated:2015/10/19 14:24:53 (+0900)
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
;;  (install-elisp-from-emacswiki "auto-install.el")
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
  (require 'use-package "use-package" 'noerror)
  (require 'bind-key "bind-key" 'noerr)
  (require 'environment-setup "environment-setup" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  (declare-function eieio--generic-subclass-specializers "eieio")
  )

(use-package auto-install
  ;; :disabled
  :defer
  :ensure t
  :commands (auto-install-compatibility-setup)
  :init
  :config
  (message "Loading \"auto-install\"")
  (require 'auto-install-ext "auto-install-ext" 'noerr)
  (custom-set-variables
   '(auto-install-directory (my-inits-dir-get))
   '(auto-install-replace-confirm t))
  (auto-install-compatibility-setup)
  (bind-keys :map auto-install-minor-mode-map
             ("C-c C-c" . auto-install-save&erase))
  )



(provide 'auto-install-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-install-setup.el ends here
