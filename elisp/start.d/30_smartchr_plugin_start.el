;;; 30_smartchr_plugin_start.el --- smart char
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:09 2012 (+0900)
;; Last-Updated: 2013/11/01 02:18:35 (+0900)
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
  (require 't1macro nil 'noerror)
  (require 'smartchr nil 'noerror))

;; (autoload 'smartchr "smartchr" nil)
(require 'smartchr nil 'noerror)

(define-many-keys global-map
  ("{"  (smartchr '("{`!!'}" "{" "{{`!!'}}" "{")))
  ;; ("("  (smartchr '("(`!!')" "(" "((`!!'))" "(")))
  ("\"" (smartchr '("\"`!!'\"" "\"" "\"\"`!!'\"\"" "\"")))
  ("["  (smartchr '("[`!!']" "[" "[[`!!']]" "[")))
  )


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 30_smartchr_plugin_start.el ends here
