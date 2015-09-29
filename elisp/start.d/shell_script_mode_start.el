;;; shell_script_mode_start.el --- function for shell script mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 20:05:50 2012 (+0900)
;; Last-Updated: 2015/09/16 22:56:14 (+0900)
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
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'smartchr "smartchr" 'noerr)
  (require 'sh-script "sh-script" 'noerr))

;;;###autoload
(defun sh-script-mode-custom-predefine ()
  "For `eval-after-load' sh-script customize."
  (message "eval-after-load: \"sh-script\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun sh-script-mode-predefine ()
  "For `eval-after-load' sh-script function."
  (message "eval-after-load: \"sh-script\" setting..")
  (add-hook 'sh-mode-hook 'sh-mode-hook-predefine)
  )

;;;###autoload
(defun sh-script-mode-map-predefine ()
  "For sh-script key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"sh-script\" keymaping.."))
  (define-many-keys sh-mode-map
	("\"" (smartchr '("\"`!!'\"" "\"" "\"\"`!!'\"\"" "\"")))
	("{"  (smartchr '("{`!!'}" "{" "{{`!!'}}" "{")))
	("("  (smartchr '("(`!!')" "(" "((`!!'))" "(")))
	("["  (smartchr '("[`!!']" "[" "[[`!!']]" "[")))
	("\C-m" 'reindent-then-newline-and-indent)
	))

;;;###autoload
(defun sh-script-mode-face-predefine ()
  "For sh-script face."
  (message "eval-after-load: \"sh-script\" Setting faces..")
  )

;;;###autoload
(defun sh-mode-hook-predefine ()
  "Shell mode hook."
  (add-hook 'write-file-hooks 'delete-trailing-whitespace 'append 'local)
  (add-hook 'write-file-hooks 'delete-trailing-blank-lines 'append 'local)
  ;; (remove-hook 'write-file-hooks 'delete-trailing-whitespace 'local)
  ;; (remove-hook 'write-file-hooks 'delete-trailing-blank-lines 'local)
  (set-buffer-file-coding-system 'unix)
  (set-buffer-modified-p nil)
  )



(provide 'shell_script_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; shell_script_mode_start.el ends here
