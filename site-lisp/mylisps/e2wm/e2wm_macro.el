;;; e2wm_macro.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/01 12:37:41 (+0900)
;; Last-Updated: 2015/10/01 12:38:58 (+0900)
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


(require 'e2wm "e2wm" 'noerr)

(defmacro defe2wm:pst-change (dpname)
  "Macro to create e2wm pst-change command."
  `(defun ,(intern (concat "e2wm:dp-" (symbol-name dpname))) ()
     (interactive)
     (e2wm:pst-change ',dpname)))

;;;; navi command
;;
(defmacro defe2wm:navi-simple-command (winname) ;[2013/11/29]
  "Macro to create e2wm navigation command."
  `(defun ,(intern (concat "e2wm:navi-" (symbol-name winname) "-command")) ()
     (interactive)
     (e2wm:pst-window-select ',winname)))

(defmacro defe2wm:navi&show-command (winname) ;[2013/11/29]
  "Macro to create e2wm show and navigation command."
  `(defun ,(intern (concat "e2wm:navi-" (symbol-name winname) "-command")) ()
     (interactive)
     (let ((wm (e2wm:pst-get-wm))
           (winfo-name ',winname))
       (unless (wlf:window-shown-p
                (wlf:get-winfo winfo-name (wlf:wset-winfo-list wm)))
         (wlf:show wm winfo-name))
       (wlf:select wm winfo-name)
       (e2wm:pst-update-windows))))

;;;; display command
;;
(defmacro defe2wm:win-command (action pstname)
  "Macro to create e2wm show command."
  `(defun ,(intern
            (concat "e2wm:"
                    (symbol-name action) "-"
                    (symbol-name pstname) "-command")) ()
     (interactive)
     (,(intern (concat "wlf:" (symbol-name action)))
      (e2wm:pst-get-wm) ',pstname)
     (e2wm:pst-update-windows)))



(provide 'e2wm_macro)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm_macro.el ends here
