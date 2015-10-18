;;; auto-recover-setup.el ---   auto-recover setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:23 2012 (+0900)
;; Last-Updated:2015/10/13 17:48:01 (+0900)
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
;; 2012/12/25    Atami
;;    Added: If exist server, then will not run autorecover.
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(require 'subroutines "subroutines" 'noerr)

(defvar no-autorecover-init-time-flag (parse-command-line "--no-autorecover"))

(unless no-autorecover-init-time-flag
  (add-hook 'after-init-hook 'auto-recover-startup)
  (add-hook 'kill-emacs-hook 'before-kill-emacs-cleanup-autosave)
  )



(provide 'auto-recover-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-recover-setup.el ends here


