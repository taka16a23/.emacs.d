;;; sdic-setup.el ---   Setting for sdic
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:53 2012 (+0900)
;; Last-Updated:2015/10/19 15:46:30 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'sdic "sdic" 'noerr)
  (declare-function sdic-select-search-function "sdic"))

;;;###autoload
(defun my-sdic-describe-word-with-popup (word &optional search-function)
  "Display the meaning of word."
  (interactive
   (let ((f (if current-prefix-arg (sdic-select-search-function)))
         (w (sdic-read-from-minibuffer)))
     (list w f)))
  (let ((old-buf (current-buffer))
        (dict-data))
    (set-buffer (get-buffer-create sdic-buffer-name))
    (or (string= mode-name sdic-mode-name) (sdic-mode))
    (erase-buffer)
    (let ((case-fold-search        t)
          (sdic-buffer-start-point (point-min)))
      (if (prog1 (funcall (or search-function
                              (if (string-match "\\cj" word)
                                  'sdic-search-waei-dictionary
                                'sdic-search-eiwa-dictionary))
                          word)
            (set-buffer-modified-p nil)
            (setq dict-data (buffer-string))
            (set-buffer old-buf))
          (popup-tip dict-data :scroll-bar t :truncate nil)
        (message "Can't find word, \"%s\"." word))))
  )

(use-package sdic
  ;; :disabled
  :defer
  :commands sdic-describe-word sdic-describe-word-at-point sdic-mode
  :init
  :config
  (message "Loading \"sdic\"")
  (setq sdic-eiwa-dictionary-list nil
        sdic-waei-dictionary-list nil)
  (cond ((file-exists-p "/usr/share/dict/edict.sdic")
         (setq sdic-eiwa-dictionary-list
               (cons
                '(sdicf-client "/usr/share/dict/edict.sdic")
                sdic-eiwa-dictionary-list))))
  (cond ((file-exists-p "/usr/share/dict/jedict.sdic")
         (setq sdic-waei-dictionary-list
               (cons
                '(sdicf-client "/usr/share/dict/jedict.sdic" (add-keys-to-headword t))
                sdic-waei-dictionary-list))))
  (defadvice sdic-describe-word-at-point (around sdic-popup-advice activate)
    (letf (((symbol-function 'sdic-describe-word)
            (symbol-function 'my-sdic-describe-word-with-popup)))
      ad-do-it))
  )



(provide 'sdic-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; sdic-setup.el ends here
