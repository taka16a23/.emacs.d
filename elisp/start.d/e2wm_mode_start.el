;;; e2wm_mode_start.el --- functions for e2wm mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.1
;; Created:      Tue Dec 11 23:35:08 2012 (+0900)
;; Last-Updated: 2015/10/01 10:23:22 (+0900)
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
;; 2015/09/21    Atami
;;    Fixed: `prev-selected-buffer' to `e2wm:prev-selected-buffer'
;;    `prev-selected-buffer' is obsoleted.
;;
;; 2015/09/15    Atami
;;    Modified: `e2wm-c-code-predefine', `e2wm-pycode-predefine',
;;    `e2wm-elisp-predefine', left upper of file perspective size 30 to 50.
;;
;; 2015/06/11    Atami
;;    Modified: `e2wm-pycode-predefine'
;;    no query exit ipython process
;;
;; 2015/01/06    Atami
;;    Modified: `e2wm-pycode-predefine'
;;    set pylib dired in files if launched `e2wm:dp-pycode'
;;
;; 2013/11/29    Atami
;;    Added: `e2wm-elisp-predefine' new perspective for elisp.
;;
;; 2013/11/29    Atami
;;    Removed: replaced and defined by macro.
;;    `e2wm:navi-files-command',
;;    `e2wm:navi-imenu-command',
;;    `e2wm:navi-history-command',
;;    `e2wm:navi-main-command',
;;    `e2wm:navi-sub-command',
;;    `e2wm:history-show-command',
;;    `e2wm:imenu-show-command',
;;    `e2wm:sub-show-command',
;;    `e2wm:files-show-command',
;;    `e2wm:history-hide-command',
;;    `e2wm:imenu-hide-command',
;;    `e2wm:files-hide-command',
;;    `e2wm:sub-hide-command',
;;    `e2wm:history-toggle-command',
;;    `e2wm:files-toggle-command',
;;    `e2wm:sub-toggle-command',
;;    `e2wm:dp-pycode',
;;    `e2wm:dp-pycode-navi-main-command',
;;    `e2wm:dp-pycode-navi-imenu-command',
;;    `e2wm:dp-pycode-imenu-toggle-command',
;;    `e2wm:dp-pycode-imenu-hide-command',
;;    `e2wm:dp-pycode-imenu-show-command',
;;    `e2wm:dp-pycode-navi-history-command',
;;    `e2wm:dp-pycode-history-toggle-command',
;;    `e2wm:dp-pycode-history-hide-command',
;;    `e2wm:dp-pycode-history-show-command',
;;    `e2wm:dp-pycode-navi-files-command',
;;    `e2wm:dp-pycode-files-toggle-command',
;;    `e2wm:dp-pycode-files-hide-command',
;;    `e2wm:dp-pycode-files-show-command',
;;    `e2wm:dp-pycode-navi-sub-command',
;;    `e2wm:dp-pycode-sub-toggle-command',
;;    `e2wm:dp-pycode-sub-hide-command',
;;    `e2wm:dp-pycode-sub-show-command',
;;    `e2wm:dp-pycode-navi-upsub-command',
;;    `e2wm:dp-pycode-upsub-toggle-command',
;;    `e2wm:dp-pycode-upsub-hide-command',
;;    `e2wm:dp-elispcode',
;;    `e2wm:dp-pycode-upsub-show-command',
;;    `e2wm:dp-pycode-navi-right-command',
;;    `e2wm:dp-web',
;;    `e2wm:dp-book',
;;
;; 2013/11/29    Atami
;;    Added: macro `defe2wm:pst-change', `defe2wm:navi-simple-command',
;;    `defe2wm:navi&show-command', `defe2wm:win-command'
;;
;; 2013/11/25    Atami
;;    Fixed: `e2wm-pycode-predefine', set in cond `launch-term' as else.
;;
;; 2013/11/23    Atami
;;    Added: `e2wm:dp-pycode-navi-sub-ipython'
;;
;; 2013/11/15    Atami
;;    Added: `e2wm-pycode-predefine', `e2wm-web-predefine',
;;    `e2wm-book-predefine'
;;
;; 2013/11/15    Atami
;;    Modified: `e2wm:toggle-start-stop' start pycode.
;;
;; 2013/09/27    Atami
;;    Modified: Modified: `e2wm:c-code-recipe', `e2wm:c-code-winfo'
;;    add history plugin
;;
;; 2013/02/04    Atami
;;    Modified: `e2wm:c-code-recipe', `e2wm:c-code-winfo'
;;
;; 2013/02/04    Atami
;;    Add: `e2wm:toggle-start-stop'
;;    toggle e2wm minor mode
;;
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (defvar e2wm:prev-selected-buffer)
  (defvar e2wm:prefix-key)
  (defvar e2wm:pst-minor-mode-keymap)
  (defvar e2wm:def-plugin-files-mode-map)
  (defvar e2wm:override-window-cfg-backup)
  (defvar e2wm:c-code-show-main-regexp)
  (defvar e2wm:c-code-recipe)
  (defvar e2wm:c-code-winfo)
  (require 't1macro "t1macro" 'noerr)
  (require 'e2wm "e2wm" 'noerr)
  (require 'windmove-or-split "windmove-or-split" 'noerr))

;;;###autoload
(defun e2wm-mode-custom-predefine ()
  "For `eval-after-load' e2wm customize."
  (message "eval-after-load: \"e2wm\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun e2wm-mode-predefine ()
  "For `eval-after-load' e2wm function."
  (message "eval-after-load: \"e2wm\" setting..")
  (unless (e2wm-c-code-predefine)
    (message "Failed e2wm define c code."))
  (unless (e2wm-pycode-predefine)
    (message "Failed e2wm define pycode."))
  (unless (e2wm-web-predefine)
    (message "Failed e2wm define web."))
  (unless (e2wm-book-predefine)
    (message "Failed e2wm define book."))
  (unless (e2wm-elisp-predefine)
    (message "Failed e2wm define elispcode." ))
  (load "e2wm-vcs" 'noerr)
  (setf (e2wm:$pst-class-main (e2wm:pst-class-get 'magit)) 'status)
  )

;;;###autoload
(defun e2wm-mode-map-predefine ()
  "For e2wm key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"e2wm\" keymaping.."))
  ;; (define-many-keys ctl-colon-map
  ;;   ("B" 'e2wm:dp-book)
  ;;   ("P" 'e2wm:dp-pycode)
  ;;   ("W" 'e2wm:dp-web)
  ;;   ("S" 'e2wm:dp-svn)
  ;;   ("T" 'e2wm:dp-two)
  ;;   ("D" 'e2wm:dp-doc)
  ;;   ("C" 'e2wm:dp-code)
  ;;   ("E" 'e2wm:dp-elispcode))
  (define-many-keys e2wm:pst-minor-mode-keymap
    ((kbd "M-P") 'e2wm:dp-pycode)
    ((kbd "M-E") 'e2wm:dp-elispcode)
    ((kbd "M-T") 'e2wm:dp-two)
    ((kbd "M-Z") 'e2wm:dp-term)
    ((kbd "M-&") 'e2wm:dp-doc)
    ((kbd "M-B") 'e2wm:dp-book)
    ((kbd "M-W") 'e2wm:dp-web)
    ((kbd "M-!") 'e2wm:dp-svn)
    ((kbd "M-)") 'e2wm:dp-code)
    ((kbd "M-C") 'e2wm:dp-code)
    ((kbd "M-V") 'e2wm:dp-magit)
    ("\M-N" 'e2wm:windmove-down-or-splitmove)
    ("\M-K" 'e2wm:windmove-up-or-splitmove)
    )
  ;;;; perspective files
  (define-many-keys e2wm:def-plugin-files-mode-map
    ([backspace] 'e2wm:def-plugin-files-updir-command)
    (        "D" 'e2wm:def-plugin-files-delete-command)
    (        "+" 'e2wm:def-plugin-files-mkdir-command)
    (        "r" 'e2wm:def-plugin-files-rename-command)
    (    "\C-cd" 'e2wm:def-plugin-files-open-dired-command)
    )
  )

;;;###autoload
(defun e2wm-mode-face-predefine ()
  "For e2wm face."
  (message "eval-after-load: \"e2wm\" Setting faces..")
  (face-spec-set 'e2wm:face-history-list-normal '((t :foreground "White")))
  )

(defmacro defe2wm:pst-change (dpname)
  "Macro to create e2wm pst-change command."
  `(defun ,(intern (concat "e2wm:dp-" (symbol-name dpname))) ()
     (interactive)
     (e2wm:pst-change ',dpname)))

(defe2wm:pst-change pycode)
(defe2wm:pst-change elispcode)
(defe2wm:pst-change web)
(defe2wm:pst-change book)

;;;###autoload
(defun e2wm:toggle-start-stop ()
  (interactive)
  (if (and (boundp 'e2wm:pst-minor-mode)
           e2wm:pst-minor-mode)
      (e2wm:stop-management)
    (e2wm:start-management)
    (e2wm:pst-window-plugin-set (e2wm:pst-get-wm) 'right nil)
    (e2wm:pst-update-windows)))

;;;###autoload
(defun e2wm:windmove-down-or-splitmove (&optional args)
  "Try window move down. If not exist window then split it vertically"
  (interactive "p")
  (if (eq args 4)
      (progn (split-window-vertically)
             (windmove-down))
    (windmove-or-splitmove 'windmove-down 'split-window-vertically 'nosplit)))

;;;###autoload
(defun e2wm:windmove-up-or-splitmove (&optional args)
  "Try window move up. If not exist window then split it vertically"
  (interactive "p")
  (if (eq args 4)
      (progn (split-window-vertically)
             (windmove-up))
    (windmove-or-splitmove 'windmove-up 'split-window-vertically 'nosplit)))

;;;; navi command
;;
(defmacro defe2wm:navi-simple-command (winname) ;[2013/11/29]
  "Macro to create e2wm navigation command."
  `(defun ,(intern (concat "e2wm:navi-" (symbol-name winname) "-command")) ()
     (interactive)
     (e2wm:pst-window-select ',winname)))

(defmacro defe2wm:navi&show-command (winname) ;[2013/11/29]
  "Macro to create e2wm show and navigation command."
  `(defun ,(intern (concat "e2wm:navi-" (symbol-name winname) "-command")) ()
     (interactive)
     (let ((wm (e2wm:pst-get-wm))
           (winfo-name ',winname))
       (unless (wlf:window-shown-p
                (wlf:get-winfo winfo-name (wlf:wset-winfo-list wm)))
         (wlf:show wm winfo-name))
       (wlf:select wm winfo-name)
       (e2wm:pst-update-windows))))

;;;; display command
;;
(defmacro defe2wm:win-command (action pstname)
  "Macro to create e2wm show command."
  `(defun ,(intern
            (concat "e2wm:"
                    (symbol-name action) "-"
                    (symbol-name pstname) "-command")) ()
                    (interactive)
                    (,(intern (concat "wlf:" (symbol-name action)))
                     (e2wm:pst-get-wm) ',pstname)
                    (e2wm:pst-update-windows)))

;; navi
(defe2wm:navi-simple-command main)
(defe2wm:navi-simple-command right)
(defe2wm:navi&show-command files)
(defe2wm:navi&show-command imenu)
(defe2wm:navi&show-command history)
(defe2wm:navi&show-command sub)
(defe2wm:navi&show-command upsub)
;; show
(defe2wm:win-command show history)
(defe2wm:win-command show imenu)
(defe2wm:win-command show sub)
(defe2wm:win-command show files)
(defe2wm:win-command show upsub)
;; hide
(defe2wm:win-command hide history)
(defe2wm:win-command hide imenu)
(defe2wm:win-command hide sub)
(defe2wm:win-command hide files)
(defe2wm:win-command hide upsub)
;; toggle
(defe2wm:win-command toggle history)
(defe2wm:win-command toggle imenu)
(defe2wm:win-command toggle sub)
(defe2wm:win-command toggle files)
(defe2wm:win-command toggle upsub)

(defun e2wm:navi-sub-term-command () ;[2013/11/23]
  ""
  (interactive)
  (let ((key (cond
              ((eq last-input-event 48) 0) ; 0
              ((eq last-input-event 49) 1) ; 1
              ((eq last-input-event 50) 2) ; 2
              ((eq last-input-event 51) 3) ; 3
              ((eq last-input-event 52) 4) ; 4
              ((eq last-input-event 53) 5) ; 5
              ((eq last-input-event 54) 6) ; 6
              ((eq last-input-event 55) 7) ; 7
              ((eq last-input-event 56) 8) ; 8
              ((eq last-input-event 57) 9) ; 9
              ((eq last-input-event 95) 0) ; _
              ((eq last-input-event 33) 1) ; !
              ((eq last-input-event 34) 2) ; "
              ((eq last-input-event 35) 3) ; #
              ((eq last-input-event 36) 4) ; $
              ((eq last-input-event 37) 5) ; %
              ((eq last-input-event 38) 6) ; &
              ((eq last-input-event 39) 7) ; '
              ((eq last-input-event 40) 8) ; (
              ((eq last-input-event 41) 9) ; )
              (t nil)))
        buf)
    (e2wm:pst-window-select 'sub)
    (cond ((eq key 0) (funcall 'launch-term))
          ((and (numberp key)
                (setq buf (get-buffer (format "*terminal<%s>*" key))))
           (e2wm:pst-buffer-set 'sub buf))
          (t (funcall launch-term)))))

(defun e2wm-hide-command () ;[2013/11/15]
  ""
  (interactive)
  (let ((wm (e2wm:pst-get-wm))
        (selected-win (selected-window)))
    (cond ((eq selected-win (wlf:get-window wm 'sub))
           (wlf:hide (e2wm:pst-get-wm) 'sub)
           (e2wm:pst-update-windows))
          ((eq selected-win (wlf:get-window wm 'imenu))
           (wlf:hide (e2wm:pst-get-wm) 'imenu)
           (e2wm:pst-update-windows))
          ((eq selected-win (wlf:get-window wm 'upsub))
           (wlf:hide (e2wm:pst-get-wm) 'upsub)
           (e2wm:pst-update-windows))
          ((eq selected-win (wlf:get-window wm 'files))
           (wlf:hide (e2wm:pst-get-wm) 'files)
           (e2wm:pst-update-windows))
          ((eq selected-win (wlf:get-window wm 'history))
           (wlf:hide (e2wm:pst-get-wm) 'history)
           (e2wm:pst-update-windows))
          )))

;;;; Perspective definition
;;
(defun e2wm-c-code-predefine () ;[2013/11/22]
  ""
  (message "Defining Perspective c code.")
  (setq e2wm:c-code-recipe
        '(| (:left-max-size 28)
            ;; left
            (- (:upper-max-size 50)
               files
               (- (:upper-max-size 20)
                  imenu history))
            (| (:left-max-size 84) ;linum +4
               ;; center
               (- (:upper-max-size 20) upsub main)
               ;; right
               (- (:lower-max-size 22) right sub))))
  (setq e2wm:c-code-winfo
        '((:name main)
          (:name upsub     :default-hide t)
          (:name files     :plugin dired)
          (:name imenu     :plugin imenu :default-hide nil)
          (:name history   :plugin history-list :default-hide t)
          (:name right     :default-hide nil)
          (:name sub :buffer "*info*" :default-hide nil)))
  ;; OVERRIDE
  (defun e2wm:dp-code-switch (buf)
    (if (e2wm:history-recordable-p buf)
        (let ((buf-name (buffer-name buf))
              (wm (e2wm:pst-get-wm)))
          (cond ((string-match "\*w3m\*" buf-name)
                 (e2wm:pst-buffer-set 'right buf)
                 t)
                ((eq (selected-window) (wlf:get-window wm 'right))
                 (e2wm:pst-buffer-set 'right buf)
                 t)
                ((eql (get-buffer buf) (wlf:get-buffer wm 'main))
                 (e2wm:pst-update-windows)
                 (e2wm:pst-buffer-set 'main buf)
                 t)
                (t (e2wm:pst-show-history-main)
                   (e2wm:pst-window-select-main))))))
  t)

;;;; pycode
;;
;;;###autoload
(defun e2wm:start-direct-pycode () ;[2015/09/30]
  ""
  (interactive)
  (when (not (and (boundp 'e2wm:pst-minor-mode) e2wm:pst-minor-mode))
    (e2wm:start-management)
    (e2wm:dp-pycode)))

(defun e2wm-pycode-predefine () ;[2013/11/15]
  (message "Defining Perspective pycode.")
  (defvar e2wm:py-code-recipe)
  (setq e2wm:py-code-recipe
        '(| (:left-max-size 32)
            ;; left
            (- (:upper-max-size 50)
               files
               (- (:upper-max-size 20)
                  imenu history))
            (| (:left-max-size 88) ;linum +4
               ;; center
               (- (:upper-max-size 20) upsub main)
               ;; right
               (- (:lower-max-size 22) right sub))))
  (defvar e2wm:py-code-winfo)
  (setq e2wm:py-code-winfo
        '((:name main)
          (:name upsub   :default-hide t)
          (:name files   :plugin dired)
          (:name imenu   :plugin imenu :default-hide nil)
          (:name history :plugin history-list :default-hide t)
          (:name right   :default-hide nil)
          (:name sub     :default-hide nil)))
  (defvar e2wm:py-code-show-main-regexp
    "\\*\\(vc-diff\\)\\*")
  (autoload 'w3m-list-buffers "w3m-util")
  (defvar e2wm:dp-pycode-minor-mode-map)
  (setq e2wm:dp-pycode-minor-mode-map
        (e2wm:define-keymap
         '(("C-x 0"   . e2wm-hide-command)
           ;; toggle
           ("C-u M-F" . e2wm:toggle-files-command)
           ("C-u M-I" . e2wm:toggle-imenu-command)
           ("C-u M-H" . e2wm:toggle-history-command)
           ("C-u M-S" . e2wm:toggle-sub-command)
           ("C-u M-U" . e2wm:toggle-upsub-command)
           ("C-u M-M" . e2wm:dp-code-main-maximize-toggle-command)
           ("M-U"     . e2wm:toggle-upsub-command)
           ;; navi
           ("M-D"     . e2wm:navi-main-command)
           ("C-: C-m"     . e2wm:navi-main-command)
           ("M-F"     . e2wm:navi-files-command)
           ("C-: f"     . e2wm:navi-files-command)
           ("M-I"     . e2wm:navi-imenu-command)
           ("C-: i"     . e2wm:navi-imenu-command)
           ("M-H"     . e2wm:navi-history-command)
           ("C-: h"     . e2wm:navi-history-command)
           ("C-: C-h"     . e2wm:navi-history-command)
           ("M-S"     . e2wm:navi-sub-command)
           ("M-R"     . e2wm:navi-right-command)
           ("C-: r"     . e2wm:navi-right-command)
           ("C-: C-r"     . e2wm:navi-right-command)
           ("C-: 0"   . e2wm:navi-sub-term-command)
           ("C-: 1"   . e2wm:navi-sub-term-command)
           ("C-: 2"   . e2wm:navi-sub-term-command)
           ("C-: 3"   . e2wm:navi-sub-term-command)
           ("C-: C-i" . e2wm:dp-pycode-navi-sub-ipython)
           ("C-: M-C-i" . e2wm:dp-pycode-navi-relaunch-sub-ipython)
           ("C-x K" . e2wm:dp-pycode-navi-relaunch-sub-ipython)
           )
         nil))
  (e2wm:pst-class-register
   (make-e2wm:$pst-class
    :name   'pycode
    :title  "PythonCoding"
    :extend 'base
    :init   'e2wm:dp-pycode-init
    :start  'e2wm-pycode-start
    :main   'main
    :switch 'e2wm:dp-pycode-switch
    :popup  'e2wm:dp-pycode-popup
    :keymap 'e2wm:dp-pycode-minor-mode-map))
  t)

(defun e2wm:dp-pycode-init ()
  (let*
      ((code-wm
        (wlf:no-layout
         e2wm:py-code-recipe
         e2wm:py-code-winfo))
       (buf (or e2wm:prev-selected-buffer
                (e2wm:history-get-main-buffer)))
       (ipython-buf (get-buffer "*IPython*"))
       (w3m-buffers (w3m-list-buffers t))
       (pylib-dired (dired-noselect (expand-file-name "~/.pylib")))
       )
    ;; set ipython in sub
    (unless ipython-buf
      (setq ipython-buf (funcall 'ipython)))
    (wlf:set-buffer code-wm 'sub ipython-buf)
    ;; set w3m in right if exists
    (when w3m-buffers
      (wlf:set-buffer code-wm 'right (car w3m-buffers)))
    ;; set pylib dired in files
    (when pylib-dired
                                        ; TODO: (Atami) [2015/01/06]
                                        ; failed switch
      (wlf:set-buffer code-wm 'files pylib-dired))
    ;; main
    (when (e2wm:history-recordable-p e2wm:prev-selected-buffer)
      (e2wm:history-add e2wm:prev-selected-buffer))
    (wlf:set-buffer code-wm 'main buf)
    code-wm))

(defun e2wm:dp-pycode-switch (buf)
  (if (e2wm:history-recordable-p buf)
      (let ((buf-name (buffer-name buf))
            (wm (e2wm:pst-get-wm)))
        (cond ((string-match "\\*w3m\\*" buf-name)
               (e2wm:pst-buffer-set 'right buf)
               t)
              ((eq (selected-window) (wlf:get-window wm 'right))
               (e2wm:pst-buffer-set 'right buf)
               t)
              ((eql (get-buffer buf) (wlf:get-buffer wm 'main))
               (e2wm:pst-update-windows)
               (e2wm:pst-buffer-set 'main buf)
               t)
              (t (e2wm:pst-show-history-main)
                 (e2wm:pst-window-select-main))))))

(defun e2wm:dp-pycode-popup-upsub (buf)
  (let ((wm (e2wm:pst-get-wm))
        (not-minibufp (= 0 (minibuffer-depth))))
    (e2wm:with-advice
     (e2wm:pst-buffer-set 'upsub buf t not-minibufp))))

(defun e2wm:dp-pycode-popup-sub (buf)
  (let ((wm (e2wm:pst-get-wm))
        (not-minibufp (= 0 (minibuffer-depth))))
    (e2wm:with-advice
     (e2wm:pst-buffer-set 'sub buf t not-minibufp))))

(defun e2wm:dp-pycode-popup (buf)
  (let ((buf-name (buffer-name buf))
        (wm (e2wm:pst-get-wm)))
    (cond ((e2wm:history-recordable-p buf)
           (e2wm:pst-show-history-main)
           ;;記録対象なら履歴に残るのでupdateで表示を更新させる
           t)
          ((and e2wm:override-window-cfg-backup
                (eq (selected-window) (wlf:get-window wm 'sub)))
           ;;現在subならmainに表示しようとする
           ;;minibuffer以外の補完バッファは動きが特殊なのでbackupをnilにする
           (setq e2wm:override-window-cfg-backup nil)
           ;;一時的に表示するためにset-window-bufferを使う
           ;;(prefix) C-lなどで元のバッファに戻すため
           (set-window-buffer (wlf:get-window wm 'right) buf)
           t)
          ((and e2wm:c-code-show-main-regexp
                (string-match e2wm:c-code-show-main-regexp buf-name))
           (e2wm:pst-buffer-set 'main buf t)
           t)
          (t
           (e2wm:dp-pycode-popup-sub buf)
           t))))

(defun e2wm-pycode-start (wm) ;[2013/11/15]
  "WM"
  (let ((buffers (buffer-list))
        (regexp "\\.py$")
        done)
    (while (and buffers (not done))
      (when (string-match regexp (buffer-name (car buffers)))
        (setq done (car buffers)))
      (setq buffers (cdr buffers)))
    (when done
      (wlf:set-buffer wm 'main done))))

(defun e2wm:dp-pycode-navi-sub-ipython () ;[2013/11/23], [2015/06/11]
  ""
  (interactive)
  (let ((wm (e2wm:pst-get-wm))
        (winfo-name 'sub)
        (ipython-buf (get-buffer "*IPython*")))
    (unless ipython-buf
      (setq ipython-buf (funcall 'ipython)))
    (e2wm:pst-buffer-set winfo-name ipython-buf)
    (unless (wlf:window-shown-p
             (wlf:get-winfo winfo-name (wlf:wset-winfo-list wm)))
      (wlf:show wm winfo-name))
    (e2wm:pst-window-select winfo-name))
  ;; no query exit process
  (when (process-list)
    (dolist (p (process-list))
      (when (s-starts-with? "ipython" (process-name p))
        (set-process-query-on-exit-flag p nil)))))

;;;; elisp
;;
(defun e2wm-elisp-predefine () ;[2013/11/28]
  ""
  (message "Defining Perspective emacs lisp.")
  (defvar e2wm:elisp-code-recipe)
  (setq e2wm:elisp-code-recipe
        '(| (:left-max-size 32)
            ;; left
            (- (:upper-max-size 50)
               files
               (- (:upper-max-size 20)
                  imenu history))
            (| (:left-max-size 88) ;linum +4
               ;; center
               main
               ;; right
               (- (:lower-max-size 22) right sub))))
  (defvar e2wm:elisp-code-winfo)
  (setq e2wm:elisp-code-winfo
        '((:name main)
          (:name files   :plugin dired)
          (:name imenu   :plugin imenu)
          (:name history :plugin history-list :default-hide t)
          (:name right)
          (:name sub)))

  (defun e2wm:dp-elispcode-init ()
    (let*
        ((code-wm
          (wlf:no-layout
           e2wm:elisp-code-recipe
           e2wm:elisp-code-winfo))
         (buf (or e2wm:prev-selected-buffer
                  (e2wm:history-get-main-buffer)))
         (scratch-buf (get-buffer "*scratch*"))
         (w3m-buffers (w3m-list-buffers t)))
      ;; set ipython in sub
      (wlf:set-buffer code-wm 'sub scratch-buf)
      ;; set w3m in right if exists
      (when w3m-buffers
        (wlf:set-buffer code-wm 'right (car w3m-buffers)))
      ;; main
      (when (e2wm:history-recordable-p e2wm:prev-selected-buffer)
        (e2wm:history-add e2wm:prev-selected-buffer))
      (wlf:set-buffer code-wm 'main buf)
      code-wm))

  (defun e2wm:dp-elispcode-switch (buf)
    (if (e2wm:history-recordable-p buf)
        (let ((buf-name (buffer-name buf))
              (wm (e2wm:pst-get-wm)))
          (cond ((string-match "\\*w3m\\*" buf-name)
                 (e2wm:pst-buffer-set 'right buf)
                 t)
                ((eq (selected-window) (wlf:get-window wm 'right))
                 (e2wm:pst-buffer-set 'right buf)
                 t)
                ((eql (get-buffer buf) (wlf:get-buffer wm 'main))
                 (e2wm:pst-update-windows)
                 (e2wm:pst-buffer-set 'main buf)
                 t)
                (t (e2wm:pst-show-history-main)
                   (e2wm:pst-window-select-main))))))
    (defvar e2wm:dp-elispcode-minor-mode-map)
  (setq e2wm:dp-elispcode-minor-mode-map
        (e2wm:define-keymap
         '(("C-x 0"   . e2wm-hide-command)
           ;; toggle
           ("C-u M-F" . e2wm:toggle-files-command)
           ("C-u M-I" . e2wm:toggle-imenu-command)
           ("C-u M-H" . e2wm:toggle-history-command)
           ("C-u M-S" . e2wm:toggle-sub-command)
           ("C-u M-U" . e2wm:toggle-upsub-command)
           ("C-u M-M" . e2wm:dp-code-main-maximize-toggle-command)
           ;; navi
           ("M-D"     . e2wm:navi-main-command)
           ("M-F"     . e2wm:navi-files-command)
           ("M-I"     . e2wm:navi-imenu-command)
           ("M-H"     . e2wm:navi-history-command)
           ("M-S"     . e2wm:navi-sub-command)
           ("M-R"     . e2wm:navi-right-command)
           ("C-: 0" . e2wm:navi-sub-term-command)
           ("C-: 1" . e2wm:navi-sub-term-command)
           ("C-: 2" . e2wm:navi-sub-term-command)
           ("C-: 3" . e2wm:navi-sub-term-command))
         nil))
  (e2wm:pst-class-register
   (make-e2wm:$pst-class
    :name   'elispcode
    :title  "ElispCoding"
    :extend 'base
    :init   'e2wm:dp-elispcode-init
    :start  'e2wm-elispcode-start
    :main   'main
    :switch 'e2wm:dp-elispcode-switch
    :popup  'e2wm:dp-elispcode-popup
    :keymap 'e2wm:dp-elispcode-minor-mode-map))
  )

(defun e2wm:dp-elispcode-popup-sub (buf)
  (let ((wm (e2wm:pst-get-wm))
        (not-minibufp (= 0 (minibuffer-depth))))
    (e2wm:with-advice
     (e2wm:pst-buffer-set 'sub buf t not-minibufp))))

(defun e2wm:dp-elispcode-popup (buf)
  (let ((buf-name (buffer-name buf))
        (wm (e2wm:pst-get-wm)))
    (cond ((e2wm:history-recordable-p buf)
           (e2wm:pst-show-history-main)
           ;;記録対象なら履歴に残るのでupdateで表示を更新させる
           t)
          ((and e2wm:override-window-cfg-backup
                (eq (selected-window) (wlf:get-window wm 'sub)))
           ;;現在subならmainに表示しようとする
           ;;minibuffer以外の補完バッファは動きが特殊なのでbackupをnilにする
           (setq e2wm:override-window-cfg-backup nil)
           ;;一時的に表示するためにset-window-bufferを使う
           ;;(prefix) C-lなどで元のバッファに戻すため
           (set-window-buffer (wlf:get-window wm 'right) buf)
           t)
          ((and e2wm:c-code-show-main-regexp
                (string-match e2wm:c-code-show-main-regexp buf-name))
           (e2wm:pst-buffer-set 'main buf t)
           t)
          (t
           (e2wm:dp-elispcode-popup-sub buf)
           t))))

(defun e2wm-elispcode-start (wm) ;[2013/11/15]
  "WM"
  (let ((buffers (buffer-list))
        (regexp "\\.el$")
        done)
    (while (and buffers (not done))
      (when (string-match regexp (buffer-name (car buffers)))
        (setq done (car buffers)))
      (setq buffers (cdr buffers)))
    (when done
      (wlf:set-buffer wm 'main done))))

;;;; web
;;
(defun e2wm-web-predefine () ;[2013/11/15]
  (message "Defining Perspective web.")
  (defvar e2wm:web-recipe)
  (setq e2wm:web-recipe
        '(| (:left-max-size 100)
            main ;left
            (- (:lower-max-size 22) right sub) ;right
            ))
  (defvar e2wm:web-winfo)
  (setq e2wm:web-winfo
        '((:name main :plugin open :plugin-args (:buffer "*w3m*" :command w3m))
          (:name right)
      (:name sub   :buffer "*info*" :default-hide nil)))
  (defun e2wm:web-init ()
    (let*
        ((web-wm
          (wlf:no-layout
           e2wm:web-recipe
           e2wm:web-winfo))
         (buf (or e2wm:prev-selected-buffer
                  (e2wm:history-get-main-buffer))))

      (wlf:set-buffer web-wm 'main buf)
      web-wm))
  (defun e2wm:web-buffer-p (buf)
    "BUF"
    (string-match "\\*w3m\\*" (buffer-name buf)))
  (e2wm:pst-class-register
   (make-e2wm:$pst-class
    :name   'web
    :extend 'two
    :title  "Web"
    :init   'e2wm:web-init
    :main   'main
    :switch 'e2wm:web-switch
    :popup  'e2wm:web-popup))
  t)

(defun e2wm:web-switch (buf)
  (let ((buf-name (buffer-name buf))
        (wm (e2wm:pst-get-wm)))
    (if (e2wm:history-recordable-p buf)
        (cond ((e2wm:web-buffer-p buf)
               (e2wm:pst-buffer-set 'main buf))
              (t (e2wm:pst-show-history-main)
                 (e2wm:pst-buffer-set 'right buf))
              ))))

(defun e2wm:web-popup (buf)
  (let ((buf-name (buffer-name buf)))
    (cond
     ((e2wm:web-buffer-p buf)
      (e2wm:pst-buffer-set 'main buf)
      t)
     ((e2wm:history-recordable-p buf)
      (e2wm:pst-buffer-set 'right buf)
      t)
     (t
      (e2wm:dp-two-popup-sub buf)
      t))))

(defun e2wm:web-popup-sub (buf)
  (let ((wm (e2wm:pst-get-wm))
        (not-minibufp (= 0 (minibuffer-depth))))
    (e2wm:with-advice
     (e2wm:pst-buffer-set 'sub buf t not-minibufp))))


;;;; book
;;
(defun e2wm-book-predefine () ;[2013/11/15]
  ""
  (message "Defining Perspective book.")
  (defvar e2wm:book-recipe)
  (setq e2wm:book-recipe
        '(| (:right-size-ratio 0.9)
            (- (:lower-max-size 30)
               files history)
            (| (:right-size-ratio 0.50) main
           (- (:lower-max-size 20) right sub))))
  (defvar e2wm:book-winfo)
  (setq e2wm:book-winfo
        '((:name files     :plugin dired :default-hide t)
          (:name history   :plugin history-list :default-hide t)
          (:name main)
          (:name right     :default-hide nil)
      (:name sub       :buffer "*info*" :default-hide t)))
  (defun e2wm:book-init ()
    (let*
        ((book-wm
          (wlf:no-layout
           e2wm:book-recipe
           e2wm:book-winfo))
         (buf (or e2wm:prev-selected-buffer
                  (e2wm:history-get-main-buffer))))
      (when (e2wm:history-recordable-p e2wm:prev-selected-buffer)
        (e2wm:history-add e2wm:prev-selected-buffer))
      (wlf:set-buffer book-wm 'main buf)
      book-wm))
  (defun e2wm:book-start (wm) ;[2013/11/15]
    "WM"
    (let ((buffers (buffer-list))
          (regexp "\\(jpg\\|png\\)$")
          done)
      (while (and buffers (not done))
        (when (string-match regexp (buffer-name (car buffers)))
          (setq done (car buffers)))
        (setq buffers (cdr buffers)))
      (when done
        (wlf:set-buffer wm 'main done))))
  (defun e2wm:book-buffer-p (buf)
    "BUF"
    (string-match "\\(jpg\\|png\\)$" (buffer-name buf)))
  (defun e2wm:book-switch (buf)
    (let ((buf-name (buffer-name buf))
          (wm (e2wm:pst-get-wm)))
      (if (or (e2wm:history-recordable-p buf) (e2wm:book-buffer-p buf))
          (cond ((eq (selected-window) (wlf:get-window wm 'right))
                 (e2wm:pst-buffer-set 'right buf)
                 t)
                ((eql (get-buffer buf) (wlf:get-buffer wm 'main))
                 (e2wm:pst-update-windows)
                 (e2wm:pst-buffer-set 'main buf)
                 t)
                (t (e2wm:pst-show-history-main)
                   (e2wm:pst-buffer-set 'main buf)))
        nil)))
  (defun e2wm:book-popup (buf)
    (let ((buf-name (buffer-name buf)))
      (cond
       ((e2wm:book-buffer-p buf)
        (e2wm:pst-buffer-set 'main buf)
        t)
       ((e2wm:history-recordable-p buf)
        (e2wm:pst-buffer-set 'right buf)
        t)
       (t
        (e2wm:dp-two-popup-sub buf)
        t))))
  (defun e2wm:book-popup-sub (buf)
    (let ((wm (e2wm:pst-get-wm))
          (not-minibufp (= 0 (minibuffer-depth))))
      (e2wm:with-advice
       (e2wm:pst-buffer-set 'sub buf t not-minibufp))))
  (defun e2wm:dp-book-files-toggle-command ()
    (interactive)
    (wlf:toggle (e2wm:pst-get-wm) 'files)
    (e2wm:pst-update-windows))
  (defun e2wm:dp-book-sub-toggle-command ()
    (interactive)
    (wlf:toggle (e2wm:pst-get-wm) 'sub)
    (e2wm:pst-update-windows))
  (defvar e2wm:dp-book-minor-mode-map)
  (setq e2wm:dp-book-minor-mode-map
        (e2wm:define-keymap
         '(("C-x 0" . e2wm-hide-command)
           ;; toggle
           ("C-u M-F" . e2wm:toggle-files-command)
           ("C-u M-S" . e2wm:toggle-sub-command)
           ("C-u M-H" . e2wm:toggle-history-command)
           ("C-u M-M" . e2wm:dp-code-main-maximize-toggle-command)
           ;; navi
           ("M-D"     . e2wm:navi-main-command)
           ("M-F"     . e2wm:navi-files-command)
           ("M-H"     . e2wm:navi-history-command)
           ("M-S"     . e2wm:navi-sub-command)
           ("M-R"     . e2wm:navi-right-command)
           ("C-: 0" . e2wm:navi-sub-term-command)
           ("C-: 1" . e2wm:navi-sub-term-command)
           ("C-: 2" . e2wm:navi-sub-term-command)
           ("C-: 3" . e2wm:navi-sub-term-command))
     nil))
  (e2wm:pst-class-register
   (make-e2wm:$pst-class
    :name   'book
    ;; :extend 'two
    :title  "Read books"
    :init   'e2wm:book-init
    ;; :start  'e2wm:book-start
    :main   'main
    :switch 'e2wm:book-switch
    :popup  'e2wm:book-popup
    :keymap 'e2wm:dp-book-minor-mode-map))
  t)


;;;; OVERRIDE
;;
;;; Error in timer: (search-failed "^*Rescan*$")
;;; (concat "^" name "$") => (concat "^" (rx-form name) "$")
;;; name "*Rescan*" inputed as regexp
;;; "*Rescan*" => "\\*Rescan\\*"
;; (defadvice e2wm:def-plugin-imenu-update-which-func
;;   (around e2wm:def-plugin-imenu-update-which-func activate)
;;   (e2wm:with-advice
;;    (let* ((main-buf (e2wm:history-get-main-buffer))
;;           (win (selected-window))
;;           (imenu-buf (get-buffer " *WM:Imenu*"))
;;           (imenu-win (and imenu-buf (get-buffer-window imenu-buf))))
;;      (cond
;;       ((null imenu-buf)
;;        (e2wm:def-plugin-imenu-stop-timer))
;;       ((eql win (get-buffer-window main-buf))
;;        (let ((name (e2wm:def-plugin-imenu-which-func)))
;;          (when (and name (window-live-p imenu-win))
;;            (with-current-buffer imenu-buf
;;              (goto-char (point-min))
;;              (let ((ps (re-search-forward (concat "^" (rx-form name) "$"))))
;;                (when ps
;;                  (beginning-of-line)
;;                  (set-window-point imenu-win (point))
;;                  (hl-line-highlight)))))))
;;       (t
;;        ;;can not update
;;        )))))
;; (progn (ad-disable-advice 'e2wm:def-plugin-imenu-update-which-func 'around 'e2wm:def-plugin-imenu-update-which-func) (ad-update 'e2wm:def-plugin-imenu-update-which-func))

;; (defun fix-e2wm-predefine ()
;;   ""
;;   (message "Fixing e2wm..")
;; (defun e2wm:def-plugin-imenu-update-which-func ()
;;   (e2wm:with-advice
;;    (let* ((main-buf (e2wm:history-get-main-buffer))
;;           (win (selected-window))
;;           (imenu-buf (get-buffer " *WM:Imenu*"))
;;           (imenu-win (and imenu-buf (get-buffer-window imenu-buf))))
;;      (cond
;;       ((null imenu-buf)
;;        (e2wm:def-plugin-imenu-stop-timer))
;;       ((eql win (get-buffer-window main-buf))
;;        (let ((name (e2wm:def-plugin-imenu-which-func)))
;;          (when (and name (window-live-p imenu-win))
;;            (with-current-buffer imenu-buf
;;              (goto-char (point-min))
;;              (let ((ps (re-search-forward (concat "^" (rx-form name) "$"))))
;;                (when ps
;;                  (beginning-of-line)
;;                  (set-window-point imenu-win (point))
;;                  (hl-line-highlight)))))))
;;       (t
;;        ;;can not update
;;        )))))
;;   )



(provide 'e2wm_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm_mode_start.el ends here
