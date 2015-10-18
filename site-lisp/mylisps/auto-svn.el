;;; auto-svn.el --- my auto svn for commandline
;;
;; Copyright (C) 2014 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2014/03/24 05:35:37 (+0900)
;; Last-Updated: 2015/08/28 16:28:18 (+0900)
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
;;  auto svn for commandline
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


;; pylib
;;;###autoload
(defun svn-status-pylib () ;[2014/01/18]
  ""
  (interactive)
  (setq frame-title-format "svn_pylib")
  (force-mode-line-update)
  (svn-status "~/.pylib"))


;; .emacs.d
;;;###autoload
(defun svn-status-emacsd () ;[2014/01/18]
  ""
  (interactive)
  (setq frame-title-format "svn_emacsd")
  (force-mode-line-update)
  (svn-status "~/.emacs.d"))

;; .zsh
;;;###autoload
(defun svn-status-zsh () ;[2015/08/28]
  ""
  (interactive)
  (setq frame-title-format "svn_zsh")
  (force-mode-line-update)
  (svn-status "~/.zsh"))



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-svn.el ends here
