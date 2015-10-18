;;; linux-face.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/15 02:59:06 (+0900)
;; Last-Updated:2015/10/15 03:01:28 (+0900)
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


(when (and (or window-system
               (daemonp))
           (or (file-exists-p "/usr/share/fonts/truetype/RictyDiscord-Regular.ttf")
               (file-exists-p (expand-file-name ".font/RictyDiscord-Regular.ttf" "~"))))
  (set-face-attribute 'default nil
                      :family "Ricty Discord"
                      ;; :family "Ricty"
                      :height 130
                      )
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "Ricty Discord")))



(provide 'linux-face)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; linux-face.el ends here
