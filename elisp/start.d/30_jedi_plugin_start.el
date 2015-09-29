;;; 30_jedi_plugin_start.el --- setting for jedi
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 05:06:17 (+0900)
;; Last-Updated: 2015/09/25 00:42:10 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'el-get-bundle "el-get-bundle")
  (require 'python "python" 'noerr))

(el-get-bundle jedi)

(defvar jedi-eval-after-load-hook nil
  "Hook for jedi `eval-after-load'.")
(add-hook 'jedi-eval-after-load-hook 'jedi-mode-custom-predefine)
(add-hook 'jedi-eval-after-load-hook 'jedi-mode-predefine 'append)
(add-hook 'jedi-eval-after-load-hook 'jedi-mode-map-predefine 'append)
(add-hook 'jedi-eval-after-load-hook 'jedi-mode-face-predefine 'append)
(run-hooks-after-load "jedi" 'jedi-eval-after-load-hook)

(autoload 'jedi:goto-definition "jedi-core" nil t)
(autoload 'jedi:show-doc "jedi-core" nil t)
;; (autoload 'jedi:dot-complete "jedi" nil t)


(add-hook 'python-mode-hook 'jedi:setup)
;; (remove-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 30_jedi_plugin_start.el ends here
