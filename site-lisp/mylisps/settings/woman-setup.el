;;; woman-setup.el ---   setting for woman
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 15:35:33 (+0900)
;; Last-Updated:2015/10/22 02:46:19 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function common-view-map-bind-keys "t1-bind-key"))

(require 't1-bind-key "t1-bind-key" 'noerr)

(use-package woman
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"woman\"")
  (custom-set-variables
   '(woman-use-own-frame nil)
   ;; refresh "C-u woman"
   '(woman-cache-filename (my-var-dir-join "woman_cache.el")))
  (common-view-map-bind-keys woman-mode-map)
  )

(use-package man
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"man\"")
  (common-view-map-bind-keys Man-mode-map)
  )



(provide 'woman-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; woman-setup.el ends here
