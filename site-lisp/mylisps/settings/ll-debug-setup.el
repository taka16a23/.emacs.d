;;; ll-debug-setup.el ---    ll debug
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:00 2012 (+0900)
;; Last-Updated:2015/10/21 04:33:57 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-ctl-x-bind-keys "t1-bind-key"))

;;;; if last-command equal 'yank' then comment or uncomment region
(defun my-ll-debug-toggle-comment-region-or-line ()
  ""
  (interactive)
  (if (eq last-command 'yank)
      (if (save-excursion
            (goto-char (region-beginning))
            (ll-debug-region-or-line-comment-start))
          (ll-debug-uncomment-region (region-beginning) (region-end))
        (comment-region (region-beginning) (region-end))))
  (ll-debug-toggle-comment-region-or-line))

(use-package ll-debug
  ;; :disabled
  ;; :defer
  :commands
  (ll-debug-region-or-line-comment-start
   ll-debug-uncomment-region
   ll-debug-insert
   ll-debug-toggle-comment-region-or-line
   ll-debug-revert
   ll-debug-register-mode
   )
  :init
  (bind-key "C-o" 'my-ll-debug-toggle-comment-region-or-line)
  ;; (t1-ctl-x-bind-keys
   ;; '(("C-o" . my-ll-debug-toggle-comment-region-or-line)))
  :config
  (message "Loading \"ll-debug\"")
  (ll-debug-register-mode 'python-mode
                          "print(" ")"
                          '(nil "'" (ll-debug-create-next-debug-string) "'")
                          '(nil "'" (ll-debug-create-next-debug-string)
                                ("Variable name: "
                                 "  " str ":%s"
                                 '(progn (setq v1 (concat v1 " " str)) nil))
                                "' %" v1))
  :bind
  (("M-o" . ll-debug-insert)
   ("C-x M-o" . ll-debug-revert)
   )
  )

(defun t1-py-delete-debug-print ()
  "delete-debug-print"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "print('.*\\[[[:digit:]]*\\].*#.*Debug" nil 'noerror)
      (kill-whole-line)
      )))



(provide 'll-debug-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; ll-debug-setup.el ends here
