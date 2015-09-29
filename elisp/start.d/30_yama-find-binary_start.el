;;; 30_yama-find-binary_start.el ---  Setting for YAMA find binary
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 23:53:17 2012 (+0900)
;; Last-Updated: Tue Dec 11 23:57:46 2012 (+0900)
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


(defadvice find-file (around YAMA-find-file (file &optional wild))
  (if (and
       (condition-case nil (YAMA-file-binary-p file) (error))
       (y-or-n-p "open as binary?"))
      (hexl-find-file file)
    ad-do-it))
(ad-activate 'find-file)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 30_yama-find-binary_start.el ends here
