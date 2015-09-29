;;; tempbuf_plugin_start.el --- functions for tempbuf
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 18 19:52:35 2012 (+0900)
;; Last-Updated: Tue Dec 18 19:55:28 2012 (+0900)
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
;; 2012/12/18    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'tempbuf))

;;;###autoload
(defun tempbuf-mode-predefine ()
  "For `eval-after-load' tempbuf function."
  (message "Loading tempbuf..")
  (setq tempbuf-minimum-timeout 300)
  )


(provide 'tempbuf_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; tempbuf_plugin_start.el ends here
