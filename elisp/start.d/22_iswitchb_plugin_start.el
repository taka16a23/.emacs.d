;;; 22_iswitchb_plugin_start.el --- Setting for iswitchb
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/02/14 08:04:49 (+0900)
;; Last-Updated: 2013/11/25 00:17:32 (+0900)
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
;; 2013/10/28    Atami
;;    splited file: `iswitchb-mode-predefine',
;;    `iswitchb-define-mode-map-predefine', `iswitchb-exhibit',
;;    `iswitchb-exit-anything', `iswitchb-input-anything',
;;    to iswitchb-plugin_start.el
;;
;; 2013/10/17    Atami
;;    Added: `iswitchb-input-anything' input string from iswitchb.
;;    fixed: `iswitchb-exit-anything' for above.
;;
;; 2013/10/16    Atami
;;    fixed: `iswitchb-exit-anything'
;;    freezed buged when execute by null string.
;;
;; 2013/10/16    Atami
;;    advised: `iswitchb-exhibit' for hide beginning of "*" buffer
;;
;; 2013/10/16    Atami
;;    advised: `iswitchb-set-matches' for filitering by space.
;;
;; 2013/02/14    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro nil 'noerr)
  (require 'iswitchb "iswitchb" 'noerr))

;; (autoload 'iswitchb-buffer "iswitchb" nil 'interactive)

(defvar iswitchb-eval-after-load-hook nil
  "Hook for iswitchb `eval-after-load'.")
(add-hook 'iswitchb-eval-after-load-hook 'iswitchb-mode-custom-predefine)
(add-hook 'iswitchb-eval-after-load-hook 'iswitchb-mode-predefine 'append)
(add-hook 'iswitchb-eval-after-load-hook 'iswitchb-mode-map-predefine 'append)
(run-hooks-after-load "iswitchb" 'iswitchb-eval-after-load-hook)

(add-hook 'after-init-hook '(lambda ()
                              (when (require 'iswitchb "iswitchb")
                                (iswitchb-mode 1))))
;; (remove-hook 'after-init-hook '(lambda () ))



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 22_iswitchb_plugin_start.el ends here
