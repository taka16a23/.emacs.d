;;; test-setup.el ---   test setting space
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:29:09 2012 (+0900)
;; Last-Updated:2015/10/18 00:42:24 (+0900)
;; Last-Updated: 2015/10/12 21:59:39 (+0900)
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
  (require 'cl "cl" 'noerr)
  (require 'subroutines "subroutines" 'noerr)
  (require 't1macro "t1macro" 'noerr)
  (require 'bind-key "bind-key" 'noerr)
  (require 'bindings-setup "bindings-setup" 'noerr))

(unless (windows-p)
  (defvar usb-drive-letter))

;;;; for debug
;;
(defun debug-on ()
  "Debug mode on."
  (interactive)
  (setq debug-on-error t))

(defun degug-off ()
  "Debug mode off."
  (interactive)
  (setq debug-on-error nil))


;; 透明
;; (set-frame-parameter nil 'alpha '(75 65))
;; (set-frame-parameter nil 'alpha '(100 65))
;; (set-frame-parameter (selected-frame) 'alpha '(70 50))
;; (set-frame-parameter (selected-frame) 'alpha '(100 10))
;; (set-frame-parameter nil 'alpha '80)

;;;; mark-multiple
;;
;; (require 'inline-string-rectangle)
(global-set-key (kbd "s-r") 'inline-string-rectangle)

;;;; for other window
(global-set-key "\C-x\C-o"     'nil)
(global-set-key "\C-x\C-o\C-f" 'find-file-other-window)
(global-set-key "\C-x\C-o\C-r" 'find-file-read-only-other-window)

;;;; reopen as root
;;
(defun file-root-p (filename)
  "Return t if file FILENAME created by root."
  (eq 0 (nth 2 (file-attributes filename))))

(defun change-as-root ()
  "Opens FILE with root privileges."
  (interactive)
  (set-buffer (find-file (concat "/sudo::" buffer-file-name))))
;;
;;;; end


;;;; reverse things
;;
(defun reverse-words (beg end)
  "Reverse the order of words in region.
BEG: start of region
END: end of region"
  (interactive "*r")
  (apply 'insert (reverse (split-string
                           (delete-and-extract-region beg end) "\\b"))))

(defalias 'reverse-line-region 'reverse-region)
;;
;;;;

;; http://www.google.com/url?q=http://stackoverflow.com/questions/6172054/how-can-i-random-sort-lines-in-a-buffer&sa=U&ei=IcjXUOe3EcfDmQWynID4CQ&ved=0CC8QFjAJOAo&usg=AFQjCNEjRUrW_v7iAjaq3MpOoS_1WtwyCA
(defun sort-lines-random (beg end)
  "Sort lines in region randomly.
Argument BEG Region of beggining.
Argument END Region of ending."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr nil 'forward-line 'end-of-line nil nil
                   (lambda (s1 s2) (eq (random 2) 0)))))))

;; http://www.emacswiki.org/emacs/SortWords
(defun sort-words (reverse beg end)
  "Sort words in region alphabetically, in REVERSE if negative.
    Prefixed with negative \\[universal-argument], sorts in reverse.

    The variable `sort-fold-case' determines whether alphabetic case
    affects the sort order.

    See `sort-regexp-fields'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\w+" "\\&" beg end))

(defun sort-symbols (reverse beg end)
  "Sort symbols in region alphabetically, in REVERSE if negative.
    See `sort-words'."
  (interactive "*P\nr")
  (sort-regexp-fields reverse "\\(\\sw\\|\\s_\\)+" "\\&" beg end))
;;
;;;;

;;;; renumber
;;
(defun renumber (&optional num)
  "Renumber the list items in the current paragraph,
    starting at point."
  (interactive "p")
  (setq num (or num 1))
  (let ((end (save-excursion
               (forward-paragraph)
               (point))))
    (while (re-search-forward "^[0-9]+" end t)
      (replace-match (number-to-string num))
      (setq num (1+ num)))))

(defun renumber-list (start end &optional num)
  "Renumber the list items in the current START..END region.
    If optional prefix arg NUM is given, start numbering from that number
    instead of 1."
  (interactive "*r\np")
  (save-excursion
    (goto-char start)
    (setq num (or num 1))
    (save-match-data
      (while (re-search-forward "^[0-9]+" end t)
        (replace-match (number-to-string num))
        (setq num (1+ num))))))

;;;; increment
;;
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(defun decrement-number-at-point ()
  (interactive)
  (skip-chars-backward "0123456789")
  (or (looking-at "[0123456789]+")
      (error "No number at point"))
  (replace-match (number-to-string (1- (string-to-number (match-string 0))))))

;; (define-key ctl-e-map "+" 'increment-number-at-point)

(defun insert-buffer-file-name ()
  (interactive)
  (insert (buffer-file-name)))

(defun insert-file-name-nondirectory ()
  (interactive)
  (insert (file-name-nondirectory (buffer-file-name))))

(defun insert-capitalize-file-name-nondirectory-nonextension ()
  (interactive)
  (insert (upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))))

(defun insert-capitalize-file-name-nondirectory ()
  (interactive)
  (insert (upcase (file-name-nondirectory (buffer-file-name)))))

;;;; align space
;;
(defun align--space (arg)
  ""
  (let ((count 0)
        (startc (current-column))
        endc)
    (save-excursion
      (line-move arg nil nil 'try-vscroll)
      (while (and (blank-line-p)
                  (not (bobp))
                  (> 10 count))
        (incf count)
        (line-move arg nil nil 'try-vscroll))
      (skip-chars-forward " \t")
      (setq endc (current-column)))
    (insert-char 32 (- endc startc))
    ))

(defun backward-align-space (arg)
  "align-space"
  (interactive "p")
  (align--space (- arg)))

(defun forward-align-space (arg)
  "align-space"
  (interactive "p")
  (align--space arg))
;; (define-key ctl-e-map "F" 'backward-align-space)
;; (define-key ctl-e-map "\M-f" 'backward-align-space)

;;;; alias
;;
(defalias 'symf 'symbol-file)

;;;; alias
;;
(defalias 're-in-string 'string-match)

;;;; replace "\" to "\\"
;;
(defun replace-dir-sep ()
  "replace-dir-sep"
  (interactive)
  (query-replace "\\" "\\\\"))
;; (define-key ctl-e-map "\\" 'replace-dir-sep)

;;;; replace directory separator
;;
(autoload 'replace-string "replace")
(defun rep-dir-sep (start end)
  "Replace directory separator.
START: start of region
END: end of region"
  (interactive "r")
  (save-excursion
    (cond
     ((save-excursion (search-backward "\\\\" start 'noerror))
      (replace-string "\\\\" "/" nil start end))
     ((save-excursion (search-backward "\\" start 'noerror))
      (replace-string "\\" "\\\\" nil start end))
     ((save-excursion (search-backward "/" start 'noerror))
      (replace-string "/" "\\" nil start end))
     )))
;; (define-key ctl-e-map "\\" 'rep-dir-sep)

;;;; stack point
;;
(defvar stack-point nil)
(defvar stack-point-max 20)
(defun stack-point ()
  ""
  (setq stack-point (cons (list (buffer-file-name) (point)) stack-point))
  (length stack-point)
  (when (> (length stack-point) stack-point-max)
    (setcdr (nthcdr (1- stack-point-max) stack-point) nil))
  )

(defun pop-stack-point ()
  ""
  (interactive)
  (let ((dst (pop stack-point)))
    (when (eq dst nil)
      (error "No stack point"))
    (when (not (eq (car dst) nil))
      (find-file (car dst))
      (goto-char (car (cdr dst)))
      )))


;;;; uniq region
;;
(defun uniq-region (start end)
  ""
  (interactive "*r")
  (shell-command-on-region start end "uniq" nil 'replace)
  )

;;;; alias
;;
(defalias 'bookmark-most-using-t1 'bookmark-set)

;;;; recompile recursively
(defun myrecompile-recursively (dirs)
  "Recompile recursively.
DIRS: directory."
  (interactive)
  (dolist (dir (recursive-directory dirs))
    (dolist (f (directory-files dir 'full "\\.el\\`"))
      (unless (file-accessible-directory-p f)
        (batch-byte-compile-file f)))))

(defun recursive-files (dir &optional regexp) ;[2013/11/24]
  "DIR
REGEXP"
  (flatten (mapcar
            (lambda (d) (directory-files d 'full regexp))
            (recursive-directory dir))))

(defun flatten (list)
  (cond ((null list) nil)
        ((atom list) (list list))
        (t
         (append (flatten (car list)) (flatten (cdr list))))))

;;;; walk-edit
;;
(defun walk-edit (func dir &optional regexp exclude save kill) ;[2013/11/25]
  "DIR
REGEXP"
  (let ((co-check-type-miss t))
    (dolist (file (recursive-files dir regexp))
      (unless (and exclude (string-match exclude file))
        (with-current-buffer (find-file-noselect file)
          (read-only-mode -1)
          (goto-char (point-min))
          (widen)
          (funcall func)
          (and save (save-buffer))
          (and (not (buffer-modified-p)) kill (kill-this-buffer)))))))

;;;; indirect region
;;
;; [2013/09/27]
;; copied from http://www.emacswiki.org/emacs/IndirectBuffers and modified.
(defvar indirect-mode-name nil
  "Mode to set for indirect buffers.")
(make-variable-buffer-local 'indirect-mode-name)

(defun indirect-region (start end &optional buffname)
  "Edit the current region in another buffer.
START:start of region.
END:end of region.
BUFFNAME:extention buffer name.
    If the buffer-local variable `indirect-mode-name' is not set, prompt
    for mode name to choose for the indirect buffer interactively.
    Otherwise, use the value of said variable as argument to a funcall."
  (interactive "r")
  (if buffname
      (setq buffname (concat " " buffname))
    (setq buffname ""))
  (let ((buffer-name (generate-new-buffer-name (concat "*indirect" buffname "*")))
        (mode
         (if (not indirect-mode-name)
             (setq indirect-mode-name
                   (intern
                    (completing-read
                     "Mode: "
                     (mapcar (lambda (e)
                               (list (symbol-name e)))
                             (apropos-internal "-mode$" 'commandp))
                     nil t)))
           indirect-mode-name)))
    (pop-to-buffer (make-indirect-buffer (current-buffer) buffer-name))
    (funcall mode)
    (narrow-to-region start end)
    (goto-char (point-min))
    ;; (shrink-window-if-larger-than-buffer)
    ))

;;;; move-text-up basic-edit-toolkit.el
;;
(defadvice move-text-up
  (after move-text-up-previous-line activate)
  (let ((column (current-column)))
    (forward-line (- arg))
    (line-move-to-column column))
  )
;; (progn (ad-disable-advice 'move-text-up 'after 'move-text-up-previous-line) (ad-update 'move-text-up)))


(defun before-save-align-tail () ;[2013/11/03]
  "For `before-save-hook'."
  (let ((inhibit-read-only t))
    (save-excursion
      (goto-char (point-max))
      (when (and (re-search-backward "" nil 'noerror)
                 (not (looking-back "\n\n\n")))
        (forward-char -1)
        (delete-blank-lines)
        (insert "\n\n"))
      )))


;; (add-hook 'prog-mode-hook '(lambda () (setq backup-inhibited nil)))
;; (remove-hook 'prog-mode-hook '(lambda () (setq backup-inhibited nil)))

(defadvice save-buffer
  (before save-buffer-make-backup activate)
  (when (called-interactively-p 'interactive)
    (setq backup-inhibited nil))
  )
;; (progn (ad-disable-advice 'save-buffer 'before 'save-buffer-make-backup) (ad-update 'save-buffer)))

;;;; beep handling
;;
(defun my-bell-function ()
  (unless (memq this-command
                '(isearch-abort
                  abort-recursive-edit
                  exit-minibuffer
                  keyboard-quit
                  mwheel-scroll
                  down
                  up
                  next-line
                  previous-line
                  backward-char
                  forward-char))
    (ding)))

(setq ring-bell-function 'my-bell-function)

;;;; keyboard macro
(global-set-key (kbd "s-<f4>") 'kmacro-edit-macro)
(global-set-key (kbd "C-x <f4>") 'name-last-kbd-macro)
(global-set-key (kbd "C-x s-<f4>") 'insert-kbd-macro)

(defalias 'symbol-to-string 'symbol-name)

(defalias 'expandmacro 'macroexpand)
(defalias 'expand-macro 'macroexpand)
(defalias 'macro-expand 'macroexpand)


(defun insert-register-disable-exchange (register) ;[2014/06/12]
  "REGISTER"
  (interactive "*cInsert register: ")
  (insert-register register t)
  )


;;;###autoload
(defun grep-edit-finish-save (save) ;[2014/09/05]
  "SAVE"
  (interactive "p")
  (grep-edit-finish-edit)
  (when (or (= save 4) (y-or-n-p "Save some buffer? y or n: "))
    (let ((inhibit-read-only t))
      (save-some-buffers 'noquetion))))

;;;###autoload
(defun add-doing (description) ;[2015/10/02]
  "DESCRIPTION"
  (interactive "sDoing? \n")
  (find-file my-allinone-path)
  (unless (file-exists-p my-allinone-path)
    (error (format "Not exists %s" my-allinone-path)))
  (goto-char (point-max))
  (let ((inhibit-read-only t))
    (when (re-search-backward "^\* ----- DOING -----" nil 'noerror)
      (forward-line 1)
      (insert "** TODO " description "\n"
              "  " (format-time-string "<%Y-%m-%d %a %H:%M>\n"))
      (save-buffer)
      (bury-buffer)
      ))
  )

(define-key global-map (kbd "<f7>") 'add-doing)

(require 't1-bind-key "t1-bind-key" 'noerr)
(common-view-map-bind-keys messages-buffer-mode-map)



(provide 'test-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; no-update-autoloads: t
;; End:
;;; test-setup.el ends here
