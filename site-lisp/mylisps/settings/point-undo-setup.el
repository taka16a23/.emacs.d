;;; point-undo-setup.el ---   point undo
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:03 2012 (+0900)
;; Last-Updated:2015/10/16 13:37:27 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'bind-key))

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(use-package point-undo
  :defer 3
  :init
  :bind (("C-]" . point-undo)
         ("C-}" . point-redo))
  :config
  (message "point-undo loaded")
  )



(provide 'point-undo-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; point-undo-setup.el ends here
