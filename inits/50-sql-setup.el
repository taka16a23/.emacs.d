;;; sql-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/15 04:01:05 (+0900)
;; Last-Updated:2015/10/27 03:56:44 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package sql
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"sql\"")
  (setq sql-user "root"
        sql-password "toor"
        sql-database "coop"
        sql-server "localhost"
        sql-port 3306
        truncate-lines t)
  (bind-keys :map sql-interactive-mode-map
             ("C-j" . backward-char)
             ([C-return] . sql-interactive-auto-semicolon))
  )

(defun sql-interactive-auto-semicolon () ;[2015/08/26]
  ""
  (interactive)
  (when (not (looking-back "[\s]*;" 1))
    (insert ";"))
  (comint-send-input))

(setq sql-postgres-login-params
      '((user :default "root")
        (database :default "coop")
        (server :default "localhost")
        (port :default 3306)))



(provide 'sql-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; sql-setup.el ends here
