;; -*- Mode: Emacs-Lisp -*-

;;; anything-info-python.el --- anything info python
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Fri Dec 28 17:36:07 2012 (+0900)
;; Last-Updated: Fri Dec 28 17:37:35 2012 (+0900)
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
;; 2012/12/28    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'anything))

;;;; anything source python Info
(defvar anything-c-source-info-python
  '((info-index . "python.info")))

;;;###autoload
(defun anything-info-python-at-point ()
  "Preconfigured `anything' for search info at point."
  (interactive)
  (anything '(anything-c-source-info-python)
            (thing-at-point 'symbol) nil nil nil "*anything info*"))

;; Info Python Module
(defvar anything-c-info-python-module nil)
(defvar anything-c-source-info-python-module
  `((name . "Info Python Module")
    (init . (lambda ()
              (save-window-excursion
                (unless anything-c-info-python-module
                  (with-temp-buffer
                    (Info-find-node "python-lib-jp" "Module Index")
                    (setq anything-c-info-python-module (split-string (buffer-string) "\n"))
                    (Info-exit))))))
    (candidates . (lambda ()
                    (loop for i in anything-c-info-python-module
                          if (string-match "^* [^ \n]+[^: ]" i)
                          collect (match-string 0 i))))
    (action . (lambda (candidate)
                (Info-find-node "python-lib-jp" "Module Index")
                (Info-index (replace-regexp-in-string "* " "" candidate))))
    (requires-pattern . 2)))
;; (anything 'anything-c-source-info-python-module)

;; ;; Info Python Class-Exception-Object
(defvar anything-c-info-python-class nil)
(defvar anything-c-source-info-python-class
  `((name . "Info Python Class-Exception-Object")
    (init . (lambda ()
              (save-window-excursion
                (unless anything-c-info-python-class
                  (with-temp-buffer
                    (Info-find-node "python-lib-jp" "Class-Exception-Object Index")
                    (setq anything-c-info-python-class (split-string (buffer-string) "\n"))
                    (Info-exit))))))
    (candidates . (lambda ()
                    (loop for i in anything-c-info-python-class
                          if (string-match "^* [^ \n]+[^: ]" i)
                          collect (match-string 0 i))))
    (action . (lambda (candidate)
                (Info-find-node "python-lib-jp" "Class-Exception-Object Index")
                (Info-index (replace-regexp-in-string "* " "" candidate))))
    (requires-pattern . 2)))
;; (anything 'anything-c-source-info-python-class)

;; ;; Info Python Function-Method-Variable
(defvar anything-c-info-python-function nil)
(defvar anything-c-source-info-python-function
  `((name . "Info Python Function-Method-Variable")
    (init . (lambda ()
              (save-window-excursion
                (unless anything-c-info-python-function
                  (with-temp-buffer
                    (Info-find-node "python-lib-jp" "Function-Method-Variable Index")
                    (setq anything-c-info-python-function (split-string (buffer-string) "\n"))
                    (Info-exit))))))
    (candidates . (lambda ()
                    (loop for i in anything-c-info-python-function
                          if (string-match "^* [^ \n]+[^: ]" i)
                          collect (match-string 0 i))))
    (action . (lambda (candidate)
                (Info-find-node "python-lib-jp" "Function-Method-Variable Index")
                (Info-index (replace-regexp-in-string "* " "" candidate))))
    (requires-pattern . 2)))
;; (anything 'anything-c-source-info-python-function)

;; ;; Info Python Miscellaneous
(defvar anything-c-info-python-misc nil)
(defvar anything-c-source-info-python-misc
  `((name . "Info Python Miscellaneous")
    (init . (lambda ()
              (save-window-excursion
                (unless anything-c-info-python-misc
                  (with-temp-buffer
                    (Info-find-node "python-lib-jp" "Miscellaneous Index")
                    (setq anything-c-info-python-misc (split-string (buffer-string) "\n"))
                    (Info-exit))))))
    (candidates . (lambda ()
                    (loop for i in anything-c-info-python-misc
                          if (string-match "^* [^ \n]+[^: ]" i)
                          collect (match-string 0 i))))
    (action . (lambda (candidate)
                (Info-find-node "python-lib-jp" "Miscellaneous Index")
                (Info-index (replace-regexp-in-string "* " "" candidate))))
    (requires-pattern . 2)))


(provide 'anything-info-python)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; anything-info-python.el ends here
