;;; auto-complete_plugin_start.el --- functions for auto-complete
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 20:03:48 2012 (+0900)
;; Last-Updated: 2014/03/03 16:48:52 (+0900)
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
;; 2014/03/03    Atami
;;    Fixed: inserted tab when yasnippet enabled.
;;    binding ("\t" 'nil) => ("\t"   'ac-stop)
;;
;; 2013/02/14    Atami
;;    Add: function `reload-auto-complete-mode'
;;    reflesh auto-complete-mode
;;
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro nil 'noerr)
  (require 'subroutines_start "subroutines_start" 'noerr)
  (require 'auto-complete-config nil 'noerr))

;;;###autoload
(defun auto-complete-mode-custom-predefine ()
  "For `eval-after-load' auto-complete customize."
  (message "eval-after-load: \"auto-complete\" customizing..")
  (setq-default ac-comphist-file (concat my-var-dir "ac-comphist.dat")
                ac-sources '(ac-source-yasnippet
                             ac-source-words-in-same-mode-buffers))
  (custom-set-variables
   '(ac-auto-show-menu    0.4)
   '(ac-use-comphist      t)
   '(ac-use-quick-help    t)
   '(ac-menu-height       8)
   '(ac-quick-help-height 15)
   '(ac-use-menu-map      t)
   '(ac-disable-faces     nil)))

;;;###autoload
(defun auto-complete-mode-predefine ()
  "For `eval-after-load' auto-complete function."
  (message "eval-after-load: \"auto-complete\" setting..")
  (require 'help-mode)
  (require 'auto-complete-config)
  )

;;;###autoload
(defun auto-complete-mode-map-predefine ()
  "For auto-complete key bindings."
  (interactive)
  ;; ac-complete map
  (define-many-keys ac-complete-mode-map
    ("\C-h" 'ac-persist-help)
    ("\t"   'ac-stop)
    ("\C-f" 'ac-isearch)
    ("\C-l" 'ac-stop)
    ("\C-s" 'auto-complete-stop&save))

  ;; menu map
  (define-many-keys ac-menu-map
	("\C-n" 'ac-next)
	("\C-k" 'ac-previous)))

;;;###autoload
(defun auto-complete-stop&save ()
  "Auto complete stop and save."
  (interactive)
  (ac-stop)
  (save-buffer))

;;;###autoload
(defun global-auto-complete-mode-on ()
  "Turn on global auto complete mode."
  (interactive)
  (message "Enabled global auto-complete.")
  (global-auto-complete-mode 1))

;;;###autoload
(defun global-auto-complete-mode-off ()
  "Turn off global auto complete mode."
  (interactive)
  (message "Disabled global auto-complete.")
  (global-auto-complete-mode -1))

;;;###autoload
(defun my-ac-look ()
  "Look コマンドの出力をリストで返す."
  (interactive)
  (unless (executable-find "look")
    (error "look コマンドがありません"))
  (let ((search-word (thing-at-point 'word)))
    (with-temp-buffer
      (call-process-shell-command "look" nil t 0 search-word)
      (split-string-and-unquote (buffer-string) "\n"))))

;; 表示数制限を変更しない場合
;;;###autoload
(defun ac-complete-look ()
  (interactive)
  (auto-complete '(ac-source-look)))

(defvar ac-source-look
  '((candidates .	my-ac-look)
    (requires	.	2)))

;;;###autoload
(defun reload-auto-complete-mode ()
  "Reload auto-complete-mode."
  (interactive)
  (auto-complete-mode -1)
  (auto-complete-mode 1)
  )



(provide 'auto-complete_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-complete_plugin_start.el ends here
