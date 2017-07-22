;;; savekill-setup.el ---   save kill ring on disk
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:45 2012 (+0900)
;; Last-Updated:2015/10/18 16:43:10 (+0900)
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
;; 2013/01/15    Atami
;;    fix: deadviced `kill-new' on WINDOWS system.
;;
;; 2012/12/17    Atami
;;    fix: Added `kill-ring-log-file' docstrings.
;;
;; 2012/12/12    Atami
;;    Added: defadvice `kill-new'
;;    logging all of kill-ring.
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(require 'subroutines "subroutines" 'noerr)

(use-package savekill
  ;; :disabled
  :init
  :if
  (not (and (windows-p) (boundp 'usb-drive-letter)))
  :config
  (message "Loading \"savekill\"")
  (require 'environment-setup "environment-setup" 'noerr)
  (custom-set-variables
   '(save-kill-file-name (my-log-dir-join "kill-ring-saved.el")))
  )



(provide 'savekill-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; savekill-setup.el ends here
