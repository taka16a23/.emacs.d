;;; image-mode-setup.el ---   setting for image mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 15:47:18 (+0900)
;; Last-Updated:2015/10/19 15:39:47 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package image-mode
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"image-mode\"")
  (bind-keys :map image-mode-map
             ("v" . image-next-line)
             ("f" . image-forward-hscroll)
             ("s" . image-backward-hscroll)
             ("w" . image-previous-file)
             ("e" . image-previous-file)
             ("l" . image-forward-hscroll)
             ("j" . image-backward-hscroll)
             ("n" . image-next-line)
             ("k" . image-previous-line)
             ("d" . image-previous-line)
             ("b" . image-next-file)
             ("o" . other-window)
             ))



(provide 'image-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; image-mode-setup.el ends here