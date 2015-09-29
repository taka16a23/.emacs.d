;;; 60_fold-dwim_plugin_start.el --- fold dwin
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:27:08 2012 (+0900)
;; Last-Updated: 2013/11/01 01:41:32 (+0900)
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
  (require 't1macro nil 'noerror))

(autoload 'fold-dwim-toggle    "fold-dwim")
(autoload 'fold-dwim--hide-all "fold-dwim")
(autoload 'fold-dwim-show-all  "fold-dwim")

(define-many-keys global-map
  ("\M-i"     'fold-dwim-toggle   )
  ("\C-x\M-i" 'fold-dwim-hide-all )
  ("\C-x\M-I" 'fold-dwim-show-all )
  )


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 60_fold-dwim_plugin_start.el ends here
