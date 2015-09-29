;;; highlight-indentation_plugin_start.el --- setting for highlight-indentation
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/10/17 16:14:03 (+0900)
;; Last-Updated: 2013/11/09 01:29:42 (+0900)
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
;; 2013/11/09    Atami
;;    modified: `highlight-indentation-face' vars DeepSkyBlue to NavyBlue.
;;
;; 2013/10/17    Atami
;;    initialize:
;;
;;
;;; Code:


;;;###autoload
(defun highlight-indentation-mode-predefine ()
  "For `eval-after-load' highlight-indentation function."
  (message "eval-after-load: \"highlight-indentation\" setting..")
  )

;;;###autoload
(defun highlight-indentation-mode-face-predefine ()
  "For highlight-indentation face."
  (message "eval-after-load: \"highlight-indentation\" Setting faces..")
  (set-face-background 'highlight-indentation-face "NavyBlue")
  (set-face-background 'highlight-indentation-current-column-face
                       "midnight blue")
  )



(provide 'highlight-indentation_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; highlight-indentation_plugin_start.el ends here
