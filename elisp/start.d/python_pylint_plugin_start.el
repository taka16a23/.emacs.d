;;; python_pylint_plugin_start.el --- setting for python-pylint
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 05:20:38 (+0900)
;; Last-Updated: 2013/11/02 05:21:16 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defun python-pylint-mode-custom-predefine ()
  "For `eval-after-load' python-pylint customize."
  (message "eval-after-load: \"python-pylint\" customizing..")
  ;; options
  ;; -r <y_or_n>, --reports=<y_or_n>
  ;; -f <format>, --output-format=<format>
  (custom-set-variables
   '(python-pylint-options '("-ry -f parseable")))
  (when (windows-p)
    (custom-set-variables
     '(python-pylint-command "pylint.bat")))
  )

;;;###autoload
(defun python-pylint-mode-predefine ()
  "For `eval-after-load' python-pylint function."
  (message "eval-after-load: \"python-pylint\" setting..")
  )


(provide 'python_pylint_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python_pylint_plugin_start.el ends here
