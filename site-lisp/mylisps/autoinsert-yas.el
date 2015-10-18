;;; autoinsert-yas.el --- 
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/12 09:07:53 (+0900)
;; Last-Updated:2015/10/12 09:37:34 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


;; TODO: (Atami) [2015/10/12]
;; packaging
;; choose and yas-expand

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



(provide 'autoinsert-yas)
;; for Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; autoinsert-yas.el ends here

