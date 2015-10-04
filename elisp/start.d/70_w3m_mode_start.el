;;; 70_w3m_mode_start.el ---  Setting for w3m mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:29:12 2012 (+0900)
;; Last-Updated: 2015/10/04 16:39:43 (+0900)
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
;; 2012/12/10    Atami
;;    Moved: Moved functions to w3m_mode_start.el
;;    `w3m-mode-hook-predefine', `w3m-mode-predefine'
;;    `w3m-mode-map-predefine', `rand-w3m-view-this-url-background-session'
;;    `w3m-toggle-ja-en-google-url', `w3m-change-google-result-time-range'
;;    `w3m-google-result-year', `w3m-google-result-month'
;;    `w3m-google-result-week', `w3m-google-result-day'
;;    `w3m-google-result-hours', `w3m-new-tab'
;;    `w3m-browse-url-new-tab' ,`my-w3m-forward-seq'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  )


(autoload 'w3m "w3m" "launch w3m browser" t)
(autoload 'w3m-search "w3m-search" "Search QUERY using SEARCH-ENGIN." t)
(autoload 'w3m-find-file "w3m" "w3m interface function for local file." t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-db-history "w3m" "Display arrived URLs." t)
(autoload 'w3m-search-new-session "w3m-search"
  "Search QUERY using SEARCH-ENGIN." t)
(autoload 'w3m-goto-url-new-session "w3m" "Visit URL in a new session." t)

;; Global Binding
(define-many-keys global-map
  ("\C-xws"    'w3m-search-new-session)
  ("\C-xw\C-s" 'w3m-search)
  ("\C-xwf"    'w3m-find-file)
  ("\C-xwu"    'w3m-goto-url-new-session)
  ("\C-xwh"    'w3m-db-history)
  ("\C-xww"    'w3m)
  ;; ("\C-xwb"    'helm-w3m-bookmarks)
  )

(defvar w3m-eval-after-load-hook nil
  "Hook for w3m `eval-after-load'.")
(add-hook 'w3m-eval-after-load-hook 'w3m-mode-custom-predefine)
(add-hook 'w3m-eval-after-load-hook 'w3m-mode-predefine 'append)
(add-hook 'w3m-eval-after-load-hook 'w3m-mode-map-predefine 'append)
(add-hook 'w3m-eval-after-load-hook 'w3m-mode-face-predefine 'append)
(run-hooks-after-load "w3m" 'w3m-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 70_w3m_mode_start.el ends here
