;;; message-setup.el ---   functions for message
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Thu Dec 13 22:43:48 2012 (+0900)
;; Last-Updated:2015/10/19 15:25:14 (+0900)
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
;; 2012/12/13    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package message
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"message\"")
  (face-spec-set 'message-cited-text-face '((t (:bold t :foreground "red"))))
  (face-spec-set 'message-header-cc-face '((t (:bold t :foreground "green4"))))
  (face-spec-set 'message-header-name-face '((t (:bold t :foreground "orange"))))
  (face-spec-set 'message-header-newsgroups-face
                 '((t (:bold t :foreground "violet"))))
  (face-spec-set 'message-header-other-face '((t (:bold t :foreground "chocolate"))))
  (face-spec-set 'message-header-subject-face '((t (:bold t :foreground "yellow"))))
  (face-spec-set 'message-header-to-face '((t (:bold t :foreground "cyan"))))
  (face-spec-set 'message-header-xheader-face
                 '((t (:bold t :foreground "light blue"))))
  (face-spec-set 'message-mml-face '((t (:bold t :background "Green3"))))
  (face-spec-set 'message-separator-face '((t (:foreground "blue3"))))
  )



(provide 'message-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; message-setup.el ends here
