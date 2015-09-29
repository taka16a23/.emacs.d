;;; 40_col-highlight_plugin_start.el ---  column highlight
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:15 2012 (+0900)
;; Last-Updated: 2013/11/01 23:05:08 (+0900)
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
  (require 't1macro "t1macro"))

(autoload 'column-highlight-mode "col-highlight" nil t)

(defvar col-highlight-eval-after-load-hook nil
  "Hook for col-highlight `eval-after-load'.")
(add-hook 'col-highlight-eval-after-load-hook
          'col-highlight-mode-predefine 'append)
(add-hook 'col-highlight-eval-after-load-hook
          'col-highlight-mode-face-predefine 'append)
(run-hooks-after-load "col-highlight" 'col-highlight-eval-after-load-hook)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 40_col-highlight_plugin_start.el ends here
