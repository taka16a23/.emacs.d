;;; auto-insert-setup.el ---   setting for autoinsert
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 15:54:56 (+0900)
;; Last-Updated:2015/10/19 12:59:39 (+0900)
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
  (require 'use-package "use-package" 'noerr))

(use-package autoinsert-yas
  :commands (my-junk-auto-insert-elisp
             my-auto-insert-cpp
             my-auto-insert-shscripts
             my-auto-insert-init-python
             my-auto-insert-main-python
             my-junk-auto-insert-python
             my-test-auto-insert-python
             my-junk-auto-insert-elisp
             my-setup-auto-insert-python
             my-auto-insert-python
             ))

(use-package autoinsert
  :defer 2
  :commands auto-insert-mode
  :init
  :config
  (message "Loading \"autoinsert\"")
  (require 'environment-setup "environment-setup" 'noerr)
  (require 'autoinsert-yas "autoinsert-yas" 'noerr)
  (custom-set-variables
   '(auto-insert-directory
     (concat (my-data-dir-join "insert") "/")) ;need end of slash
   '(auto-insert-query nil) ;no prompt before insertion
   '(auto-insert-alist (append
                        '(("\\.junk.el$" . my-junk-auto-insert-elisp))
                        ;; '(("\\.el$" . my-auto-insert-elisp))
                        '(("\\.el$" . make-header))
                        '(("__init__\\.py$" . my-auto-insert-init-python))
                        '(("__main__\\.py$" . my-auto-insert-main-python))
                        '(("\\.junk\\.py$" . my-junk-auto-insert-python))
                        '(("test_.+\\.py$" . my-test-auto-insert-python))
                        '(("setup\\.py$" . my-setup-auto-insert-python))
                        '(("\\.py$" . my-auto-insert-python))
                        '(("\\.pyx$" . my-auto-insert-python))
                        '(("\\.cc$" . my-auto-insert-cpp))
                        '(("\\.cpp$" . my-auto-insert-cpp))
                        '(("zsh/scripts/_.+\\.sh$" . my-auto-insert-shscripts))
                        auto-insert-alist)))
  (define-auto-insert "\\.rb$" "ruby-template.rb")
  (define-auto-insert "\\.sh$" "sh-template.sh")
  (define-auto-insert "\\.org$" "org-template.org")
  (define-auto-insert "\\.timer$" "systemd-template.timer")
  (define-auto-insert "\\.service$" "systemd-template.service")
  (define-auto-insert "\\.socket$" "systemd-template.socket")
  (define-auto-insert "\\.mount$" "systemd-template.mount")
  (define-auto-insert "\\.automount$" "systemd-template.automount")
  (define-auto-insert "\\.slice$" "systemd-template.slice")
  (define-auto-insert "\\.path$" "systemd-template.path")
  (define-auto-insert "\\.device$" "systemd-template.device")
  (define-auto-insert "\\.snapshot$" "systemd-template.snapshot")
  (define-auto-insert "\\.scope$" "systemd-template.scope")
  (define-auto-insert "\\.target$" "systemd-template.target")
  (auto-insert-mode 1)
  )



(provide 'auto-insert-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-insert-setup.el ends here
