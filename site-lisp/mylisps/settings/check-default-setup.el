;;; check-default-setup.el ---   Check default.el and setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:15 2012 (+0900)
;; Last-Updated:2015/10/13 17:41:11 (+0900)
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


;; (eval-when-compile
  ;; (require 'check_default_start))

;; TODO: uniq list
(defvar default-el-setting '(("ni" . t)
							 ))

(when (locate-library "default")
  (let ((predefine nil))
    (dolist (m default-el-setting)
      (when (string= (system-name) (car m))
        (setq inhibit-default-init (cdr m))
        (unless inhibit-default-init (message "Will load default.el"))
        (setq predefine t)))
    ;; if no predefine then prompt
    (unless predefine
      (default-el-prompt))
    ))

(defun default-el-prompt ()
  (save-window-excursion
    (let ((inhibit-read-only t)
          (buf               (get-buffer-create "*default.el*")))
      (pop-to-buffer buf)
      (set (make-local-variable 'cursor-type) nil)
      (erase-buffer)
      (insert "--- Detect default.el !!! ---\n
Setting for default.el\n\n\
y  -- to load default.el
n  -- to ignore
Y  -- to load, and permanently load setting on this system.
N  -- to ignore, and permanently ignore setting on this system.
\n\n")
      (goto-char (point-min))
      (let ((cursor-in-echo-area t)
            (prompt              "Please type y, n, Y, N, or C-v to scroll")
            (exit-chars          '(?y ?n ?Y ?N ?\C-g))
            char
            done)
        (while (not done)
          (message "%s" prompt)
          (setq char (read-event))
          (if (numberp char)
              (cond ((eq             char ?\C-v)
                     (condition-case nil
                         (scroll-up)
                       (error (goto-char (point-min)))))
                    (t (setq done (memq char exit-chars))))))
        (kill-buffer buf)
        (cond ((=    char ?y) (setq inhibit-default-init nil))
              ((= char ?n) (setq inhibit-default-init t))
              ((= char ?Y)
               (setq inhibit-default-init nil)
               (add-to-list 'default-el-setting (cons (system-name) nil))
               (default-el-update-var))
              ((= char ?N)
               (setq inhibit-default-init t)
               (add-to-list 'default-el-setting (cons (system-name) t))
               (default-el-update-var)))))))

;;;###autoload
(defun default-el-update-var ()
  "update 09_check_default_start.el setting variables."
  (let ((before-save-hook nil))
    (with-current-buffer
        (find-file-noselect (my-inits-dir-join "09_check_default_start.el"))
      (goto-char (point-min))
      (search-forward-regexp "^(defvar default-el-setting")
      (goto-char (match-beginning 0))
      (let ((start (point)))
        (delete-region start (save-excursion
                               (forward-list)
                               (point))))
      ;; insert var
      (insert "(defvar default-el-setting '(")
      (dolist (cn default-el-setting)
        (insert "(\"" (car cn) "\" . ")
        (insert (if (eq t (cdr cn)) "t" "nil"))
        (insert ")\n")
        )
      (insert "))\n")
      (let ((end (point)))
        (backward-list)
        (indent-region (point) end))
      (save-buffer)
      (kill-buffer)
      )))



(provide 'check-default-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; check-default-setup.el ends here


