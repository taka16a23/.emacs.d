;;; 20_recentf_plugin_start.el --- recent file
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:29 2012 (+0900)
;; Last-Updated: 2013/11/01 16:50:33 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (defvar after-init-hook)
  (require 't1macro "t1macro")
  (require 'recentf "recentf" 'noerr))

(autoload 'recentf-track-opened-file "recentf")
(autoload 'recentf-track-opened-file "recentf")
(autoload 'recentf-track-closed-file "recentf")
(autoload 'recentf-save-list "recentf")
(autoload 'recentf-load-list "recentf")

(add-hook 'find-file-hook       'recentf-track-opened-file)
(add-hook 'write-file-functions 'recentf-track-opened-file)
(add-hook 'kill-buffer-hook     'recentf-track-closed-file)
(add-hook 'kill-emacs-hook      'recentf-save-list)
(add-hook 'after-init-hook      'recentf-load-list)

(defvar recentf-eval-after-load-hook nil
  "Hook for recentf `eval-after-load'.")
(add-hook 'recentf-eval-after-load-hook 'recentf-mode-custom-predefine)
(add-hook 'recentf-eval-after-load-hook 'recentf-mode-predefine 'append)
(run-hooks-after-load "recentf" 'recentf-eval-after-load-hook)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 20_recentf_plugin_start.el ends here
