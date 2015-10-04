;;; 70_e2wm_mode_start.el --- Setting for e2wm mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 23:33:01 2012 (+0900)
;; Last-Updated: 2015/10/04 16:38:48 (+0900)
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
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  )


(autoload 'e2wm:start-management "e2wm" nil t)
(autoload 'e2wm:stop-management  "e2wm" nil t)

(defvar e2wm-eval-after-load-hook nil
  "Hook for e2wm `eval-after-load'.")
(add-hook 'e2wm-eval-after-load-hook 'e2wm-mode-custom-predefine)
(add-hook 'e2wm-eval-after-load-hook 'e2wm-mode-predefine 'append)
(add-hook 'e2wm-eval-after-load-hook 'e2wm-mode-map-predefine 'append)
(add-hook 'e2wm-eval-after-load-hook 'e2wm-mode-face-predefine 'append)
(run-hooks-after-load "e2wm" 'e2wm-eval-after-load-hook)


(eval-when-compile
  (require 't1macro "t1macro"))

;;;###autoload
(defun e2wm-vcs-mode-custom-predefine ()
  "For `eval-after-load' e2wm-vcs customize."
  (message "eval-after-load: \"e2wm-vcs\" customizing..")
  (setq e2wm:c-magit-recipe
        '(| (:left-size-ratio 0.3)
            (- (:upper-size-ratio 0.6)
               status branches)
            (| (:left-size-ratio 0.2)
               (- (:upper-size-ratio 0.5)
                  logs
                  (- (:upper-size-ratio 0.5)
                     main sub))
               diff)))

  (setq e2wm:c-magit-winfo
        '((:name status   :plugin magit-status)
          (:name branches :plugin magit-branches)
          (:name logs     :plugin magit-logs)
          (:name diff     :buffer "*magit-diff*" :default-hide t)
          (:name main)
          (:name sub      :buffer nil :default-hide t)))
  )

;;;###autoload
(defun e2wm-vcs-mode-predefine ()
  "For `eval-after-load' e2wm-vcs function."
  (message "eval-after-load: \"e2wm-vcs\" setting..")

  ;; override
  (defun e2wm:def-plugin-magit-status (frame wm winfo)
    (e2wm:def-plugin-vcs-with-window
     'magit-toplevel
     (lambda (dir topdir)
       (magit-status (file-name-as-directory dir)))
     (lambda () (e2wm:history-get-main-buffer))))

  (defun e2wm:def-plugin-magit-branches (frame wm winfo)
    (e2wm:def-plugin-vcs-with-window
     'magit-toplevel
     (if (fboundp 'magit-branch-manager)
         (lambda (dir topdir) (magit-branch-manager))
       (lambda (dir topdir) (magit-show-branches)))
     (lambda () (e2wm:def-plugin-vcs-na-buffer "Git N/A"))))

  (defun e2wm:def-plugin-magit-logs (frame wm winfo)
    (e2wm:def-plugin-vcs-with-window
     'magit-toplevel
     (lambda (dir topdir)
       (magit-log nil))
     (lambda () (e2wm:def-plugin-vcs-na-buffer "Git N/A"))))

  (defun e2wm:dp-magit-popup (buf)
    (let ((cb (current-buffer)))
      (e2wm:message "#DP MAGIT popup : %s (current %s / backup %s)"
                    buf cb e2wm:override-window-cfg-backup))
    (unless (e2wm:vcs-select-if-plugin buf)
      (let ((buf-name (buffer-name buf))
            (wm (e2wm:pst-get-wm))
            (not-minibufp (= 0 (minibuffer-depth))))
        (e2wm:with-advice
         (cond
          ((equal buf-name "COMMIT_EDITMSG")
           ;; displaying commit objects in the main window
           (e2wm:pst-buffer-set 'main buf t nil))
          ((string-match "^\\*magit: .*\\*$" buf-name)
           ;; displaying status object in the status window
           (e2wm:pst-buffer-set 'status buf t t))
          ((buffer-file-name buf)
           ;; displaying file buffer in the main window
           (e2wm:pst-buffer-set 'main buf t t))
          (t
           ;; displaying other objects in the sub window
           (e2wm:pst-buffer-set 'sub buf t not-minibufp)))))))
  (defadvice e2wm:dp-magit-popup (around ~e2wm:mng-diff activate)
    (if (string= (buffer-name (ad-get-arg 0)) "*magit-diff*")
        (e2wm:with-advice
         (e2wm:pst-buffer-set 'diff (ad-get-arg 0) t t))
      ad-do-it))
  )


(defvar e2wm-vcs-eval-after-load-hook nil
  "Hook for e2wm-vcs `eval-after-load'.")
(add-hook 'e2wm-vcs-eval-after-load-hook 'e2wm-vcs-mode-custom-predefine)
(add-hook 'e2wm-vcs-eval-after-load-hook 'e2wm-vcs-mode-predefine 'append)
(run-hooks-after-load "e2wm-vcs" 'e2wm-vcs-eval-after-load-hook)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 70_e2wm_mode_start.el ends here
