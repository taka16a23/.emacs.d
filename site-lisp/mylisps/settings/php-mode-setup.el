;;; php-mode-setup.el ---
;;
;; Copyright (C) 2016 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2016/01/30 17:05:50 (+0900)
;; Last-Updated:2016/01/30 17:23:19 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (package-initialize))

;; (use-package php-mode
;;   ;; :disabled
;;   :defer
;;   ;; :commands php-mode
;;   ;; :mode (("\\.php\\'" . php-mode)
;;          ;; )
;;   :init
;;   ;; (require 'php-mode "php-mode" 'noerr)
;;   :config
;;   (message "Loading \"php-mode\"")
;;   )

(use-package php-mode
  :ensure t
  :mode "\\.php[345]?\\'")



(provide 'php-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; php-mode-setup.el ends here
