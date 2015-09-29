;; -*- Mode: Emacs-Lisp -*-

;;; recover-version.el --- recover from version
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 22:01:44 2012 (+0900)
;; Last-Updated: Wed Dec 12 22:03:12 2012 (+0900)
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
;; 2012/12/12    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defun recover-version ()
  "Recover from backup versions."
  (interactive)
  (let* ((basic-name (make-backup-file-name-1 (buffer-file-name)))
         (base-versions (concat (file-name-nondirectory basic-name)
                                ".~"))
         (backup-extract-version-start (length base-versions))
         (high-water-mark 0)
         (min 0)
         possibilities versions vnumber)
    (condition-case ()
        (progn (setq possibilities (file-name-all-completions
                                    base-versions
                                    (file-name-directory basic-name))
                     versions (sort (mapcar #'backup-extract-version
                                            possibilities)
                                    #'<)
                     high-water-mark (apply 'max 0 versions)
                     )
               (dotimes (n kept-old-versions)
                 (pop versions))
               (setq min (apply 'min versions)))
      (file-error (setq possibilities nil)))
    (when (file-exists-p (format "%s.~%d~" basic-name high-water-mark))
      (setq vnumber (read-from-minibuffer
                     (format "Recover from %d to %d: " min high-water-mark)
                     (number-to-string high-water-mark)))
      (if (and (>= high-water-mark (string-to-number vnumber))
               (<= min (string-to-number vnumber)))
          (let ((inhibit-read-only t))
            (erase-buffer)
            (insert-file-contents (format "%s.~%s~" basic-name vnumber) nil)
            (message (format "recovered from %s.~%s~" basic-name vnumber)))
        (error (format "No such file: %s.~%s~" basic-name vnumber))))))

;;;###autoload
(defalias 'back-to-revision 'recover-version)


(provide 'recover-version)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; recover-version.el ends here
