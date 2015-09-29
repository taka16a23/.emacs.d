;;; 40_highlight-indentation_plugin_start.el --- start for highlight-indentation
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/10/17 16:18:49 (+0900)
;; Last-Updated: 2013/11/01 23:25:46 (+0900)
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
;; 2013/10/17    Atami
;;    initialize:
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro"))

(defvar highlight-indentation-eval-after-load-hook nil
  "Hook for highlight-indentation `eval-after-load'.")
(add-hook 'highlight-indentation-eval-after-load-hook
          'highlight-indentation-mode-predefine 'append)
(add-hook 'highlight-indentation-eval-after-load-hook
          'highlight-indentation-mode-face-predefine 'append)
(run-hooks-after-load "highlight-indentation"
                      'highlight-indentation-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 40_highlight-indentation_plugin_start.el ends here
