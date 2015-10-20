;;; python-clonedigger.el ---    setting for org mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/21 04:52:24 (+0900)
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
;;
;;; Code:


(defun py:clonedigger-run (&optional target odir interactive) ;[2013/11/24]
  ""
  (save-some-buffers)
  (let* ((cmd "clonedigger")
         (odir (or odir "/tmp/"))
         (output-file (expand-file-name (concat (buffer-name) ".html") odir))
         (options (format "-o %s" output-file))
         (target (or target (file-name-directory (buffer-file-name)) ""))
         (cmdline (s-join " " (list cmd options target)))
         (cmdline (if interactive
                      (read-string "cmdline: " (concat cmdline " ") nil)
                    cmdline)))
    (compilation-start cmdline nil (lambda (mode) (concat "*clonedigger*")))
    (when (functionp 'w3m-find-file)
      (while (not (file-exists-p output-file))
        (sit-for 3))
      (w3m-find-file output-file))))

;;;###autoload
(defun py:clonedigger () ;[2013/11/25]
  ""
  (interactive)
  (py:clonedigger-run (buffer-file-name) nil 'interactive))

;;;###autoload
(defun py:clonedigger-project () ;[2013/11/25]
  ""
  (interactive)
  (py:clonedigger-run
   (file-name-directory (buffer-file-name)) nil 'interactive))



(provide 'python-clonedigger)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python-clonedigger.el ends here

