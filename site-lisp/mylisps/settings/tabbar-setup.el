;;; tabbar-setup.el ---   Setting for tabber
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/02/14 05:49:31 (+0900)
;; Last-Updated:2015/10/19 13:46:17 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  )

(use-package tabbar
  ;; :disabled
  :defer 10
  :ensure t
  :commands
  (tabbar-forward-tab
   tabbar-backward-tab
   tabbar-backward-group
   tabbar-backward-group)
  :init
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (common-view-map-many-register
   '(("." . tabbar-forward-tab)
     ("," . tabbar-backward-tab)))
  :config
  (message "Loading \"tabbar\"")
  (custom-set-variables
   '(tabbar-cycle-scope 'tabs)
   '(tabbar-use-images  nil)
   '(tabbar-mwheel-mode nil)
   '(tabbar-separator   '(1.3)))
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
  (tabbar-mode 1)
  :bind
  (("M->" . tabbar-forward-tab)
   ("M-<" . tabbar-backward-tab)
   ("M-V" . tabbar-backward-group)
   ("M-~" . tabbar-backward-group))
  )



(provide 'tabbar-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; tabbar-setup.el ends here
