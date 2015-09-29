;;; 22_auto-install_plugin_start.el --- auto install elisp
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:35 2012 (+0900)
;; Last-Updated: 2013/11/25 14:08:12 (+0900)
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
;;  (install-elisp-from-emacswiki "anything-auto-install.el")
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
  (require 't1macro "t1macro")
  (require 'auto-install "auto-install" 'noerr)
  )

(defvar auto-install-eval-after-load-hook nil
  "Hook for auto-install `eval-after-load'.")
(add-hook 'auto-install-eval-after-load-hook 'auto-install-mode-custom-predefine)
(add-hook 'auto-install-eval-after-load-hook
          'auto-install-mode-predefine 'append)
(add-hook 'auto-install-eval-after-load-hook
          'auto-install-mode-map-predefine 'append)
(run-hooks-after-load "auto-install" 'auto-install-eval-after-load-hook)


;;;; anything auto install
;;
(autoload 'anything-auto-install "anything-auto-install" nil t)
(autoload 'anything-auto-install-batch "anything-auto-install" nil t)
(autoload 'anything-auto-install-from-library "anything-auto-install" nil t)
(autoload 'anything-auto-install-from-emacswiki "anything-auto-install" nil t)
(autoload 'auto-install-update-emacswiki-package-name "auto-install")
(autoload 'auto-install-from-url "auto-install")

(defvar anything-auto-install-eval-after-load-hook nil
  "Hook for anything-auto-install `eval-after-load'.")
(add-hook 'anything-auto-install-eval-after-load-hook
          'anything-auto-install-mode-predefine 'append)
(run-hooks-after-load "anything-auto-install"
                      'anything-auto-install-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 22_auto-install_plugin_start.el ends here
