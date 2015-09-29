;;; rotate-text_plugin_start.el --- funcctons for rotate-text
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 18 01:37:03 2012 (+0900)
;; Last-Updated: 2013/11/01 22:54:27 (+0900)
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
;; 2013/01/27    Atami
;;    Modified: `rotate-text-predefine'
;;    remove ("t" "nil") from `rotate-text-rotajtions'
;;
;; 2012/12/18    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'rotate-text "rotate-text" 'noerr))

;;;###autoload
(defun rotate-text-mode-predefine ()
  "For `eval-after-load' rotate-text function."
  (message "eval-after-load: \"rotate-text\" setting..")
  (setq-default rotate-text-rotations '(("true" "false")
                                        ("True" "False")
                                        ("TRUE" "FALSE")
                                        ("yes"  "no")
                                        ("Yes"  "No")
                                        ("YES"  "NO")
                                        ("width" "height")
                                        ("start" "end")
                                        ("left" "right")
                                        ("top" "down")
                                        ))
  )



(provide 'rotate-text_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; rotate-text_plugin_start.el ends here
