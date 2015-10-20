;;; python-test-generator.el ---    setting for org mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 16:52:41 (+0900)
;; Last-Updated:2015/10/21 04:00:38 (+0900)
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


(defvar testsmethod-template "    def test_%s(self, ):
        self.skipTest('Not Implemented')\n")
(defun py:current-classname () ;[2015/02/04]
  ""
  (when (py:in-class-p)
    (py:beginning-of-class 1))
  (when (py:at-beginning-of-class-p)
    (re-search-forward py:class-name-re nil 'noerror)
    (match-string-no-properties 1)))

(defun py:list--testsmethod-template (cls) ;[2015/02/04]
  "CLS"
  (mapcar
   (lambda (x) (format testsmethod-template x))
   (py:list-method-in-class cls)))

;;;###autoload
(defun py:testsmethod-insert-kill-ring (&optional cls) ;[2015/02/04]
  "CLS"
  (interactive)
  (let ((clsname (or cls (py:current-classname))))
    (when (eq clsname nil)
      (setq clsname (read-input "Input class name: ")))
    (kill-new (s-join "\n" (py:list--testsmethod-template clsname)))
    (message "!tests method text saved to kill-ring.!")))



(provide 'python-test-generator)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python-test-generator.el ends here

