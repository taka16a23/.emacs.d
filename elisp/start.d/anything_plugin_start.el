;;; anything_plugin_start.el --- functions for anything
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 01:01:53 2012 (+0900)
;; Last-Updated: 2014/05/27 10:37:20 (+0900)
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
;; 2014/05/27    Atami
;;    Modified: `anything-mode-predefine'
;;    `anything-candidate-number-limit' variable from 50 as default to 80.
;;
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro nil 'noerror)
  (require 'anything nil 'noerror)
  (require 'anything-config nil 'noerror)
  (require 'anything-search-file nil 'noerror)
  (require 'descbinds-anything nil 'noerror))

;;;###autoload
(defun anything-mode-custom-predefine ()
  "For `eval-after-load' anything customize."
  (message "eval-after-load: \"anything\" customizing..")
  (custom-set-variables
   '(anything-c-filelist-file-name "/tmp/all.filelist")
   '(anything-grep-candidates-fast-directory-regexp "^/tmp")
   '(anything-c-adaptive-history-file
     (concat my-var-dir "anything-c-adaptive-history")))
  )

;;;###autoload
(defun anything-mode-predefine ()
  "For `eval-after-load' anything function."
  (message "eval-after-load: \"anything\" setting..")
  (require 'anything-config nil t)
  (require 'anything-search-file nil t)
  (when (require 'descbinds-anything nil t)
   ;; Comment if you do not want to replace `describe-bindings' with `anything'.
    (descbinds-anything-install))
  (setq anything-quick-update 1
        anything-idle-delay 0.3
        anything-input-idle-delay 0
        anything-samewindow nil
        anything-candidate-number-limit 80)

  (define-anything-type-attribute 'buffer
    `((action
       ,@(if pop-up-frames
             '(("Switch to buffer other window" . switch-to-buffer-other-window)
               ("Switch to buffer" . switch-to-buffer))
           '(("Switch to buffer" . switch-to-buffer)
             ("Switch to buffer other window" . switch-to-buffer-other-window)
             ("Switch to buffer other frame" . switch-to-buffer-other-frame)))
       ,(and (locate-library "elscreen")
             '("Display buffer in Elscreen" . anything-find-buffer-on-elscreen))
       ("Kill Marked buffers" . anything-kill-marked-buffers)
       ("Kill buffer" . kill-buffer)
       ("View buffer" . view-buffer)
       ("Display buffer"   . display-buffer)
       ("Revert buffer" . anything-revert-buffer)
       ("Revert Marked buffers" . anything-revert-marked-buffers)
       ("Insert buffer" . insert-buffer)
       ("Diff with file" . diff-buffer-with-file)
       ("Ediff Marked buffers" . anything-ediff-marked-buffers)
       ("Ediff Merge marked buffers" . (lambda (candidate)
                                         (anything-ediff-marked-buffers candidate t))))
      (persistent-help . "Show this buffer")
      (candidate-transformer anything-c-skip-current-buffer anything-c-skip-boring-buffers))
    "Buffer or buffer name.")
  (reload-anything-source)
  )

;;;###autoload
(defun reload-anything-source () ;[2013/11/26]
  ""
  (interactive)
  (setq anything-sources (list
                          anything-c-source-buffers-list
                          anything-c-source-bookmarks
                          anything-c-source-files-in-current-dir+
                          anything-c-source-file-cache
                          anything-c-source-recentf
                          anything-c-source-find-file)))

;;;###autoload
(defun anything-mode-map-predefine ()
  "For anything key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"anything\" keymaping.."))
  (define-many-keys anything-map
    ("\C-l"     'forward-char)
    ("\C-j"     'backward-char)
    ("\C-\M-n"  'anything-next-page)
    ("\M-n"     'anything-next-source)
    ("\C-k"     'anything-previous-line)
    ("\C-\M-k"  'anything-previous-page)
    ("\C-b"     'anything-end-of-buffer)
    ("\M-k"     'anything-previous-source)
    ([33554464] 'anything-prev-visible-mark)   ;(kbd S-SPC)
    ("\C-p"     'anything-beginning-of-buffer)
    ("\C-c\C-k" 'anything-kill-marked-buffers)
    ("\C-\M-k" 'anything-kill-marked-buffers)
    ("\C-e"     'anything-execute-persistent-action)
    ("\M-@"     'anything-mark-all)))

;;;###autoload
(defun anything-mode-face-predefine ()
  "For anything face."
  (message "eval-after-load: \"anything\" Setting faces..")
  (face-spec-set 'anything-M-x-key-face '((t (:foreground "orange" :underline t))))
  (face-spec-set 'anything-apt-deinstalled '((t (:foreground "DimGray"))))
  (face-spec-set 'anything-apt-installed '((t (:foreground "green"))))
  (face-spec-set 'anything-bmkext-file '((t (:foreground "Deepskyblue2"))))
  (face-spec-set 'anything-bmkext-gnus '((t (:foreground "magenta"))))
  (face-spec-set 'anything-bmkext-info '((t (:foreground "green"))))
  (face-spec-set 'anything-bmkext-man '((t (:foreground "Orange4"))))
  (face-spec-set 'anything-bmkext-no--file '((t (:foreground "grey"))))
  (face-spec-set 'anything-bmkext-w3m '((t (:foreground "yellow"))))
  (face-spec-set 'anything-bookmarks-su-face '((t (:foreground "red"))))
  (face-spec-set 'anything-buffer-saved-out '((t (:foreground "yellow"))))
  (face-spec-set 'anything-buffer-not-saved '((t (:foreground "yellow"))))
  (face-spec-set 'anything-candidate-number
                 '((t (:background "Yellow" :foreground "black"))))
  (face-spec-set 'anything-dir-name-face '((t (:foreground "DodgerBlue1"))))
  (face-spec-set 'anything-emms-playlist
                 '((t (:foreground "Springgreen4" :underline t))))
  (face-spec-set 'anything-ff-directory
                 '((t (:foreground "green" :background nil))))
  (face-spec-set 'anything-ff-executable
                 '((t (:background nil :foreground "red"))))
  (face-spec-set 'anything-ff-file '((t (:foreground "white"))))
  (face-spec-set 'anything-ff-invalid-symlink
                 '((t (:background "red" :foreground "black"))))
  (face-spec-set 'anything-ff-prefix
                 '((t (:background "yellow" :foreground "black"))))
  (face-spec-set 'anything-ff-symlink '((t (:foreground "DarkOrange"))))
  (face-spec-set 'anything-file-name-face '((t (:foreground "aquamarine3"))))
  (face-spec-set 'anything-gentoo-match-face '((t (:foreground "red"))))
  (face-spec-set 'anything-grep-file
                 '((t (:foreground "BlueViolet" :underline t))))
  (face-spec-set 'anything-grep-finish '((t (:foreground "Green"))))
  (face-spec-set 'anything-grep-lineno '((t (:foreground "Darkorange1"))))
  (face-spec-set 'anything-grep-match '((t (:inherit match))))
  (face-spec-set 'anything-grep-running '((t (:foreground "Red"))))
  (face-spec-set 'anything-header '((t (:inherit header-line))))
  ;; (face-spec-set 'anything-lisp-completion-info '((t (:foreground "red"))))
  (face-spec-set 'anything-lisp-show-completion
                 '((t (:background "DarkSlateGray"))))
  (face-spec-set 'anything-match '((t (:inherit match))))
  (face-spec-set 'anything-overlay-line-face
                 '((t (:background "IndianRed4" :underline t))))
  (face-spec-set 'anything-w3m-bookmarks-face
                 '((t (:foreground "cyan1" :underline t))))
  ;; (face-spec-set 'anything-visible-mark
  ;; '((((min-colors 88) (background dark)) (:background "Red"))))
  (face-spec-set 'header-line
                 '((t (:bold t :background "gray20" :foreground "lawngreen")))))

;;;###autoload
(defun my-anything-edit ()
  "My anything for edit.
`anything-c-source-kill-ring', `anything-c-source-yasnippet'"
  (interactive)
  (anything
   :sources '(anything-c-source-kill-ring
			  anything-c-source-yasnippet)
   :buffer "*anything my edit*"))

;;;###autoload
(defun anything-my-elisp ()
  "My anything for elisp.
`anything-c-source-emacs-functions', `anything-c-source-emacs-variables'."
  (interactive)
  (anything
   :sources '(anything-c-source-emacs-functions
			  anything-c-source-emacs-variables
			  )
   :buffer "*anything my elisp*"))



(provide 'anything_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; anything_plugin_start.el ends here
