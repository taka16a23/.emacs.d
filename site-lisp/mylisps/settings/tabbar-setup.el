;;; tabbar-setup.el ---   Setting for tabber
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/02/14 05:49:31 (+0900)
;; Last-Updated:2016/01/06 09:51:44 (+0900)
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
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function common-view-map-many-register "t1-bind-key")
  )

(use-package tabbar
  ;; :disabled
  :defer 10
  :ensure t
  :commands
  (tabbar-forward-tab
   tabbar-backward-tab
   tabbar-backward-group
   tabbar-backward-group
   tabbar-mode)
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
  ;; from http://www.emacswiki.org/emacs/TabBarMode
  (defun my-tabbar-buffer-groups ()
    "Return the list of group names BUFFER belongs to.
    Return only one group for each buffer."
    (cond
     ((or (get-buffer-process (current-buffer)) (memq major-mode '(comint-mode compilation-mode))) '("Term"))
     ((string-equal "*" (substring (buffer-name) 0 1)) '("Misc"))
     ((memq major-mode '(emacs-lisp-mode python-mode emacs-lisp-mode c-mode c++-mode makefile-mode lua-mode vala-mode)) '("Coding"))
     ((memq major-mode '(javascript-mode js-mode nxhtml-mode html-mode css-mode)) '("HTML"))
     ((memq major-mode '(org-mode calendar-mode diary-mode)) '("Org"))
     ((memq major-mode '(dired-mode)) '("Dir"))
     (t '("Main"))))
  (defun my-buffer-eproject-name ()
    (when eproject-root
      (catch 'loop
        (let ((lst (eproject-projects)))
          (while lst
            (let ((proj (pop lst)))
              (if (string= eproject-root (cdr proj))
                  (throw 'loop (car proj)))))))))
  (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
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
