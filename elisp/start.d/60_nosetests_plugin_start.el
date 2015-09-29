;;; 60_nosetests_plugin_start.el ---
;;
;; Copyright (C) 2014 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2014/12/24 13:04:09 (+0900)
;; Last-Updated: 2014/12/24 13:04:34 (+0900)
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
;;; Code:


(defvar nosetests-eval-after-load-hook nil
  "Hook for nosetests `eval-after-load'.")
(add-hook 'nosetests-eval-after-load-hook 'nosetests-mode-custom-predefine)
(add-hook 'nosetests-eval-after-load-hook 'nosetests-mode-predefine 'append)
(add-hook 'nosetests-eval-after-load-hook 'nosetests-mode-map-predefine 'append)
(add-hook 'nosetests-eval-after-load-hook 'nosetests-mode-face-predefine 'append)
(run-hooks-after-load "nosetests" 'nosetests-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 60_nosetests_plugin_start.el ends here
