;;; autoinsert_plugin_start.el --- functions for autoinsert
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 00:28:42 2012 (+0900)
;; Last-Updated: 2015/09/24 13:58:13 (+0900)
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
;; 2015/09/24    Atami
;;    Modified: `yas-expand-link', `yas-expand-link-choice', `my-auto-insert-elisp',
;;    `my-auto-insert-cpp', `my-auto-insert-shscripts',
;;    `my-auto-insert-init-python',`my-auto-insert-main-python',
;;    `my-junk-auto-insert-python',`my-test-auto-insert-python',
;;    `my-junk-auto-insert-elisp', `my-setup-auto-insert-python',
;;    `my-auto-insert-python'
;;    supported for yasnippet 8.0 "yas/" => "yas-"
;;
;; 2015/09/24    Atami
;;    Renamed: `yas/expand-link' => `yas-expand-link'
;;    `yas/expand-link-choice' => `yas-expand-link-choice' for yasnippet 8.0
;;
;; 2015/08/11    Atami
;;    Modified: `autoinsert-predefine'
;;    `auto-insert-alist' add for auto insert __main__.py
;;
;; 2015/08/11    Atami
;;    Added: `my-auto-insert-main-python' for __main__.py file
;;
;; 2013/09/14    Atami
;;    Added: python test template.
;;    "test_..." file
;;    choose with t key in auto-insert-choose variable
;;
;; 2012/12/18    Atami
;;    Renamed: File renamed
;;    `auto_insert_mode_start.el' to `autoinsert_mode_start.el'
;;
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'autoinsert "autoinsert" 'noerr)
  (require 'yasnippet "yasnippet" 'noerr))

;;;###autoload
(defun autoinsert-custom-predefine ()
  "For `eval-after-load' autoinsert customize."
  (message "eval-after-load: \"autoinsert\" customizing..")
  (custom-set-variables
   '(auto-insert-directory (concat my-data-dir "insert/")) ;need end of slash
   '(auto-insert-query nil) ;no prompt before insertion
   ))

;;;###autoload
(defun autoinsert-predefine ()
  "For `eval-after-load' autoinsert function."
  (message "eval-after-load: \"autoinsert\" setting..")
  (setq auto-insert-alist
        (append
         '((    "\\.junk.el$"    . my-junk-auto-insert-elisp ))
         ;; '((      "\\.el$"    . my-auto-insert-elisp      ))
         '((        "\\.el$"     . make-header      ))
         '(("__init__\\.py$"     . my-auto-insert-init-python))
         '(("__main__\\.py$"     . my-auto-insert-main-python))
         '(( "\\.junk\\.py$"     . my-junk-auto-insert-python))
         '(( "test_.+\\.py$"     . my-test-auto-insert-python))
         '((   "setup\\.py$"     . my-setup-auto-insert-python))
         '((        "\\.py$"     . my-auto-insert-python     ))
         '((       "\\.pyx$"     . my-auto-insert-python     ))
         '((        "\\.cc$"     . my-auto-insert-cpp))
         '((       "\\.cpp$"     . my-auto-insert-cpp))
         '(("zsh/scripts/_.+\\.sh$" . my-auto-insert-shscripts))
      auto-insert-alist))
  (define-auto-insert "\\.rb$" "ruby-template.rb")
  (define-auto-insert "\\.sh$" "sh-template.sh")
  (define-auto-insert "\\.org$" "org-template.org")
  (define-auto-insert "\\.timer$" "systemd-template.timer")
  (define-auto-insert "\\.service$" "systemd-template.service")
  (define-auto-insert "\\.socket$" "systemd-template.socket")
  (define-auto-insert "\\.mount$" "systemd-template.mount")
  (define-auto-insert "\\.automount$" "systemd-template.automount")
  (define-auto-insert "\\.slice$" "systemd-template.slice")
  (define-auto-insert "\\.path$" "systemd-template.path")
  (define-auto-insert "\\.device$" "systemd-template.device")
  (define-auto-insert "\\.snapshot$" "systemd-template.snapshot")
  (define-auto-insert "\\.scope$" "systemd-template.scope")
  (define-auto-insert "\\.target$" "systemd-template.target")
  )


;;;###autoload
(defun yas-expand-link (key del)
  "Hyperlink function for yasnippet expansion.
Argument KEY .
Argument DEL ."
  (if del (delete-region (save-excursion
                           (beginning-of-line)
                           (skip-chars-forward " ")
                           (point))
                         (1+ (point-at-eol))))
  (insert key)
  (yas-expand))

;;;###autoload
(defun yas-expand-link-choice (del &rest keys)
  "Hyperlink to select yasnippet template.
Argument DEL .
Optional argument KEYS ."
  (yas-expand-link (completing-read "Select template: " keys nil t) del))

;;;###autoload
(defun my-auto-insert-elisp ()
  (insert "initialize_auto-insert")
  (yas-expand))

;;;###autoload
(defun my-auto-insert-cpp ()
  (insert "initialize_auto-insert")
  (yas-expand))

;;;###autoload
(defun my-auto-insert-shscripts () ;[2013/12/02]
  ""
  (insert (choose-input shell-auto-insert-choose))
  (yas-expand))

;;;###autoload
(defun my-auto-insert-init-python ()
  (insert "__init__auto-insert")
  (yas-expand))

;;;###autoload
(defun my-auto-insert-main-python () ;[2015/08/11]
  ""
  (insert "normal_auto-insert")
  (yas-expend))

;;;###autoload
(defun my-junk-auto-insert-python ()
  (insert "junk_auto-insert")
  (yas-expand))

;;;###autoload
(defun my-test-auto-insert-python ()
  (insert "test_auto-insert")
  (yas-expand))

;;;###autoload
(defun my-junk-auto-insert-elisp ()
  (insert "junk_elisp_auto-insert")
  (yas-expand))

;;;###autoload
(defun my-setup-auto-insert-python () ;[2013/11/28]
  (insert "setup_auto-insert")
  (yas-expand))


;;;; choose with key
;;
(defun choose-input (choose-list) ;[2013/12/02]
  "CHOOSE-LIST"
  (message "Select template: %s"
           (mapconcat
            (lambda (x)
              (cond
               ((not (string-match "\\S-" (nth 1 x)))
                (format "[%c]" (car x)))
               ((equal (downcase (car x))
                       (downcase (aref (nth 1 x) 0)))
                (format "[%c]%s" (car x)
                        (substring (nth 1 x) 1)))
               (t (format "[%c]%s" (car x) (nth 1 x)))))
            choose-list " "))
  (car (cddr (assoc (read-char-exclusive) choose-list))))

(defvar shell-auto-insert-choose '((?p "python" "scripts_python_auto-insert")
                                   ;; (?t "terminal_spawn"
                                   ;; "scripts_terminalspawn_auto-insert")
                                   (?t "terminalspawn_python"
                                       "scripts_terminalspawn_python_auto-insert")
                                   (?n "normal" "auto-insert_normal")
                                   ;; (?j "junk" "junk_auto-insert")
                                   ))

(defvar auto-insert-choose '((?m "module" "module_auto-insert")
                             (?M "blankmodule" "blankmodule_auto-insert")
                             (?n "normal" "normal_auto-insert")
                             (?j "junk" "junk_py_auto-insert")
                             (?c "client(socket)" "client_socket_auto-insert")
                             (?s "server(socket)" "server_socket_auto-insert")
                             (?i "i__init__" "__init__auto-insert")
                             (?t "test" "test_auto-insert")
                             (?h "head&tail" "headertail_auto-insert")
                             (?S "setup" "setup_auto-insert")
                             (?b "blank" "blank_auto-insert")))

;;;###autoload
(defun my-auto-insert-python ()
  (view-mode -1)
  (insert (choose-input auto-insert-choose))
  (yas-expand))



(provide 'autoinsert_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; autoinsert_plugin_start.el ends here
