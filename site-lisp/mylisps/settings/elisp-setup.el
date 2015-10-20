;;; elisp-setup.el ---     Setting for Emacs Lisp mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:19 2012 (+0900)
;; Last-Updated:2015/10/21 02:09:39 (+0900)
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
;; 2013/09/15    Atami
;;    Remove: `minimap-sync-overlays' in `my-make-scratch'
;;
;; 2013/02/27    Atami
;;    Fixed: `my-make-scratch'
;;    error raise (error "No buffer named *MINIMAP*  *Compiler Input*")
;;    by eval minimap-sync-overlays on `hs-show-hook'
;;    escape `minimap-sync-overlays' from hs-show-hook by `let'
;;
;; 2013/01/27    Atami
;;    Add: defined key "`" char.
;;    "`" => "`'" => "``"
;;
;; 2013/01/24    Atami
;;    Modified: Keybinding
;;    `find-function-at-point' "\C-cf" => "\C-cg"
;;    `anything-imenu' "\C-i" => "\C-cj" : Added "\C-c\C-j"
;;
;; 2012/12/10    Atami
;;    Moved: Moved functions to Emacs_Lisp_mode_start.el
;;    `my-find-tag', `right-parentheses-indent'
;;    `emacs-lisp-mode-hook-predefine', `my-make-scratch'
;;    `lisp-interaction-mode-hook-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(require 'init-loader "init-loader" 'noerr)
(require 'environment-setup "environment-setup" 'noerr)
(init-loader-load (my-inits-dir-join "elisp"))



(provide 'elisp-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; elisp-setup.el ends here

