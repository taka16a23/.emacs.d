;;; auto-install_plugin_start.el --- functions for auto-install
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 00:41:59 2012 (+0900)
;; Last-Updated: 2013/11/01 17:34:11 (+0900)
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
  (require 'auto-install "auto-install" 'noerr)
  (require 'anything-auto-install "anything-auto-install" 'noerr))

;;;###autoload
(defun auto-install-mode-custom-predefine ()
  "For `eval-after-load' auto-install customize."
  (message "eval-after-load: \"auto-install\" customizing..")
  (custom-set-variables
   '(auto-install-directory my-plugin-dir)
   '(auto-install-replace-confirm t)))

;;;###autoload
(defun auto-install-mode-predefine ()
  "For `eval-after-load' auto-install function."
  (message "eval-after-load: \"auto-install\" setting..")
  (auto-install-compatibility-setup))

;;;###autoload
(defun auto-install-mode-map-predefine ()
  "For auto-install key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"auto-install\" keymaping.."))
  (define-key auto-install-minor-mode-map "\C-c\C-c" 'auto-install-save&erase))

;;;###autoload
(defun auto-install-save&erase ()
  "Auto install erase after save as one command.
`auto-install-buffer-save', `erase-auto-install-buffer'"
  (interactive)
  (auto-install-buffer-save)
  (erase-auto-install-buffer))

;; kill buffer after init
;;;###autoload
(defun auto-install-handle-emacswiki-package-name (download-buffer &optional prompt-install)
  "Handle elisp package name from `EmacsWiki'.
DOWNLOAD-BUFFER is the name of download buffer.
PROMPT-INSTALL is non-nil, will prompt package name for install."
  ;;  (y-or-n-p (format "%s" auto-install-download-buffer))
  (kill-buffer auto-install-download-buffer) ;; add
  ;; Update package name list.
  (auto-install-update-emacswiki-package-list download-buffer)
  ;; Prompt package name for install.
  (when prompt-install
	(auto-install-download
	 (concat auto-install-emacswiki-base-url
			 (auto-install-get-candidate "Package" auto-install-package-name-list)))))

;; kill buffer "*auto-install..."
;;;###autoload
(defun erase-auto-install-buffer ()
  (dolist (buf (buffer-list))
	(if (eq (string-match "^\\*auto-install " (buffer-name buf)) 0)
		(progn
		  (kill-buffer buf)))))

;;;###autoload
(defun auto-install-download-by-wget (url handle-function download-buffer)
  (with-current-buffer download-buffer
    (setq auto-install-download-buffer
          (get-buffer-create (concat (buffer-name download-buffer) "-wget"))
          auto-install-download-url url)
    (set-process-sentinel
     (start-process "auto-install-wget" (current-buffer)
                    auto-install-wget-command "-q" "-O-"
                    (if (windows-p) "" "--no-check-certificate")url)
     (lexical-let ((handle-function handle-function))
       (lambda (proc stat)
         (auto-install-download-callback-continue
          (buffer-name (process-buffer proc))
          handle-function))))))


;;;; anything auto install
;;
;;;###autoload
(defun anything-auto-install-mode-predefine ()
  "For `eval-after-load' anything-auto-install function."
  (message "eval-after-load: \"anything-auto-install\" setting..")
  (when (auto-install-update-emacswiki-package-name t)
    (with-current-buffer "*Messages*"
      (save-excursion
        (goto-char (point-min))
        (let ((sec 0))
          (while (and
                  (not
                   (search-forward
                    "Update package name from `EmacsWiki' successful." nil t))
                  (>= 10 sec))
            (setq sec (1+ sec))
            (sit-for 1)
            ))))))



(provide 'auto-install_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-install_plugin_start.el ends here
