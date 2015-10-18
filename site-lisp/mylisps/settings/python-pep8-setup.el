;;; python-pep8-setup.el ---   setting for python-pep8
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 05:22:43 (+0900)
;; Last-Updated:2015/10/13 21:40:12 (+0900)
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


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package python-pep8
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"python-pep8\"")
  (custom-set-variables
   '(python-pep8-command "python -m pep8"))
  (defun python-pep8 ()
    "Run PEP8, and collect output in a buffer.
While pep8 runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<python-pep8-mode-map>\\[compile-goto-error] in the grep \
output buffer, to go to the lines where pep8 found matches."
    (interactive)
    (save-some-buffers (not python-pep8-ask-about-save) nil)
    (let* ((tramp (tramp-tramp-file-p (buffer-file-name)))
           (file (or (and tramp
                          (aref (tramp-dissect-file-name (buffer-file-name)) 3))
                     (buffer-file-name)))
           (command (mapconcat
                     'identity
                     (list python-pep8-command
                           (mapconcat 'identity python-pep8-options " ")
                           (comint-quote-filename file)
                           "|" (if (windows-p)
                                   (concat (substring usb-drive-letter 0 2)
                                           "\\Dos\\unixutils\\sort.exe")
                                 "sort") "-n" "-t:" "-k3") " ")))
      (compilation-start command 'python-pep8-mode)))
  )



(provide 'python-pep8-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python-pep8-setup.el ends here


