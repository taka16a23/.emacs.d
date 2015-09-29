;;; w3m_mode_start.el --- function for W3m mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.1
;; Created:      Mon Dec 10 21:31:39 2012 (+0900)
;; Last-Updated: 2013/12/07 01:05:48 (+0900)
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
;; 2013/09/10    Atami
;;    Added: `my-w3m-next-buffer', `my-w3m-previous-buffer'
;;    `my-w3m-go-home-page' from lambda functions.
;;
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro nil 'noerror)
  (require 'sequential-command "sequential-command" 'noerr)
  (require 'w3m "w3m" 'noerr)
  (defalias 'w3m-setup-menu 'ignore) ; temp
  )

;;;###autoload
(defun w3m-mode-hook-predefine ()
  )

;;;###autoload
(defun w3m-mode-custom-predefine ()
  "For `eval-after-load' w3m customize."
  (message "eval-after-load: \"w3m\" customizing..")
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
  )

;;;###autoload
(defun w3m-mode-predefine ()
  "For `eval-after-load' w3m function."
  (message "eval-after-load: \"w3m\" setting..")
  (require 'w3m-extension nil 'noerr)
  (require 'w3m-search nil 'noerr)
  (require 'w3m-bookmark nil 'noerr)
  (add-hook 'w3m-mode-hook 'w3m-mode-hook-predefine)
  (define-sequential-command seq-w3m-forward
    w3m-end-of-line end-of-window end-of-buffer seq-return)
  (when (windows-p)
    (setq-default w3m-command (expand-file-name "bin/w3m.exe" usb-home-dir))))

;;;###autoload
(defun w3m-mode-map-predefine ()
  "For w3m key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"w3m\" keymaping.."))
  (default-view-bind-set w3m-mode-map)
  (define-many-keys w3m-mode-map
    ("S"           'w3m-search-new-session)
    ("\d"          'w3m-view-previous-page) ;backspace
    ("\M-d"        'anything-M-x)
    ("-"           'my-w3m-forward-seq)
    ([(control -)] 'my-w3m-forward-seq)
    ("o"           'rand-w3m-view-this-url-background-session)
    ("w"           'rand-w3m-view-this-url-background-session)
    ("@"           'w3m-delete-buffer)
    ("q"           'w3m-delete-buffer)
    ;; ("c"           'w3m-view-this-url)
    ("c"           'my-w3m-next-buffer)
    ("."           'my-w3m-next-buffer)
    (","           'my-w3m-previous-buffer)
    ([67108910]    'w3m-tab-move-right) ;(kbd "C-.")
    ([67108908]    'w3m-tab-move-left) ;(kbd "C-,")
    (">"           'w3m-tab-move-right)
    ("<"           'w3m-tab-move-left)
    ("x"           'my-w3m-next-buffer)
    ("z"           'my-w3m-previous-buffer)
    ("t"           'my-w3m-go-home-page)
    ("F"           'w3m-view-url-with-external-browser)
    ("O"           'w3m-view-this-url-new-session)
    ("W"           'w3m-view-this-url-new-session)
    ([backspace]   'w3m-view-previous-page) ;(kbd "<backspace>")
    ("\C-r"        'w3m-reload-this-page)
    ("\C-m"        'w3m-view-this-url)
    ("D"           'w3m-download-this-url)
    ("H"           'w3m-history)
    ("~"           'w3m-gohome)
    ;; Image
    (";"           'w3m-zoom-in-image)
    ("+"           'w3m-zoom-out-image)
    ("I"           'w3m-toggle-inline-images)
    ;; Bookmark
    ("B"           'nil)
    ("BB"          'w3m-bookmark-view-new-session)
    ("Ba"          'w3m-bookmark-add-current-url)
    ;; google result page command
    ("G"           'nil)
    ("Gj"          'w3m-toggle-ja-en-google-url)
    ("Gy"          'w3m-google-result-year)
    ("Gm"          'w3m-google-result-month)
    ("Gw"          'w3m-google-result-week)
    ("Gd"          'w3m-google-result-day)
    ("Gh"          'w3m-google-result-hours)
    ([67108909]    'my-w3m-forward-seq)
    ))

;;;###autoload
(defun w3m-mode-face-predefine ()
  "For w3m face."
  (message "eval-after-load: \"w3m\" Setting faces..")
  )

;;;###autoload
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

(autoload 'w3m-copy-buffer "w3m")

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



(provide 'w3m_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; w3m_mode_start.el ends here
