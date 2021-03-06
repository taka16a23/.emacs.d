;;; icomplete-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/04 15:39:59 (+0900)
;; Last-Updated:2015/10/19 14:42:01 (+0900)
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
  (require 'bind-key "bind-key" 'noerr)
  (require 'icomplete "icomplete" 'noerr))

(use-package icomplete
  ;; :disabled
  :defer 3
  :commands
  (icomplete-mode)
  :init
  :config
  (message "Loading \"icomplete\"")
  (icomplete-mode 1)
  (custom-set-faces
   '(icomplete-first-match ((((class color) (background dark))
                             :whight bold :foreground "cyan"))))
  (require 'bind-key "bind-key" 'noerr)
  (bind-keys :map icomplete-minibuffer-map
             ("C-l" . icomplete-forward-completions)
             ("C-j" . icomplete-backward-completions))
  )



(provide 'icomplete-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; icomplete-setup.el ends here
