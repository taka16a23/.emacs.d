;;; tabbar_plugin_start.el --- functions for tabbar
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/02/14 07:40:54 (+0900)
;; Last-Updated: 2015/10/05 09:35:45 (+0900)
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
;; 2013/02/14    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'tabbar "tabbar" 'noerr))

;;;###autoload
(defun tabbar-mode-custom-predefine ()
  "For `eval-after-load' tabbar customize."
  (message "eval-after-load: \"tabbar\" customizing..")
  (custom-set-variables
   '(tabbar-cycle-scope 'tabs)
   '(tabbar-use-images  nil)
   '(tabbar-mwheel-mode nil)
   '(tabbar-separator   '(1.3)))
  )

;;;###autoload
(defun tabbar-mode-predefine ()
  "For `eval-after-load' tabbar function."
  (message "eval-after-load: \"tabbar\" setting..")
  )

;;;###autoload
(defun tabbar-mode-map-predefine ()
  "For tabbar key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"tabbar\" keymaping.."))
  )

;;;###autoload
(defun tabbar-mode-face-predefine ()
  "For tabbar face."
  (message "eval-after-load: \"tabbar\" Setting faces..")
  (custom-set-faces
   '(tabbar-default ((((class color) (background dark))
                      :background "gray25"
                      :foreground nil
                      :height 1.0
                      )))
   '(tabbar-unselected ((((class color) (background dark))
                         :background nil
                         :foreground "green"
                         :box nil
                         )))
   '(tabbar-selected ((((class color) (background dark))
                       :background nil
                       :foreground "red"
                       :box nil
                       :bold t
                       )))
   '(tabbar-modified ((((class color) (background dark))
                       :background nil
                       :foreground "yellow"
                       :box nil
                       :bold t
                       )))
   )
  (dolist (btn '(tabbar-buffer-home-button
                 tabbar-scroll-left-button
                 tabbar-scroll-right-button))
    (set btn (cons (cons "" nil)
                   (cons "" nil))))
  )



(provide 'tabbar_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; tabbar_plugin_start.el ends here
