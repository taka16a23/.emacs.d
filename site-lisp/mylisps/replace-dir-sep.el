;;; replace-dir-sep.el ---   key bind setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:06 2012 (+0900)
;; Last-Updated:2015/10/20 02:43:25 (+0900)
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
;;
;;; Code:


;;;###autoload
(defun replace-dir-sep ()
  "replace-dir-sep"
  (interactive)
  (query-replace "\\" "\\\\"))

;;;; replace directory separator
;;
(autoload 'replace-string "replace")
;;;###autoload
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



(provide 'replace-dir-sep)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; replace-dir-sep.el ends here
