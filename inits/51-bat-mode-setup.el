;;; bat-mode-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/15 03:18:25 (+0900)
;; Last-Updated:2015/10/19 16:23:09 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 'subroutines "subroutines" 'noerr)
  (declare-function windows-p "subroutines")
  )

(require 'subroutines "subroutines" 'noerr)

(use-package bat-mode
  ;; :disabled
  :defer
  :commands bat-mode
  :if (windows-p)
  :mode
  (("\\.[bB][aA][tT]$" . bat-mode)
   ("CONFIG\\." . bat-mode)
   ("AUTOEXEC\\." . bat-mode))
  :init
  :config
  (message "Loading \"bat-mode\"")
  )



(provide 'bat-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; bat-mode-setup.el ends here
