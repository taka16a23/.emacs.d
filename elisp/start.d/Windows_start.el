;;; Windows_start.el --- Setting for misc windows
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 00:34:37 2012 (+0900)
;; Last-Updated: 2013/11/01 00:24:12 (+0900)
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
;; 2012/12/12    Atami
;;    initialize
;;
;;
;;; Code:


(setq
 ;; w32-pass-lwindow-to-system nil
 ;; w32-pass-rwindow-to-system nil
 w32-pass-apps-to-system nil
 ;; w32-lwindow-modifier 'super ; Left Windows key
 ;; w32-rwindow-modifier 'super ; Right Windows key
 w32-apps-modifier 'hyper) ; Menu key

(setq w32-ime-buffer-switch-p nil)
(setq-default w32-hide-mouse-on-key t)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; Windows_start.el ends here
