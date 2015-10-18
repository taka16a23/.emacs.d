;;; nosetests.el --- for python nose
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.1
;; Created:      2013/11/24 11:35:00 (+0900)
;; Last-Updated: 2014/12/23 15:58:16 (+0900)
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
;; 2014/12/23    Atami
;;    Added: `nosetests-ignore-file', `nosetests-where' as custom
;;
;; 2014/12/23    Atami
;;    Modified: `nosetests-list-arg-options',
;;    `nosetests-ignore-file', `nosetests-where' generate options for list
;;
;; 2014/12/20    Atami
;;    Modified: `nosetests-list-static-options'
;;    skip "--cover-package=" option if package is "" or nil
;;
;; 2014/12/20    Atami
;;    Modified: `nosetests-run-buffer-cover-package',
;;    `nosetests-run-all-cover-package', `nosetests-run-dir-cover-package',
;;    `nosetests-run-it-cover-package'
;;    last package as default value
;;
;; 2014/05/12    Atami
;;    Added: support "--cover-package=%s"
;;    `nosetests-run-buffer-cover-package', `nosetests-run-all-cover-package',
;;    `nosetests-run-dir-cover-package', `nosetests-run-it-cover-package'
;;
;; 2014/05/12    Atami
;;    Removed: `nosetests-pdb-run-all', `nosetests-pdb-run-buffer',
;;    `nosetests-pdb-run-dir', `nosetests-pdb-run-it',
;;
;; 2013/11/24    Atami
;;    initialize:
;;
;;
;;; Code:


(eval-when-compile
  (require 'ansi-color nil 'noerr))

(require 's "s" 'noerr)


;; http://stackoverflow.com/questions/3072648/cucumbers-ansi-colors-messing-up-emacs-compilation-buffer#answer-3072831
;; for --rednose
(defun colorize-compilation-buffer ()
  (require 'ansi-color nil 'noerr)
  (read-only-mode -1)
  (ansi-color-apply-on-region (point-min) (point-max))
  (read-only-mode 1))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(defvar nosetests-config nil)
(defvar nosetests-debug nil)
(defvar nosetests-debug-log nil)
(defvar nosetests-logging-config nil)
(defvar nosetests-attr nil)
(defvar nosetests-eval-attr nil)
(defvar nosetests-cover-xml-file nil)
(defvar nosetests-cover-html-dir nil)
(defvar nosetests-cover-package nil)
(defvar nosetests-cover-last-package "")


(defgroup nosetests nil
  "Hotstring."
  :group 'tools
  :prefix "nosetests-")

(defcustom nosetests-where nil
  "Python nosetests use --where= options."
  :type 'list
  :group 'nosetests)

(defcustom nosetests-ignore-file nil
  "Python nosetests use --ignore-files= options."
  :type 'list
  :group 'nosetests)

(defcustom nosetests-verbose-level 0
  "Python nosetests use --verbosity=LEVEL options."
  :type 'integer
  :group 'nosetests)

(defcustom nosetests-exe nil
  "Python nosetests use --exe options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-quiet nil
  "Python nosetests use --quiet options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-stop nil
  "Python nosetests use --stop options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-no-byte-compile nil
  "Python nosetests use --no-byte-compile options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-rednose t
  "Python nosetests use --rednose options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-no-color nil
  "Python nosetests use --no-color options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-force-color nil
  "Python nosetests use --force-color options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-immediate nil
  "Python nosetests use --immediate options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-nocapture nil
  "Python nosetests use --nocapture options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-nologcapture nil
  "Python nosetests use --nologcapture options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-with-coverage nil
  "Python nosetests use --with-coverage options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-cover-html nil
  "Python nosetests use --cover-html options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-cover-branches nil
  "Python nosetests use --cover-branches options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-cover-xml nil
  "Python nosetests use --cover-xml options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-pdb nil
  "Python nosetests use --pdb options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-pdb-failures nil
  "Python nosetests use --pdb-failures options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-no-deprecated nil
  "Python nosetests use --no-deprecated options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-with-doctest nil
  "Python nosetests use --with-doctest options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-failure-detail nil
  "Python nosetests use --failure-detail options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-with-profile nil
  "Python nosetests use --with-profile options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-no-skip nil
  "Python nosetests use --no-skip options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-with-id nil
  "Python nosetests use --with-id options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-all-modules nil
  "Python nosetests use --all-modules options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-collect-only nil
  "Python nosetests use --collect-only options."
  :type 'boolean
  :group 'nosetests)

(defcustom nosetests-regexp nil
  "Python nosetests --match=REGEXP options."
  :type 'string
  :group 'nosetests)

(defcustom nosetests-exclude nil
  "Python nosetests --exclude=LIST options."
  :type 'list
  :group 'nosetests)

(defcustom nosetests-include nil
  "Python nosetests --include=LIST options."
  :type 'list
  :group 'nosetests)

(defun nosetests-make-options () ;[2013/11/24]
  ""
  (mapconcat 'identity (append (nosetests-list-static-options)
                               (nosetests-list-arg-options)) " "))

(defun nosetests-list-static-options () ;[2013/11/24]
  "Python nosetests parse static options."
  (delq ""
        (list
         (if nosetests-exe "--exe" "")
         (if nosetests-quiet "--quiet" "")
         (if nosetests-stop "--stop" "")
         (if nosetests-no-byte-compile "--no-byte-compile" "")
         (if nosetests-rednose "--rednose" "")
         (if nosetests-no-color "--no-color" "")
         (if nosetests-force-color "--force-color" "")
         (if nosetests-immediate "--immediate" "")
         (if nosetests-nocapture "--nocapture" "")
         (if nosetests-nologcapture "--nologcapture" "")
         (if nosetests-with-coverage "--with-coverage" "")
         (if nosetests-cover-html "--cover-html" "")
         (if nosetests-cover-branches "--cover-branches" "")
         (if nosetests-cover-xml "--cover-xml" "")
         (if nosetests-pdb "--pdb" "")
         (if nosetests-pdb-failures "--pdb-failures" "")
         (if nosetests-with-doctest "--with-doctest" "")
         (if nosetests-failure-detail "--failure-detail" "")
         (if nosetests-with-profile "--with-profile" "")
         (if nosetests-no-skip "--no-skip" "")
         (if nosetests-with-id "--with-id" "")
         (if nosetests-all-modules "--all-modules" "")
         (if nosetests-collect-only "--collect-only" ""))))

(defun nosetests-list-arg-options () ;[2013/11/24]
  "Python nosetests "
  (delq "" (list
            (format "--verbosity=%s" nosetests-verbose-level)
            (if nosetests-config (format "--config=%s" nosetests-config) "")
            (if nosetests-where
                (s-join " " (mapcar (lambda (x) (format "--where=%s" x))
                                    nosetests-exclude)) "")
            (if nosetests-debug (format "--debug=%s" nosetests-debug) "")
            (if nosetests-debug-log
                (format "--debug-log=%s" nosetests-debug-log) "")
            (if nosetests-logging-config
                (format "--logging-config=%s" nosetests-logging-config) "")
            (if nosetests-ignore-file
                (s-join " " (mapcar (lambda (x) (format "--ignore-files=%s" x))
                                    nosetests-ignore-file)) "")
            (if nosetests-attr (format "--attr=%s" nosetests-attr) "")
            (if nosetests-eval-attr
                (format "--eval-attr=%s" nosetests-eval-attr) "")
            (if nosetests-cover-xml-file
                (format "--cover-xml-file=%s" nosetests-cover-xml-file) "")
            (if nosetests-cover-html-dir
                (format "--cover-html-dir=%s" nosetests-cover-html-dir) "")
            (if nosetests-regexp (format "--match=%s" nosetests-regexp) "")
            (if nosetests-exclude
                (format "--exclude=%s" (s-join "," nosetests-exclude)) "")
            (if nosetests-include
                (format "--include=%s" (s-join "," nosetests-include)) "")
            (if nosetests-cover-package
                (format "--cover-package=%s" nosetests-cover-package) "")
            )))


(defun nosetests-run (&optional target interactive) ;[2013/11/24]
  ""
  (save-some-buffers)
  (let* ((nose "nosetests")
         (options (nosetests-make-options))
         (target (or target ""))
         (cmdline (s-join " " (list nose options target)))
         (cmdline (if interactive
                      (read-string "nosetests: " (concat cmdline " ") nil)
                    cmdline)))
    (if (or nosetests-pdb nosetests-pdb-failures)
        ;; FIXME: (Atami) [2013/11/24]
        ;; fixeme smarter popup
        (let ((dummy-buf (pop-to-buffer (get-buffer-create "*pdb dummy*"))))
          (with-current-buffer dummy-buf
            (funcall 'pdb cmdline))
          (kill-buffer dummy-buf))
      (compilation-start cmdline nil (lambda (mode) (concat "*nosetests*"))))))

;;; temporary force interactive
;;;###autoload
(defun nosetests-run-buffer (args) ;[2013/11/24]
  ""
  (interactive "p")
  (let ((nosetests-pdb-failures (if (eq args 4) t nosetests-pdb-failures)))
    (nosetests-run buffer-file-name 'interactive)))

;;;###autoload
(defun nosetests-run-all (args) ;[2013/11/24]
  ""
  (interactive "p")
  (let ((nosetests-pdb-failures (if (eq args 4) t nosetests-pdb-failures)))
    (nosetests-run nil 'interactive)))

;;;###autoload
(defun nosetests-run-dir (args) ;[2013/11/24]
  ""
  (interactive "p")
  (let ((nosetests-where default-directory)
        (nosetests-pdb-failures (if (eq args 4) t nosetests-pdb-failures)))
    (nosetests-run nil 'interactive)))

;;;###autoload
(defun nosetests-run-it (args) ;[2013/11/24]
  ""
  (interactive "p")
  (let ((nosetests-pdb-failures (if (eq args 4) t nosetests-pdb-failures)))
    (nosetests-run
     (format "%s:%s" buffer-file-name (nose-py-testable)) 'interactive)))

;;;###autoload
(defun nosetests-run-buffer-cover-package (args) ;[2014/05/11] [2014/12/20]
  "ARGS "
  (interactive "p")
  (setq nosetests-cover-last-package
        (read-string "--cover-package=: " nosetests-cover-last-package nil ""))
  (let ((nosetests-cover-package (if (string= nosetests-cover-last-package "")
                                     nil nosetests-cover-last-package)))
    (nosetests-run-buffer args)))

;;;###autoload
(defun nosetests-run-all-cover-package (args) ;[2014/05/11] [2014/12/20]
  "ARGS"
  (interactive "p")
  (setq nosetests-cover-last-package
        (read-string "--cover-package=: " nosetests-cover-last-package nil ""))
  (let ((nosetests-cover-package (if (string= nosetests-cover-last-package "")
                                     nil nosetests-cover-last-package)))
    (nosetests-run-all args)))

;;;###autoload
(defun nosetests-run-dir-cover-package (args) ;[2014/05/11] [2014/12/20]
  "ARGS"
  (interactive "p")
  (setq nosetests-cover-last-package
        (read-string "--cover-package=: " nosetests-cover-last-package nil ""))
  (let ((nosetests-cover-package (if (string= nosetests-cover-last-package "")
                                     nil nosetests-cover-last-package)))
    (nosetests-run-dir args)))

;;;###autoload
(defun nosetests-run-it-cover-package (args) ;[2014/05/11] [2014/12/20]
  "ARGS"
  (interactive "p")
  (setq nosetests-cover-last-package
        (read-string "--cover-package=: " nosetests-cover-last-package nil ""))
  (let ((nosetests-cover-package (if (string= nosetests-cover-last-package "")
                                     nil nosetests-cover-last-package)))
    (nosetests-run-it args)))

;;;; interactive setting
;;
;;;###autoload
(defun nosetests-turn-on-pdb () ;[2013/11/24]
  ""
  (interactive)
  (setq nosetests-pdb t)
  (setq nosetests-pdb-failures t))

;;;###autoload
(defun nosetests-turn-off-pdb () ;[2013/11/24]
  ""
  (interactive)
  (setq nosetests-pdb nil)
  (setq nosetests-pdb-failures nil))

;;;###autoload
(defun nosetests-turn-on-coverage () ;[2013/11/24]
  "ARGS"
  (interactive)
  (setq nosetests-with-coverage t))

;;;###autoload
(defun nosetests-turn-off-coverage () ;[2013/11/24]
  "ARGS"
  (interactive)
  (setq nosetests-with-coverage nil))

;;;###autoload
(defun nosetests-turn-on-profile () ;[2013/11/24]
  "ARGS"
  (interactive)
  (setq nosetests-with-profile t))

;;;###autoload
(defun nosetests-turn-off-profile () ;[2013/11/24]
  "ARGS"
  (interactive)
  (setq nosetests-with-profile nil))

;;;###autoload
(defun nosetests-turn-on-doctest () ;[2013/11/27]
  ""
  (interactive)
  (setq nosetests-with-doctest t))

;;;###autoload
(defun nosetests-turn-off-doctest () ;[2013/11/27]
  ""
  (interactive)
  (setq nosetests-with-doctest nil))

;;;; copyed from nose.el
(defun nose-py-testable ()
  (let* ((inner-obj (inner-testable))
         (outer (outer-testable))
         ;; elisp can't return multiple values
         (outer-def (car outer))
         (outer-obj (cdr outer)))
    (cond ((equal outer-def "def") outer-obj)
          ((equal inner-obj outer-obj) outer-obj)
          (t (format "%s.%s" outer-obj inner-obj)))))

(defun inner-testable ()
  (save-excursion
    (re-search-backward
     "^ \\{0,4\\}\\(class\\|def\\)[ \t]+\\([a-zA-Z0-9_]+\\)" nil t)
    (buffer-substring-no-properties (match-beginning 2) (match-end 2))))

(defun outer-testable ()
  (save-excursion
    (re-search-backward
     "^\\(class\\|def\\)[ \t]+\\([a-zA-Z0-9_]+\\)" nil t)
    (let ((result
           (buffer-substring-no-properties (match-beginning 2) (match-end 2))))

      (cons
       (buffer-substring-no-properties (match-beginning 1) (match-end 1))
       result))))



(provide 'nosetests)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; nosetests.el ends here
