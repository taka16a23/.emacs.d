;;; mac-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/11 08:07:16 (+0900)
;; Last-Updated:2020/01/05 21:22:27 (+0900)
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


(require 'ucs-normalize)
(setq file-name-coding-system 'utf-8-hfs
      locale-coding-system    'utf-8-hfs )


(message "setup mac" )
(require 'ls-lisp "ls-lisp" 'noerr)
(setq ls-lisp-use-insert-directory-program nil)



(provide 'mac-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; mac-setup.el ends here
