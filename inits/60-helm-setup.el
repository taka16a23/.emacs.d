;;; helm-setup.el ---   Setting for helm
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/03/01 13:29:58 (+0900)
;; Last-Updated:2015/11/03 03:53:49 (+0900)
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
;; 2013/03/01    Atami
;;    Created:
;;
;;
;;; Code:


(eval-when-compile
  (require 'bind-key "bind-key" 'noerr)
  (require 'use-package "use-package" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-edit-bind-keys "t1-bind-key")
  (declare-function t1-ctl-x-bind-keys "t1-bind-key"))

(require 'bind-key "bind-key" 'noerr)

;;;###autoload
(defun helm-my-edit () ;[2015/10/03]
  ""
  (interactive)
  (require 'helm-ring "helm-ring")
  (require 'helm-c-yasnippet "helm-c-yasnippet")
  (let ((enable-recursive-minibuffers t))
    (helm :sources '(helm-source-kill-ring
                     helm-c-source-yasnippet)
          :buffer "*helm my edit*"
          :resume 'noresume
          :allow-nest t)))

;; helm.el
(use-package helm
  ;; :disabled
  :defer
  :commands helm
  :init
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (t1-edit-bind-keys
   '(("C-e" . helm-my-edit)))
  :config
  (message "Loading \"helm\"")
  (custom-set-faces
   '(helm-source-header ((((background dark))
                          ;; :background "#22083397778B"
                          :background "#511a1a"
                          :foreground "white"
                          :weight bold :height 1.1 :family "Sans Serif")
                         (((background light))
                          :background "#abd7f0"
                          :foreground "black"
                          :weight bold :height 1.1 :family "Sans Serif")))
   ;; '(helm-visible-mark ((t )))
   ;; '(helm-header ((t )))
   ;; '(helm-candidate-number ((t )))
   '(helm-selection ((((class color) (background dark)) :inherit match)))
   ;; '(helm-separator ((t )))
   ;; '(helm-action ((t )))
   ;; '(helm-prefarg ((t )))
   ;; '(helm-header-line-left-margin ((t )))
   '(helm-match ((((class color) (background dark)) :inherit match)))
   )
  (bind-keys :map helm-map
             ("C-k" . helm-previous-line)
             ("C-M-k" . helm-previous-page)
             ("C-M-n" . helm-next-page)
             ("M-n" . helm-next-source)
             ("M-k" . helm-previous-source)
             ("M-SPC" . helm-toggle-all-marks)
             ("C-e" . helm-execute-persistent-action)
             ("C-j" . backward-char)
             ("C-l" . forward-char))
  )

;; helm-buffers.el
(use-package helm-buffers
  ;; :disabled
  :defer
  :commands helm-mini
  :init
  (t1-ctl-x-bind-keys '(("C-x" . helm-mini)))
  :config
  (message "Loading \"helm-buffers\"")
  (custom-set-variables
   ;; helm-buffers.el
   '(helm-boring-buffer-regexp-list
     '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf"))
   '(helm-buffers-favorite-modes
     '(lisp-interaction-mode emacs-lisp-mode text-mode org-mode))
   '(helm-buffer-max-length 30)
   '(helm-buffer-details-flag t)
   '(helm-buffers-fuzzy-matching t)
   '(helm-buffer-skip-remote-checking nil)
   '(helm-buffers-truncate-lines t)
   '(helm-mini-default-sources '(helm-source-buffers-list
                                 helm-source-bookmarks
                                 ;; helm-source-ls-git
                                 helm-source-recentf
                                 helm-source-find-files
                                 helm-source-buffer-not-found
                                 ))
   '(helm-buffers-end-truncated-string "...")
   )
  (custom-set-faces
   '(helm-buffer-file ((t :inherit my-file-name-face)))
   '(helm-buffer-directory ((t :inherit my-directory-face)))
   '(helm-buffer-not-saved ((((class color) (background dark))
                             :foreground "yellow")))
   )
  (bind-keys :map helm-buffer-map
             ("M-d" . helm-buffer-run-kill-buffers)
             ("M-SPC" . helm-toggle-all-marks)
             )
  )


;; helm-files.el
(use-package helm-files
  ;; :disabled
  :defer
  :init
  (t1-ctl-x-bind-keys '(("C-f" . helm-find-files)))
  :config
  (message "Loading \"helm-files\"")
  (custom-set-variables
   '(helm-ff-newfile-prompt-p nil))
  (custom-set-faces
   ;; '(helm-ff-prefix)
   '(helm-ff-executable ((((class color) (background dark))
                          :foreground "red")))
   '(helm-ff-directory ((t :inherit my-directory-face)))
   '(helm-ff-dotted-directory ((((class color) (background dark))
                                :foreground "gray")))
   '(helm-ff-dotted-symlink-directory ((((class color) (background dark))
                                        :foreground "#8b0000"))) ;DarkRed
   '(helm-ff-symlink ((((class color) (background dark))
                       :inherit my-symlink-face)))
   '(helm-ff-invalid-symlink ((((class color) (background dark))
                               :foreground "black" :background "red")))
   '(helm-ff-file ((t :inherit my-file-name-face)))
   '(helm-history-deleted ((((class color) (background dark))
                            :foreground "gray")))
   '(helm-history-remote ((((class color) (background dark))
                           :foreground "cyan" :underline t)))
   )
  )

;; helm-utils.el
(use-package helm-utils
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"helm-utils\"")
  (custom-set-faces
   '(helm-selection-line ((((class color) (background dark))
                           :foreground "red")))
   '(helm-match-item ((((class color) (background dark))
                       :foreground "red"))))
  )

;; helm-command.el
(use-package helm-command
  ;; :disabled
  :defer
  :commands helm-M-x
  :init
  :config
  (message "Loading \"helm-command\"")
  (custom-set-faces
   '(helm-M-x-key ((((class color) (background dark))
                    :foreground "orange"))))
  :bind
  (("M-d" . helm-M-x))
  )

;; helm-grep.el
(use-package helm-grep
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"helm-grep\"")
  (custom-set-faces
   '(helm-grep-match ((((class color) (background dark))
                       :foreground "red"))))
  )


;; helm-bookmark.el
(use-package helm-bookmark
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"helm-bookmark\"")
  (bind-keys :map helm-bookmark-map
             ("M-d" . helm-bookmark-run-delete))
  )

(use-package helm-man
  ;; :disabled
  :defer
  :commands helm-woman
  :init
  (t1-ctl-x-bind-keys '(("m" . helm-man-woman)))
  ;; (global-set-key "\C-xm" 'helm-man-woman)
  :config
  (message "Loading \"helm-man\"")
  )

(use-package helm-ring
  ;; :disabled
  :defer
  :commands helm-show-kill-ring
  :init
  ;; (global-set-key "\M-y" 'helm-show-kill-ring)
  :config
  (message "Loading \"helm-ring\"")
  :bind
  (("M-y" . helm-show-kill-ring))
  )

(use-package helm-elisp
  ;; :disabled
  :defer
  :commands helm-apropos
  :init
  (bind-keys :map emacs-lisp-mode-map
             ("C-c C-a" . helm-apropos)
             ("C-c a" . helm-apropos))
  (bind-keys :map lisp-interaction-mode-map
             ("C-c h" . helm-apropos)
             ("C-c C-h" . helm-apropos)
             ("C-c C-c" . helm-lisp-completion-at-point))
  :config
  (message "Loading \"helm-elisp\"")
  )

(use-package helm-imenu
  ;; :disabled
  :defer
  :commands helm-imenu
  :init
  (bind-keys :map emacs-lisp-mode-map
             ("C-c j" . helm-imenu)
             ("C-c C-j" . helm-imenu))
  (bind-keys :map lisp-interaction-mode-map
             ("C-c j" . helm-imenu)
             ("C-c C-j" . helm-imenu))
  :config
  (message "Loading \"helm-imenu\"")
  )



(provide 'helm-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; helm-setup.el ends here
