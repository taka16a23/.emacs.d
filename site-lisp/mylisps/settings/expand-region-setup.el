;;; expand-region-setup.el --- setting for expand-region
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/23 14:32:08 (+0900)
;; Last-Updated:2015/10/23 14:41:23 (+0900)
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
  (require 'package "package" 'noerr)
  (package-initialize))

(require 'bind-key "bind-key" 'noerr)

;;;###autoload
(defun t1-mark (arg) ;[2015/10/04]
  "ARG"
  (interactive "p")
  (if (region-active-p)
      (if (eq last-command this-command)
          (er/expand-region arg)
        (deactivate-mark))
    (set-mark (point))))

(use-package expand-region
  ;; :disabled
  :defer
  :ensure t
  :commands
  er/expand-region
  :init
  (bind-key "C-SPC" 't1-mark)
  :config
  (message "Loading \"expand-region\"")
  )



(provide 'expand-region-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; expand-region-setup.el ends here
