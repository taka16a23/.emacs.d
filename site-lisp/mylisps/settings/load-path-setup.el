;;; load-path-setup.el --- 
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/10 18:48:52 (+0900)
;; Last-Updated:2015/10/13 17:28:01 (+0900)
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


(require 'environment-setup "environment-setup" 'noerr)

(let* ((top-dir (my-site-lisp-dir-get))
       (default-directory top-dir))
  (unless (member top-dir load-path)
    (setq load-path (cons top-dir load-path))
    (normal-top-level-add-subdirs-to-load-path)))

(let* ((top-dir (my-inits-dir-get))
       (default-directory top-dir))
  (unless (member top-dir load-path)
    (setq load-path (cons top-dir load-path))
    (normal-top-level-add-subdirs-to-load-path)))

(setq load-path (delete-dups load-path))



(provide 'load-path-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; load-path-setup.el ends here

