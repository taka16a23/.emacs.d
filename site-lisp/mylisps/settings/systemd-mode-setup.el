;;; systemd-mode-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/09/15 22:51:36 (+0900)
;; Last-Updated:2015/10/19 13:36:31 (+0900)
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
  (require 'auto-complete "auto-complete" 'noerr)
  (require 'use-package "use-package" 'noerr)
  (require 'systemd "systemd" 'noerr)
  (require 'yasnippet "yasnippet" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  )

(use-package systemd
  ;; :disabled
  :defer
  :ensure t
  :mode
  (("\\.device\\'" . systemd-mode)
   ("\\.path\\'" . systemd-mode)
   ("\\.swap\\'" . systemd-mode)
   ("\\.snapshot\\'" . systemd-mode)
   ("\\.scope\\'" . systemd-mode)
   ("\\.service\\'" . systemd-mode))
  :init
  :config
  (message "Loading \"systemd\"")
  (custom-set-variables
   '(systemd-man-function 'woman))
  (add-hook 'systemd-mode-hook 'auto-complete-mode)
  (require 'yasnippet "yasnippet" 'noerr)
  (define-key yas-minor-mode-map "=" 'yas-expand)
  (bind-keys :map systemd-mode-map
    ("C-c C-c" . systemd-doc-directives))
  )



(provide 'systemd-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; systemd-mode-setup.el ends here
