;;; col-highlight_plugin_start.el --- setting for col-highlight
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/01 23:02:00 (+0900)
;; Last-Updated: 2013/11/01 23:04:53 (+0900)
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
;; 2013/11/01    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defun col-highlight-mode-predefine ()
  "For `eval-after-load' col-highlight function."
  (message "eval-after-load: \"col-highlight\" setting..")
  )

;;;###autoload
(defun col-highlight-mode-face-predefine ()
  "For col-highlight face."
  (message "eval-after-load: \"col-highlight\" Setting faces..")
  (face-spec-set 'col-highlight '((((class color)
                                    (background dark))
                                   (:background "dark slate gray"))
                                  (((class color)
                                    (background light))
                                   (:background "LightSkyBlue1"))
                                  (t
                                   ())))
  (setq col-highlight-face 'col-highlight)
  )


(provide 'col-highlight_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; col-highlight_plugin_start.el ends here
