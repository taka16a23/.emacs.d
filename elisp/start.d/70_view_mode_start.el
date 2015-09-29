;;; 70_view_mode_start.el --- Setting for view mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:05 2012 (+0900)
;; Last-Updated: 2013/11/02 02:30:30 (+0900)
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
;;    Moved: Moved functions to view_mode_start.el
;;    `turn-off-view-mode', `view-mode-predefine'
;;    `view-mode-map-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro"))

(add-hook 'after-init-hook '(lambda () (require 'viewer "viewer" 'noerr)))
;; (remove-hook 'after-init-hook '(lambda () ))

(defvar view-eval-after-load-hook nil
  "Hook for view `eval-after-load'.")
(add-hook 'view-eval-after-load-hook 'view-mode-custom-predefine)
(add-hook 'view-eval-after-load-hook 'view-mode-predefine 'append)
(add-hook 'view-eval-after-load-hook 'view-mode-map-predefine 'append)
(run-hooks-after-load "view" 'view-eval-after-load-hook)

(defvar viewer-eval-after-load-hook nil
  "Hook for viewer `eval-after-load'.")
(add-hook 'viewer-eval-after-load-hook 'viewer-mode-custom-predefine)
(add-hook 'viewer-eval-after-load-hook 'viewer-mode-predefine 'append)
(add-hook 'viewer-eval-after-load-hook 'viewer-mode-map-predefine 'append)
(add-hook 'viewer-eval-after-load-hook 'viewer-mode-face-predefine 'append)
(run-hooks-after-load "viewer" 'viewer-eval-after-load-hook)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 70_view_mode_start.el ends here
