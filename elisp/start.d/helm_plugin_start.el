;;; helm_plugin_start.el --- functions for helm
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/03/01 13:31:33 (+0900)
;; Last-Updated: 2015/10/04 09:52:07 (+0900)
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
;;    Created
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'helm nil 'noerr))

;;;###autoload
(defun helm-mode-custom-predefine ()
  "For `eval-after-load' helm customize."
  (message "eval-after-load: \"helm\" customizing..")
  )

;;;###autoload
(defun helm-mode-predefine ()
  "For `eval-after-load' helm function."
  (message "eval-after-load: \"helm\" setting..")
  )

;;;###autoload
(defun helm-mode-map-predefine ()
  "For helm key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"helm\" keymaping.."))
  (define-many-keys helm-map
    ("\C-k"    'helm-previous-line)
    ("\C-\M-k" 'helm-previous-page)
    ("\C-\M-n" 'helm-next-page)
    ("\M-n" 'helm-next-source)
    ("\M-k" 'helm-previous-source)
    ((kbd "M-SPC") 'helm-toggle-all-marks)
    ("\C-e" 'helm-execute-persistent-action)))

;;;###autoload
(defun helm-mode-face-predefine ()
  "For helm face."
  (message "eval-after-load: \"helm\" Setting faces..")
  ;; helm.el
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
  )


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


;;;; helm-buffers.el
;;
;;;###autoload
(defun helm-buffers-mode-custom-predefine ()
  "For `eval-after-load' helm-buffers customize."
  (message "eval-after-load: \"helm-buffers\" customizing..")
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
  )

;;;###autoload
(defun helm-buffers-mode-predefine ()
  "For `eval-after-load' helm-buffers function."
  (message "eval-after-load: \"helm-buffers\" setting..")
  )

;;;###autoload
(defun helm-buffers-mode-map-predefine ()
  "For helm-buffers key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"helm-buffers\" keymaping.."))
  )

;;;###autoload
(defun helm-buffers-mode-face-predefine ()
  "For helm-buffers face."
  (message "eval-after-load: \"helm-buffers\" Setting faces..")
  (custom-set-faces
   '(helm-buffer-file ((t :inherit my-file-name-face)))
   '(helm-buffer-directory ((t :inherit my-directory-face)))
   '(helm-buffer-not-saved ((((class color) (background dark))
                             :foreground "yellow")))
   )
  )

;;;; helm-files.el
;;
;;;###autoload
(defun helm-files-mode-custom-predefine ()
  "For `eval-after-load' helm-files customize."
  (message "eval-after-load: \"helm-files\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun helm-files-mode-predefine ()
  "For `eval-after-load' helm-files function."
  (message "eval-after-load: \"helm-files\" setting..")
  )

;;;###autoload
(defun helm-files-mode-map-predefine ()
  "For helm-files key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"helm-files\" keymaping.."))
  )

;;;###autoload
(defun helm-files-mode-face-predefine ()
  "For helm-files face."
  (message "eval-after-load: \"helm-files\" Setting faces..")
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

;;;; helm-utils.el
;;
;;;###autoload
(defun helm-utils-mode-custom-predefine ()
  "For `eval-after-load' helm-utils customize."
  (message "eval-after-load: \"helm-utils\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun helm-utils-mode-predefine ()
  "For `eval-after-load' helm-utils function."
  (message "eval-after-load: \"helm-utils\" setting..")
  )

;;;###autoload
(defun helm-utils-mode-map-predefine ()
  "For helm-utils key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"helm-utils\" keymaping.."))
  )

;;;###autoload
(defun helm-utils-mode-face-predefine ()
  "For helm-utils face."
  (message "eval-after-load: \"helm-utils\" Setting faces..")
  (custom-set-faces
   '(helm-selection-line ((((class color) (background dark))
                           :foreground "red")))
   '(helm-match-item ((((class color) (background dark))
                       :foreground "red"))))
  )

;;;; helm-command.el
;;
;;;###autoload
(defun helm-command-mode-custom-predefine ()
  "For `eval-after-load' helm-command customize."
  (message "eval-after-load: \"helm-command\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun helm-command-mode-predefine ()
  "For `eval-after-load' helm-command function."
  (message "eval-after-load: \"helm-command\" setting..")
  )

;;;###autoload
(defun helm-command-mode-map-predefine ()
  "For helm-command key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"helm-command\" keymaping.."))
  )

;;;###autoload
(defun helm-command-mode-face-predefine ()
  "For helm-command face."
  (message "eval-after-load: \"helm-command\" Setting faces..")
  (custom-set-faces
   '(helm-M-x-key ((((class color) (background dark))
                    :foreground "orange"))))
  )

;;;; helm-grep.el
;;
;;;###autoload
(defun helm-grep-mode-custom-predefine ()
  "For `eval-after-load' helm-grep customize."
  (message "eval-after-load: \"helm-grep\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun helm-grep-mode-predefine ()
  "For `eval-after-load' helm-grep function."
  (message "eval-after-load: \"helm-grep\" setting..")
  )

;;;###autoload
(defun helm-grep-mode-map-predefine ()
  "For helm-grep key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"helm-grep\" keymaping.."))
  )

;;;###autoload
(defun helm-grep-mode-face-predefine ()
  "For helm-grep face."
  (message "eval-after-load: \"helm-grep\" Setting faces..")
  (custom-set-faces
   '(helm-grep-match ((((class color) (background dark))
                       :foreground "red"))))
  )

;;;; helm-bookmark.el
;;
;;;###autoload
(defun helm-bookmark-mode-custom-predefine ()
  "For `eval-after-load' helm-bookmark customize."
  (message "eval-after-load: \"helm-bookmark\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun helm-bookmark-mode-predefine ()
  "For `eval-after-load' helm-bookmark function."
  (message "eval-after-load: \"helm-bookmark\" setting..")
  )

;;;###autoload
(defun helm-bookmark-mode-map-predefine ()
  "For helm-bookmark key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"helm-bookmark\" keymaping.."))
  (define-many-keys helm-bookmark-map
    ("\M-d" 'helm-bookmark-run-delete)
    )
  )

;;;###autoload
(defun helm-bookmark-mode-face-predefine ()
  "For helm-bookmark face."
  (message "eval-after-load: \"helm-bookmark\" Setting faces..")
  )



(provide 'helm_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; helm_plugin_start.el ends here
