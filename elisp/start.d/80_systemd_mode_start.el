;;; 80_systemd_mode_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/09/15 22:51:36 (+0900)
;; Last-Updated: 2015/09/27 21:44:16 (+0900)
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
  (require 'yasnippet "yasnippet" 'noerr)
  (require 'auto-complete "auto-complete" 'noerr)
  )

;;;###autoload
(defun systemd-mode-custom-predefine ()
  "For `eval-after-load' systemd customize."
  (message "eval-after-load: \"systemd\" customizing..")
  (custom-set-variables
   '(systemd-man-function 'woman))
  )

;;;###autoload
(defun systemd-mode-predefine ()
  "For `eval-after-load' systemd function."
  (message "eval-after-load: \"systemd\" setting..")

  (add-hook 'systemd-mode-hook '(lambda () (unless auto-complete-mode
                                             (auto-complete-mode))))
  ;; (remove-hook 'systemd-mode-hook '(lambda () ))
  )

;;;###autoload
(defun systemd-mode-map-predefine ()
  "For systemd key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"systemd\" keymaping.."))
  (require 'yasnippet "yasnippet" 'noerr)
  (define-key yas-minor-mode-map "=" 'yas-expand)
  (define-many-keys systemd-mode-map
    ("\C-c\C-c" 'systemd-doc-directives)
    )
  )

;;;###autoload
(defun systemd-mode-face-predefine ()
  "For systemd face."
  (message "eval-after-load: \"systemd\" Setting faces..")
  )

(defvar systemd-eval-after-load-hook nil
  "Hook for systemd `eval-after-load'.")
(add-hook 'systemd-eval-after-load-hook 'systemd-mode-custom-predefine)
(add-hook 'systemd-eval-after-load-hook 'systemd-mode-predefine 'append)
(add-hook 'systemd-eval-after-load-hook 'systemd-mode-map-predefine 'append)
(add-hook 'systemd-eval-after-load-hook 'systemd-mode-face-predefine 'append)
(run-hooks-after-load "systemd" 'systemd-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 80_systemd_mode_start.el ends here
