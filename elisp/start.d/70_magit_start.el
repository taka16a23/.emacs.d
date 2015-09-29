;;; 07_magit_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/09/30 08:25:36 (+0900)
;; Last-Updated: 2015/09/30 08:48:14 (+0900)
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
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  (require 'magit "magit/lisp/magit" 'noerr))

(defvar magit-eval-after-load-hook nil
  "Hook for magit `eval-after-load'.")
(add-hook 'magit-eval-after-load-hook 'magit-mode-custom-predefine)
(add-hook 'magit-eval-after-load-hook 'magit-mode-predefine 'append)
(add-hook 'magit-eval-after-load-hook 'magit-mode-map-predefine 'append)
(add-hook 'magit-eval-after-load-hook 'magit-mode-face-predefine 'append)
(run-hooks-after-load "magit" 'magit-eval-after-load-hook)

;;;; with-editor
;;
(defvar with-editor-eval-after-load-hook nil
  "Hook for with-editor `eval-after-load'.")
(add-hook 'with-editor-eval-after-load-hook 'with-editor-mode-custom-predefine)
(add-hook 'with-editor-eval-after-load-hook 'with-editor-mode-predefine 'append)
(add-hook 'with-editor-eval-after-load-hook 'with-editor-mode-map-predefine 'append)
(add-hook 'with-editor-eval-after-load-hook 'with-editor-mode-face-predefine 'append)
(run-hooks-after-load "with-editor" 'with-editor-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 07_magit_start.el ends here
