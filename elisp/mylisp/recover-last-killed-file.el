;; -*- Mode: Emacs-Lisp -*-

;;; recover-last-killed-file.el --- recover last killed file buffer
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 21:25:38 2012 (+0900)
;; Last-Updated: Wed Dec 12 21:27:08 2012 (+0900)
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
;; 2012/12/12    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defvar last-killed-file nil)

;;;###autoload
(defun set-last-killed-file ()
  (when (buffer-file-name)
    (setq last-killed-file (expand-file-name (buffer-file-name)))))

;;;###autoload
(defun get-last-killed-file ()
  (interactive)
  (unless (null last-killed-file)
    (find-file last-killed-file)))


(provide 'recover-last-killed-file)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; recover-last-killed-file.el ends here
