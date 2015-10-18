;;; Info-mode-setup.el ---   setting for Info mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 16:43:59 (+0900)
;; Last-Updated:2015/10/18 00:33:46 (+0900)
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

(use-package Info-mode
  ;; :disabled
  :defer
  :init

  :config
  (message "Loading \"Info-mode\"")
  ;; (default-view-bind-set Info-mode-map)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (common-view-map-bind-keys Info-mode-map)
  (custom-set-variables
   '(x-stretch-cursor nil))
  (add-to-list 'Info-additional-directory-list
               (my-data-dir-join "ref/info"))
  (bind-keys :map Info-mode-map
             ("N" .  Info-next)
             ("." .  Info-next)
             ("x" .  Info-next)
             ("," .  Info-history-back)
             ("z" .  Info-history-back)
             ("B" .  Info-history-back)
             ([backspace] .  Info-history-back)
             ("I" .  Info-search-next)
             (" " .  nil)
             (" a" .  sdic-describe-word-at-point)
             ("o" .  clone-buffer)
             ("C-m" .  Info-follow-nearest-node))
  )



(provide 'Info-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; Info-mode-setup.el ends here
