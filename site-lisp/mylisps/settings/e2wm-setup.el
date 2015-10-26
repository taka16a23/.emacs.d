;;; e2wm-setup.el ---   Setting for e2wm mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 23:33:01 2012 (+0900)
;; Last-Updated:2015/10/27 04:04:34 (+0900)
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


(eval-when-compile
  (require 'bind-key "bind-key" 'noerr)
  (require 'use-package "use-package" 'noerr)
  (require 'e2wm "e2wm" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  )

(use-package e2wm
  ;; :disabled
  :defer
  :ensure t
  :commands
  e2wm:start-management
  e2wm:stop-management
  defe2wm:navi-simple-command
  e2wm:define-keymap
  :init
  (bind-keys ("M-+" . e2wm:toggle-start-stop)
             ("M-P" . e2wm:start-direct-pycode))
  :config
  (message "Loading \"e2wm\"")
  (bind-keys :map e2wm:pst-minor-mode-keymap
             ("M-P" . e2wm:dp-pycode)
             ("M-E" . e2wm:dp-t1code)
             ("M-T" . e2wm:dp-two)
             ("M-Z" . e2wm:dp-term)
             ("M-B" . e2wm:dp-book)
             ("M-D" . e2wm:dp-doc)
             ("M-W" . e2wm:dp-web)
             ;; ("M-!" . e2wm:dp-svn)
             ;; ("M-)" . e2wm:dp-code)
             ;; ("M-C" . e2wm:dp-code)
             ("M-G" . e2wm:dp-magit)
             ("M-N" . e2wm:windmove-down-or-splitmove)
             ("M-K" . e2wm:windmove-up-or-splitmove)
             )
  (bind-keys :map e2wm:def-plugin-files-mode-map
             ([backspace] . e2wm:def-plugin-files-updir-command)
             ("D" . e2wm:def-plugin-files-delete-command)
             ("+" . e2wm:def-plugin-files-mkdir-command)
             ("r" . e2wm:def-plugin-files-rename-command)
             ("C-c d" . e2wm:def-plugin-files-open-dired-command))
  (face-spec-set 'e2wm:face-history-list-normal '((t :foreground "White")))
  (use-package e2wm-t1code-pst
    ;; :disabled
    :defer
    :commands e2wm:dp-t1code
    :init
    :config
    (message "Loading \"e2wm-t1code-pst\"")
    )
  (use-package e2wm-minor-commands
    ;; :disabled
    ;; :defer
    ;; :commands
    :init
    :config
    (message "Loading \"e2wm-minor-commands\"")
    )
  (use-package e2wm-vcs
    ;; :disabled
    :defer
    :init
    :config
    (message "Loading \"e2wm-vcs\"")
    (setq e2wm:c-magit-recipe '(| (:left-max-size 30)
                                  (- (:upper-size-ratio 0.7)
                                     files history)
                                  (| (:right-max-size 80)
                                     (- status (- main sub))
                                     (- (:upper-size-ratio 0.4) branches logs))))
    (defalias 'magit-get-top-dir 'magit-toplevel) ;fixed void "magit-get-top-dir"
    ;; override
    (defun e2wm:dp-magit-popup (buf)
      (let ((cb (current-buffer)))
        (e2wm:message "#DP MAGIT popup : %s (current %s / backup %s)"
                      buf cb e2wm:override-window-cfg-backup))
      (unless (e2wm:vcs-select-if-plugin buf)
        (let ((buf-name (buffer-name buf))
              (wm (e2wm:pst-get-wm))
              (not-minibufp (= 0 (minibuffer-depth))))
          (e2wm:with-advice
           (cond
            ((string-match "^COMMIT_EDITMSG" buf-name)
             ;; displaying commit objects in the main window
             (e2wm:pst-buffer-set 'main buf t nil))
            ((string-match "^\\*magit: .*\\*$" buf-name)
             ;; displaying status object in the status window
             (e2wm:pst-buffer-set 'status buf t t))
            ((string-match "^\\*magit-diff: .+\\*$" buf-name)
             ;; displaying diff object in the logs window
             (e2wm:pst-buffer-set 'logs buf t nil))
            ((buffer-file-name buf)
             ;; displaying file buffer in the main window
             (e2wm:pst-buffer-set 'main buf t t))
            (t
             (princ buf-name)
             ;; displaying other objects in the sub window
             (e2wm:pst-buffer-set 'sub buf t not-minibufp)))))))
    (defun e2wm:dp-magit-switch (buf)
      (e2wm:message "#DP MAGIT switch : %s" buf)
      (let ((bufname (buffer-name buf)))
        (cond ((string-match "^COMMIT_EDITMSG" bufname)
               (e2wm:pst-buffer-set 'main buf t t))
              (t (e2wm:vcs-select-if-plugin buf)))))
    (defadvice e2wm:dp-magit
        (after select-after-e2wm:dp-magit activate)
      (wlf:select (e2wm:pst-get-wm) 'status))
    ;; (progn (ad-disable-advice 'e2wm:dp-magit 'after 'select-after-e2wm:dp-magit) (ad-update 'e2wm:dp-magit))
    )
  )


(defun e2wm:toggle-start-stop ()
  (interactive)
  (require 'e2wm-t1code-pst "e2wm-t1code-pst")
  (require 'e2wm-vcs "e2wm-vcs")
  (if (and (boundp 'e2wm:pst-minor-mode)
           e2wm:pst-minor-mode)
      (e2wm:stop-management)
    (e2wm:start-management '(t1code two htwo doc magit))
    (e2wm:pst-update-windows)))



(provide 'e2wm-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm-setup.el ends here
