;;; pymacs-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/05 11:11:51 (+0900)
;; Last-Updated:2015/10/21 01:47:50 (+0900)
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
  (require 'pymacs "pymacs" 'noerr)
  (require 'python "python" 'noerr)
  (defvar my-pylib-dir))

(require 'py-environment-setup "py-environment-setup" 'noerr)
(require 'bind-key "bind-key" 'noerr)

(defun rope-open-current-or-parent ()
  "Rope open current or parent."
  (cond ((file-exists-p ".ropeproject")
    	 (rope-open-project default-directory))
    	((file-exists-p "../.ropeproject")
    	 (rope-open-project (concat default-directory "..")))))

(use-package pymacs
  ;; :disabled
  :defer
  :commands pymacs-load pymacs-call pymacs-eval pymacs-exec pymacs-load
  :init
  (pythonpath-append (my-pylib-dir-get))
  :config
  (message "Loading \"pymacs\"")
  (setq pymacs-timeout-at-start 45
        pymacs-timeout-at-reply 7
        )
  (require 'py-environment-setup "py-environment-setup" 'noerr)
  (add-to-list 'pymacs-load-path my-pylib-dir)
  (pymacs-load "ropemacs" "rope-" 'noerror)
  (setq ropemacs-guess-project t
        ;; ropemacs-codeassist-maxfixes 3
        ropemacs-enable-autoimport t
        ropemacs-autoimport-modules '("os" "shutil" "sys" "logging"
                                      "django.*" "re"))
  (add-hook 'python-mode-hook 'rope-open-current-or-parent 'append)
  (require 'usage-memo "usage-memo" 'noerr)
  (bind-keys :map python-mode-map
             ("C-c h" . rope-show-doc)
             ("C-c C-h" . rope-show-doc)
             ("C-c d" . rope-show-doc)
             ("C-c C-x" . rope-show-doc)
             ("C-c r o" . rope-open-project)
             ("C-c r f" . rope-find-file)
             ("C-c r g" . rope-goto-definition)
             ("C-c r r" . rope-rename)
             ("C-c r i" . rope-auto-import)
             )
  )



(provide 'pymacs-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; pymacs-setup.el ends here
