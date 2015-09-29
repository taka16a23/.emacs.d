;;; auto-async-byte-compile_plugin_start.el --- functions for auto-async-byte-compile
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 17 22:38:16 2012 (+0900)
;; Last-Updated: 2013/11/01 16:07:52 (+0900)
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
;;    Added: `auto-async-byte-compile-mode-custom-predefine',
;;    `auto-async-byte-compile-mode-predefine'
;;    for `eva-after-load'
;;
;; 2012/12/17    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'auto-async-byte-compile "auto-async-byte-compile" 'noerr))

;;;###autoload
(defun auto-async-byte-compile-mode-custom-predefine ()
  "For `eval-after-load' auto-async-byte-compile customize."
  (message "eval-after-load: \"auto-async-byte-compile\" customizing..")
  (custom-set-variables
   '(auto-async-byte-compile-init-file
     (expand-file-name  "elisp/start.d/subroutines_start.el"
                        user-emacs-directory)))
  )

;;;###autoload
(defun auto-async-byte-compile-mode-predefine ()
  "For `eval-after-load' auto-async-byte-compile function."
  (message "eval-after-load: \"auto-async-byte-compile\" setting..")
  )



(provide 'auto-async-byte-compile_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-async-byte-compile_plugin_start.el ends here
