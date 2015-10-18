;;; scrap-code.el --- Save scrap code.
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/09/15 01:13:43 (+0900)
;; Last-Updated: 2013/09/15 01:21:02 (+0900)
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
;; Features that might be required by this library:
;;
;;   None
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;; 2013/09/15    Atami
;;    Added: `scrap-code'
;;    Scraping current buffer to scrap directory.
;;
;; 2013/09/15    Atami
;;    Initialize
;;
;;
;;; Code:


;;;###autoload
(defun scrap-code ()
  "Scraping current buffer to scrap directory."
  (interactive)
  (let* ((overwrite nil)
         (origname (buffer-file-name))
         (file-name (file-name-nondirectory origname))
         (file-name-noextension (file-name-sans-extension file-name))
         (extension (file-name-extension file-name))
         (major-name (if (eq major-mode 'emacs-lisp-mode) "elisp"
                       (downcase (replace-regexp-in-string
                                  "-mode" "" (symbol-name major-mode)))))
         (parent-dir my-code-dir)
         (dir (expand-file-name "scrap"
                                (expand-file-name major-name parent-dir)))
         (default-name (expand-file-name
                        (concat file-name-noextension ".scrap." extension) dir))
         (new (read-string
               "Save scrap file: " default-name nil default-name)))
    (unless (file-exists-p dir)
      (make-directory dir))
    (when (and (file-exists-p new)
               (y-or-n-p "File already exists.  Overwrite? "))
      (setq overwrite t))
    (copy-file origname new overwrite)
    (if (file-exists-p new)
        (message "Saved %s file." new)
      (error "Has error scrap-code"))))


(provide 'scrap-code)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; scrap-code.el ends here
