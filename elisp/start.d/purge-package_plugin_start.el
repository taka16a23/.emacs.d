;;; purge-package_plugin_start.el --- functions for purge-package
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 18 18:51:27 2012 (+0900)
;; Last-Updated: 2013/11/02 21:47:45 (+0900)
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
;; 2012/12/18    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'purge-package "purge-package" 'noerr))


;;;###autoload
(defun purge-package-mode-custom-predefine ()
  "For `eval-after-load' purge-package customize."
  (message "eval-after-load: \"purge-package\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun purge-package-mode-predefine ()
  "For `eval-after-load' purge-package function."
  (message "eval-after-load: \"purge-package\" setting..")
  (setq purge-package-list '("5x5"
                             "animate"
                             "blackbox"
                             "bruce"
                             "bubbles"
                             "cookie1"
                             "decipher"
                             "dissociate"
                             "doctor"
                             "dunnet"
                             "fortune"
                             "gamegrid"
                             "gametree"
                             "gomoku"
                             "handwrite"
                             "hanoi"
                             "landmark"
                             "life"
                             "meese"
                             "morse"
                             "mpuz"
                             "pong"
                             "snake"
                             "solitaire"
                             "spook"
                             "studly"
                             "tetris"
                             "yow"
                             "zone"))
  )


(provide 'purge-package_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; purge-package_plugin_start.el ends here
