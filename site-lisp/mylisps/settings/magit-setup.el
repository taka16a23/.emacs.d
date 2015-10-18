;;; magit-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/09/30 08:25:36 (+0900)
;; Last-Updated:2015/10/15 02:24:58 (+0900)
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
  (require 'use-package "use-package" 'noerr))

(declare-function package-bundle "package-setup.el")
(when (require 'package-setup "package-setup" 'noerr)
  (ignore-errors (package-bundle 'magit)))

(use-package magit
  ;; :disabled
  :defer
  :commands
  (magit-status)
  :init
  :config
  (message "Loading \"magit\"")
  )

(use-package with-editor
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"with-editor\"")
  (bind-keys :map with-editor-mode-map
             ("C-s" . with-editor-finish))
  )



(provide 'magit-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; magit-setup.el ends here
