;;; gnus-cite_plugin_start.el --- functions for gnus-cite
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Thu Dec 13 22:14:50 2012 (+0900)
;; Last-Updated: Thu Dec 13 22:15:41 2012 (+0900)
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
;; 2012/12/13    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defun gnus-cite-predefine ()
  "For `eval-after-load' gnus-cite function."
  (message "Loading gnus-cite..")
  (gnus-cite-face-predefine))

;;;###autoload
(defun gnus-cite-face-predefine ()
  (interactive)
  (face-spec-set 'gnus-cite-attribution-face '((t (:italic t))))
  (face-spec-set 'gnus-cite-face-1           '((t (:bold t :foreground "deep sky blue"))))
  (face-spec-set 'gnus-cite-face-10          '((t (:foreground "medium purple"))))
  (face-spec-set 'gnus-cite-face-11          '((t (:foreground "turquoise"))))
  (face-spec-set 'gnus-cite-face-2           '((t (:bold t :foreground "cyan"))))
  (face-spec-set 'gnus-cite-face-3           '((t (:bold t :foreground "gold"))))
  (face-spec-set 'gnus-cite-face-4           '((t (:foreground "light pink"))))
  (face-spec-set 'gnus-cite-face-5           '((t (:foreground "pale green"))))
  (face-spec-set 'gnus-cite-face-6           '((t (:bold t :foreground "chocolate"))))
  (face-spec-set 'gnus-cite-face-7           '((t (:foreground "orange"))))
  (face-spec-set 'gnus-cite-face-8           '((t (:foreground "magenta"))))
  (face-spec-set 'gnus-cite-face-9           '((t (:foreground "violet"))))
  )


(provide 'gnus-cite_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; gnus-cite_plugin_start.el ends here
