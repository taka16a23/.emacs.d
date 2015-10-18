;;; auto-install-ext.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/12 11:46:21 (+0900)
;; Last-Updated:2015/10/12 11:47:10 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


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



(provide 'auto-install-ext)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-install-ext.el ends here
