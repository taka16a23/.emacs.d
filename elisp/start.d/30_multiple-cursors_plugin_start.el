;;; 30_multiple-cursors_plugin_start.el --- Setting for multiple-cursors
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.1
;; Created:      Thu Dec 13 00:18:38 2012 (+0900)
;; Last-Updated: 2015/10/04 16:38:34 (+0900)
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
;;  installation: git clone https://github.com/magnars/multiple-cursors.el.git
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;; 1.1 2015/09/19    Atami
;;    Added: el-get bundle
;;
;; 1.0 2012/12/13    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  )


(defvar multiple-cursors-eval-after-load-hook nil
  "Hook for multiple-cursors `eval-after-load'.")
(add-hook 'multiple-cursors-eval-after-load-hook
          'multiple-cursors-mode-predefine 'append)
(add-hook 'multiple-cursors-eval-after-load-hook
          'multiple-cursors-mode-map-predefine 'append)
(run-hooks-after-load "multiple-cursors-core" 'multiple-cursors-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 30_multiple-cursors_plugin_start.el ends here
