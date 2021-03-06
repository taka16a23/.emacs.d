;;; yama-find-binary-setup.el ---    Setting for YAMA find binary
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 23:53:17 2012 (+0900)
;; Last-Updated:2015/10/19 15:51:58 (+0900)
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
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package yama-find-file-binary
  ;; :disabled
  :defer 1
  :init
  :config
  (message "Loading \"yama-find-file-binary\"")
  (defadvice find-file (around YAMA-find-file (file &optional wild))
    (if (and
         (condition-case nil (YAMA-file-binary-p file) (error))
         (y-or-n-p "Open as binary? "))
        (hexl-find-file file)
      ad-do-it))
  (ad-activate 'find-file)
  )



(provide 'yama-find-binary-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; yama-find-binary-setup.el ends here
