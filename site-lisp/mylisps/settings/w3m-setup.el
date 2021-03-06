;;; w3m-setup.el ---    Setting for w3m mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:29:12 2012 (+0900)
;; Last-Updated:2015/10/19 16:32:57 (+0900)
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
;; 2012/12/10    Atami
;;    Moved: Moved functions to w3m_mode_start.el
;;    `w3m-mode-hook-predefine', `w3m-mode-predefine'
;;    `w3m-mode-map-predefine', `rand-w3m-view-this-url-background-session'
;;    `w3m-toggle-ja-en-google-url', `w3m-change-google-result-time-range'
;;    `w3m-google-result-year', `w3m-google-result-month'
;;    `w3m-google-result-week', `w3m-google-result-day'
;;    `w3m-google-result-hours', `w3m-new-tab'
;;    `w3m-browse-url-new-tab' ,`my-w3m-forward-seq'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'bind-key)
  (require 'use-package "use-package" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-switch-bind-keys "t1-bind-key")
  (declare-function common-view-map-bind-keys "t1-bind-key")
  (require 'subroutines "subroutines" 'noerr)
  (declare-function windows-p "subroutines")
  (defvar usb-home-dir nil)
  )

(use-package w3m
  ;; :disabled
  :defer
  :ensure t
  :commands
  w3m
  w3m-search
  w3m-find-file
  w3m-browse-url
  w3m-db-history
  w3m-search-new-session
  w3m-goto-url-new-session
  w3m-copy-buffer
  :init
  (t1-switch-bind-keys '(("w" . w3m)
                         ("C-w" . w3m)
                         ))
  :config
  (message "Loading \"w3m\"")
  (custom-set-variables
   '(w3m-home-page "http://www.google.com/")
   '(w3m-fill-column 80)
   '(w3m-use-cookies nil)
   '(w3m-search-default-engine "google-en")
   '(w3m-bookmark-file "~/.w3m/bookmark.html")
   '(w3m-use-favicon nil)
   '(w3m-show-graphic-icons-in-mode-line nil)
   '(w3m-show-graphic-icons-in-header-line nil)
   ;; '(w3m-user-agent "Emacs-w3m/1.4.437 w3m/0.5.2")
   '(browse-url-browser-function 'w3m-browse-url-new-tab))
  (require 'w3m-extension nil 'noerr)
  (require 'w3m-search nil 'noerr)
  (require 'w3m-bookmark nil 'noerr)
  ;; (define-sequential-command seq-w3m-forward
    ;; w3m-end-of-line end-of-window end-of-buffer seq-return)
  (require 'subroutines "subroutines" 'noerr)
  (when (windows-p)
    (setq-default w3m-command (expand-file-name "bin/w3m.exe" usb-home-dir)))
  ;; (default-view-bind-set w3m-mode-map)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (common-view-map-bind-keys w3m-mode-map)
  (bind-keys :map w3m-mode-map
             ("S" . w3m-search-new-session)
             ("\d" . w3m-view-previous-page) ;backspace
             ("M-d" . helm-M-x)
             ("-" . my-w3m-forward-seq)
             ([(control -)] . my-w3m-forward-seq)
             ("o" . rand-w3m-view-this-url-background-session)
             ("w" . rand-w3m-view-this-url-background-session)
             ("@" . w3m-delete-buffer)
             ("q" . w3m-delete-buffer)
             ;; ("c" . w3m-view-this-url)
             ("c" . my-w3m-next-buffer)
             ("." . my-w3m-next-buffer)
             ("," . my-w3m-previous-buffer)
             ([67108910] . w3m-tab-move-right) ;(kbd "C-.")
             ([67108908] . w3m-tab-move-left) ;(kbd "C-,")
             (">" . w3m-tab-move-right)
             ("<" . w3m-tab-move-left)
             ("x" . my-w3m-next-buffer)
             ("z" . my-w3m-previous-buffer)
             ("t" . my-w3m-go-home-page)
             ("F" . w3m-view-url-with-external-browser)
             ("O" . w3m-view-this-url-new-session)
             ("W" . w3m-view-this-url-new-session)
             ([backspace] . w3m-view-previous-page) ;(kbd "<backspace>")
             ("C-r" . w3m-reload-this-page)
             ("C-m" . w3m-view-this-url)
             ("D" . w3m-download-this-url)
             ("H" . w3m-history)
             ("~" . w3m-gohome)
             ;; Image
             (";" . w3m-zoom-in-image)
             ("+" . w3m-zoom-out-image)
             ("I" . w3m-toggle-inline-images)
             ;; Bookmark
             ("B" . nil)
             ("B B" . w3m-bookmark-view-new-session)
             ("B a" . w3m-bookmark-add-current-url)
             ;; google result page command
             ("G" . nil)
             ("G j" . w3m-toggle-ja-en-google-url)
             ("G y" . w3m-google-result-year)
             ("G m" . w3m-google-result-month)
             ("G w" . w3m-google-result-week)
             ("G d" . w3m-google-result-day)
             ("G h" . w3m-google-result-hours)
             ([67108909] . my-w3m-forward-seq))
  :bind
  (("C-x w s" . w3m-search-new-session)
   ("C-x w C-s" . w3m-search)
   ("C-x w f" . w3m-find-file)
   ("C-x w u" . w3m-goto-url-new-session)
   ("C-x w h" . w3m-db-history)
   ("C-x w w" . w3m)
   ;; ("C-x w b" . helm-w3m-bookmarks)
   )
  )

(defun rand-w3m-view-this-url-background-session ()
  (interactive)
  (let ((in-background-state w3m-new-session-in-background))
    (setq w3m-new-session-in-background t)
    (w3m-view-this-url-new-session)
    (setq w3m-new-session-in-background in-background-state)))

;;;; w3m toggle language google en <=> ja ;[2012/09/20]
;;
(defun w3m-toggle-ja-en-google-url ()
  "Toggle language google result 'en' <=> 'ja'."
  (interactive)
  (if w3m-current-url
      (let* ((en   "hl=en")
			 (ja    "hl=ja")
			 (lr    "&lr=lang_")
			 (lren (concat lr "en"))
			 (lrja (concat lr "ja"))
			 (url w3m-current-url))
		(cond ((or (string-match en url)
				   (string-match lren url))
			   (let* ((url (replace-regexp-in-string en ja url))
					  (url (replace-regexp-in-string lren lrja url))
					  (url (if (not (string-match lr url)) (concat url lrja) url)))
				 (w3m-goto-url url)))
			  ((or (string-match ja url)
				   (string-match lrja url))
			   (let* ((url (replace-regexp-in-string ja en url))
					  (url (replace-regexp-in-string lrja lren url)))
				 (w3m-goto-url url)))
			  (t (message "error"))))
    (w3m-message "No URL")))

;;;; w3m google result time range ;[2012/09/21]
;;
(defun w3m-change-google-result-time-range (c)
  (if w3m-current-url
      (if (string-match "search\\?q=\\|google" w3m-current-url)
		  (if (string-match "qdr:" w3m-current-url)
			  (let ((range (concat "qdr:" c)))
				(w3m-goto-url (replace-regexp-in-string "qdr:." range w3m-current-url)))
			(if (string-match "&tbs=" w3m-current-url)
				(w3m-goto-url (replace-regexp-in-string "&tbs=" (concat "&tbs=qdr:" c ",") w3m-current-url))
			  (w3m-goto-url (concat w3m-current-url "&tbs=qdr:" c))))
		(message "w3m error: Not google result page."))
    (w3m-message "No URL")))

(defun w3m-google-result-year ()
  (interactive)
  (w3m-change-google-result-time-range "y"))

(defun w3m-google-result-month ()
  (interactive)
  (w3m-change-google-result-time-range "m"))

(defun w3m-google-result-week ()
  (interactive)
  (w3m-change-google-result-time-range "w"))

(defun w3m-google-result-day ()
  (interactive)
  (w3m-change-google-result-time-range "d"))

(defun w3m-google-result-hours ()
  (interactive)
  (w3m-change-google-result-time-range "h"))

(defun w3m-new-tab ()
  (interactive)
  (w3m-copy-buffer nil nil nil t))

;;;###autoload
(defun w3m-browse-url-new-tab (url &optional new-session)
  (interactive)
  (w3m-new-tab)
  (w3m-browse-url url))

(defun my-w3m-forward-seq ()
  "Sequential move for w3m."
  (interactive)
  (save-window-excursion
	(w3m-end-of-line)
	(skip-chars-backward " \t")))

(defsubst my-w3m-next-buffer ()
  (interactive)
  (w3m-next-buffer 1))

(defsubst my-w3m-previous-buffer ()
  (interactive)
  (w3m-next-buffer -1))

(defsubst my-w3m-go-home-page ()
  (interactive)
  (w3m-goto-url-new-session w3m-home-page))



(provide 'w3m-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; w3m-setup.el ends here
