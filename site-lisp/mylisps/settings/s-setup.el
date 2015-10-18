;;; s-setup.el ---   key bind setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:06 2012 (+0900)
;; Last-Updated:2015/10/18 03:33:11 (+0900)
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
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package s
  ;; :disabled
  :defer
  :commands
  (s-trim-left
   s-trim-right
   s-trim
   s-collapse-whitespace
   s-split
   s-split-up-to
   s-lines
   s-join
   s-concat
   s-prepend
   s-append
   s-repeat
   s-chop-suffix
   s-chop-suffixes
   s-chop-prefix
   s-chop-prefixes
   s-shared-start
   s-shared-end
   s-chomp
   s-truncate
   s-word-wrap
   s-center
   s-pad-left
   s-pad-right
   s-left
   s-right
   s-ends-with?
   s-starts-with?
   s--truthy?
   s-contains?
   s-equals?
   s-less?
   s-matches?
   s-blank?
   s-present?
   s-presence
   s-lowercase?
   s-uppercase?
   s-mixedcase?
   s-capitalized?
   s-numeric?
   s-replace
   s--aget
   s-replace-all
   s-downcase
   s-upcase
   s-capitalize
   s-titleize
   s-with
   s-index-of
   s-reverse
   s-match-strings-all
   s-match
   s-slice-at
   s-split-words
   s--mapcar-head
   s-lower-camel-case
   s-upper-camel-case
   s-snake-case
   s-dashed-words
   s-capitalized-words
   s-titleized-words
   s-word-initials
   s-format
   s-lex-fmt|expand
   s-lex-format
   s-count-matches
   s-wrap
   )
  :init
  :config
  (message "Loading \"s\"")
  )



(provide 's-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; s-setup.el ends here
