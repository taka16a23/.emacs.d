;;; 30_check_misspell_plugin_start.el --- Setting for check-misspell
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 16:21:40 2012 (+0900)
;; Last-Updated: 2013/11/01 18:34:20 (+0900)
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
;; 2013/01/27    Atami
;;    Fixed: `typemiss-list'
;;    `setq' to `setq-default'
;;
;; 2012/12/12    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  (require 'check-misspell "check-misspell" 'noerr)
  )

(add-hook 'before-save-hook 'check-misspell)

;;;###autoload
(defun check-misspell-mode-predefine ()
  "For `eval-after-load' check-misspell function."
  (message "eval-after-load: \"check-misspell\" setting..")
  (setq-default typemiss-list '( ("eamcs"              . "emacs")
                                 ("defualt"            . "default")
                                 ("formart"            . "format")
                                 ("pyhton"             . "python")
                                 ("\\_<\\(ture\\)\\_>" . "true")
                                 ("windwos"            . "windows")))
  )

(defvar check-misspell-eval-after-load-hook nil
  "Hook for check-misspell `eval-after-load'.")
(add-hook 'check-misspell-eval-after-load-hook
          'check-misspell-mode-predefine 'append)
(run-hooks-after-load "check-misspell" 'check-misspell-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; no-check-type-miss: t
;; End:
;;; 30_check_misspell_plugin_start.el ends here
