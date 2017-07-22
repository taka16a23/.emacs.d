;;; recover-last-killed-file-setup.el ---   Setting for recover-last-killed-file
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 21:28:08 2012 (+0900)
;; Last-Updated:2015/10/13 18:22:26 (+0900)
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
;; 2012/12/12    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package recover-last-killed-file
  ;; :disabled
  :defer
  :commands
  (set-last-killed-file get-last-killed-file)
  :init
  (add-hook 'kill-buffer-hook 'set-last-killed-file)
  ;; (remove-hook 'VAR-HOOK '(lambda () ))
  (global-set-key (kbd "C-M-/") 'get-last-killed-file)
  :config
  (message "Loading \"recover-last-killed-file\"")
  )



(provide 'recover-last-killed-file-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; recover-last-killed-file-setup.el ends here


