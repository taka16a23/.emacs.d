;;; Emacs_Lisp_mode_start.el --- functions for Emacs Lisp mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 19:48:23 2012 (+0900)
;; Last-Updated: 2015/09/26 00:50:45 (+0900)
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
;; 2015/07/25    Atami
;;    Modified: `emacs-lisp-mode-hook-predefine'
;;    `rotate-text-rotations' add-to-list ("car" "cdr")
;;
;; 2013/03/07    Atami
;;    Modified: `emacs-lisp-mode-hook-predefine'
;;    check `during-init-p'
;;    for avoid error ac-sources raise void-variable when init
;;
;; 2013/02/14    Atami
;;    Add: functions `toggle-let-astah-search-let', `toggle-let-astah'
;;
;; 2013/02/06    Atami
;;    Add: value to `rotate-text-rotations'
;;    "message" "princ"
;;
;; 2013/01/27    Atami
;;    Modified: `emacs-lisp-mode-hook-predefine'
;;    add-to-list rotate-text-rotations ("t" "nil")
;;
;; 2012/12/12    Atami
;;    Fixed: `my-make-scratch' scratch log.
;;
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (defvar during-init-p)
  (require 'subroutines_start nil 'noerror)
  (require 'auto-complete nil 'noerr))

;;;###autoload
(defun emacs-lisp-mode-hook-predefine ()
  "For `eval-after-load' Emacs Lisp mode function."
  ;; (turn-on-eldoc-mode)
  ;; (hs-minor-mode 1)
  (add-hook 'write-file-hooks 'delete-trailing-whitespace 'append 'local)
  (add-hook 'write-file-hooks 'delete-trailing-blank-lines 'append 'local)
  ;; (remove-hook 'write-file-hooks 'delete-trailing-whitespace 'local)
  ;; (remove-hook 'write-file-hooks 'delete-trailing-blank-lines 'local)
  (when (and buffer-file-name
             (not (re-in-string "\\.junk\\." buffer-file-name))
             (not inhibit-read-only))
    (flycheck-mode 1))
  (unless during-init-p
    (unless (boundp 'ac-sources)
      (require 'auto-complete "auto-complete" 'noerr))
    ;; (setq ac-sources (append ac-sources '(ac-emacs-lisp-features
    ;;                                       ac-source-functions
    ;;                                       ac-source-variables
    ;;                                       ac-source-symbols)))
    (add-to-list 'ac-sources '(ac-emacs-lisp-features
                               ac-source-functions
                               ac-source-variables
                               ac-source-symbols)))
  (when during-init-p
    (setq during-init-p nil))
  (add-to-list 'rotate-text-rotations '("t" "nil"))
  (dolist (el '(("t" "nil")
                ("message" "princ")
                ("forward" "backward")
                ("add" "remove")
                ("defvar" "setq")
                ("car" "cdr")))
    (add-to-list 'rotate-text-rotations el))
  )

;;;###autoload
(defun my-find-tag ()
  "In Emacs Lisp mode, one of these functions is called:
`find-library', `find-variable', `find-face-definition',
`find-function' and `find-tag'."
  (interactive)
  (call-interactively
   (let ((symbol (variable-at-point t))
         (variable (variable-at-point))
         (function (function-called-at-point)))
     (cond
      ((or (eq function 'require)
           (eq function 'featurep))
       'find-library)
      ((and (symbolp variable)
            (boundp variable))
       'find-variable)
      ((and (symbolp symbol)
            (facep symbol))
       'find-face-definition)
      ((and (fboundp function)
            (eq symbol function))
       'find-function)
      (t
       'find-tag)))))

;;;; right parentheses and indent
;;;###autoload
(defun right-parentheses-indent (n)
  "Insert right-parentheses then indent.
N"
  (interactive "*p")
  (if mark-active
      (save-excursion
        (let ((start (region-beginning))
              (end (region-end)))
          (deactivate-mark)
          (goto-char end)
          (insert ")")
          (goto-char start)
          (insert "(")))
    (self-insert-command n)
    (indent-for-tab-command)
    ))

;;;; scratch
;;
;;;###autoload
(defun lisp-interaction-mode-hook-predefine ()
  "Lisp interaction mode hook predefine."
  ;; (turn-on-eldoc-mode)
  ;; (flycheck-mode -1)
  ;; (hs-minor-mode 1)
  ;; (load-scratch-auto-complete)

  ;; modeline
  (setq mode-line-format
		'("%e"
		  mode-line-position
		  ",P"
		  (:eval (format "%4d" (point)))
		  " "
		  "%z"   ;mode-line-mule-info
		  " "
		  mode-line-buffer-identification
		  " "
		  "%*"   ;mode-line-modified
		  "%2@"  ;mode-line-remote
		  mode-name
		  ))
  )

;;;###autoload
(defun after-init-load-ac-sources-lisp-interaction ()
  ""
  (if (boundp 'ac-sources)
      (with-current-buffer "*scratch*"
        (setq ac-sources (append ac-sources '(ac-emacs-lisp-features
                                              ac-source-functions
                                              ac-source-variables
                                              ac-source-symbols))))
    (message "Not loaded ac-sources on lisp interaction.")))


;;;###autoload
(defun load-scratch-auto-complete ()
  "Load scratch auto complete."
  (interactive)
  (when (bound-and-true-p auto-complete-mode)
    (message "Loading ac-sources for scratch.")
    (dolist (acs '(ac-emacs-lisp-features
                   ac-source-functions
                   ac-source-variables
                   ac-source-symbols))
      (add-to-list 'ac-sources acs 'append))))

;;;###autoload
(defun scratch-load-ac-sources-after-auto-complete-predefine ()
  "Load ac-sources after load auto-complete."
  (save-window-excursion
    (if (get-buffer "*scratch*")
        (switch-to-buffer "*scratch*"))
    (load-scratch-auto-complete))
  )

;;;###autoload
(defvar idle-lisp-interaction-mode-hook-predefine-flag nil)

;;;; toggle let <=> let*
;; http://d.hatena.ne.jp/kiwanami/20110224/1298526678
;;;###autoload
(defun toggle-let-astah-search-let ()
  (save-excursion
    (let ((point-min (point-min))
          (re        "(\\(lexical-\\)?let\\(\\*\\)?")
          (continue  t) pos ast ret)
      (while (and continue (/= (point-min) (point)))
        (goto-char (or (ignore-errors (scan-lists (point) -1 1))
                       (point-min)))
        (save-excursion
          (when (and (looking-at re) (re-search-forward re nil t))
            (setq pos (match-end 0)
                  ast (match-string 2))
            (unless (ignore-errors (scan-lists (point) 1 0))
              (setq ret (cons pos ast)
                    continue nil)))))
      ret)))

;;;###autoload
(defun toggle-let-astah ()
  (interactive)
  (let (replaced (org-pos (point)))
    (save-excursion
      (let ((limit (or (save-excursion
                         (re-search-backward "\\bdef" nil t))
                       (point-min)))
            pair pos ast)
        (save-restriction
          (narrow-to-region limit org-pos)
          (setq pair (toggle-let-astah-search-let)
                pos (car pair) ast (cdr pair))
          (when pos
            (goto-char pos)
            (cond
             (ast (delete-char -1))
             (t (insert "*")))
            (setq replaced t)))))
    (cond
     (replaced (message "toggle let-aster !"))
     (t (message "let not found.")))))



(provide 'Emacs_Lisp_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; Emacs_Lisp_mode_start.el ends here
