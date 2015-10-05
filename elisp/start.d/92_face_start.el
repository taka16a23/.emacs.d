;;; 92_face_start.el --- view setting for Emacs
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:40 2012 (+0900)
;; Last-Updated: 2015/10/04 17:17:34 (+0900)
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
;; 2015/09/14    Atami
;;    Modified: `truncate-lines' to t
;;
;; 2013/11/16    Atami
;;    Added: `fringe' background face change grey10 to grey20.
;;
;; 2012/12/10    Atami
;;    Moved: Moved functions to face_start.el
;;    `default-frame-width', `toggle-max-window'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'color-theme)
  (require 'color-theme-t1)
  (require 'view)
  (require 'viewer))

(defgroup my-faces nil
  "Customize my default faces."
  :prefix "my-faces-")

(defface my-file-name-face
  '((((class color) (background dark)) (:foreground "White"))
    (((class color) (background light)) (:foreground "Black")))
  ""
  :group 'my-faces)

(defface my-directory-face
  '((((class color) (background dark)) (:foreground "#32cd32")) ;LimeGreen
    (((class color) (background light)) (:foreground "Green")))
  ""
  :group 'my-faces)

(defface my-symlink-face
  '((((class color) (background dark)) (:foreground "cyan")))
  ""
  :group 'my-faces)

;;;; Frame
;;
;; (modify-frame-parameters nil '((wait-for-wm . nil)))

;; Title
(setq inhibit-menubar-update t ; menubar 更新不可
      initial-frame-alist
      '((line-spacing         . 0   )
        (menu-bar-lines       . nil )
        (tool-bar-lines       . nil )
        (vertical-scroll-bars . nil )
        (cursor-type          . box ))
      )

(if (string-equal (system-name) "qu")
    nil
    (setq
      inhibit-menubar-update t ; menubar 更新不可
	  initial-frame-alist
      '((top                  . 90  )
        (left                 . 300 )
        (width                . 105 )
        (height               . 40  )
        ))
  )

;(setq initial-frame-alist '((top . 0)
;                            (left . 1280)
;                            (width . 1680)
;                            (height . 1050)))


;; 左縁に空行を表示
(setq indicate-empty-lines t)

;; nil でない場合は、はみだす行は切り捨て表示
(setq truncate-lines t)

;; 分割時、単語は分割しない
(setq word-wrap t)

;; set fringe symbol left
(setq-default indicate-buffer-boundaries 'left)

;; 行の最後が改行で改行がfringeにめりこむ
(setq overflow-newline-into-fringe t)
(make-local-variable 'overflow-newline-into-fringe)

;; blink cursor
(blink-cursor-mode -1)

;;;; Font
;;
;; 行間調整
(setq-default line-spacing nil)
(setq mark-even-if-inactive t)

;;;; Window
;;
;; 半画面スクロールのスクロール量
(setq-default scroll-up-aggressively 0.5
              scroll-down-aggressively 0.5)

;; 1画面スクロールしたときに以前の画面を何行分残すかを設定する
(setq next-screen-context-lines 3)

(global-set-key [(shift f10)] 'toggle-max-window)
(global-set-key [f10] 'toggle-frame-maximized)

;; 最小サイズより小さくなると、ウィンドウを削除する。
(setq window-min-height 4)
(setq window-min-width  5)

;; 画面上でのポイント位置を保ったまま1画面分のスクロールを行う
(setq scroll-preserve-screen-position nil)

;;;; ModeLine format
;;
;; mode-line-position
(line-number-mode -1)
(column-number-mode -1)
(size-indication-mode -1)
(setq mode-line-position
      '(:eval (format "%%4l/%d,C%%2c"
                      (count-lines (point-max)
                                   (point-min)))))
;; mode-line-buffer-identification
(setq mode-line-buffer-identification
      '(#("%10b" 0 4 (local-map (keymap ... ...)
								mouse-face mode-line-highlight help-echo
								"Buffer name" face mode-line-buffer-id))))
;; mode-line-format
(setq-default mode-line-format
              '("%e"
                ;; mode-line-position
                "%4l/%I,C%2c"
                " "
                "%*"   ; mode-line-modified
                " "
                mode-line-buffer-identification
                " "
                "%z"   ; mode-line-mule-info
                "%2@"  ; mode-line-remote
                mode-name
                ;; minor-mode-alist
                (vc-mode vc-mode)
                ))

;; mode-line
(face-spec-set 'modeline
               '((t (:bold t :background "chartreuse1" :foreground "black"))))
(face-spec-set 'mode-line-inactive
               '((t (:bold nil :background "grey30" :foreground "grey80"))))
;; (face-spec-set 'modeline-buffer-id
               ;; '((t (:bold nil :background "black" :foreground "white"))))
;; (face-spec-set 'modeline-buffer-id
               ;; '((t (:bold t :foreground "black"))))
(face-spec-set 'modeline-mousable
               '((t (:background "white" :foreground "white"))))
(face-spec-set 'modeline-mousable-minor-mode
               '((t (:background "white" :foreground "white"))))

;;;; Color
;;
;; (set 'list-matching-lines-face 'bold)
;; (set 'view-highlight-face 'highlight)

(when (or window-system
		  (daemonp))
  ;; (color-theme-t1)
  (require 'viewer)
  (viewer-stay-in-setup)
  (setq viewer-modeline-color-unwritable "tomato"
		viewer-modeline-color-view "deeppink")
  (viewer-change-modeline-color-setup)
  )

(defalias 'list-colors (symbol-function 'list-colors-display))
(defalias 'colors-list (symbol-function 'list-colors-display))
(defalias 'color-list (symbol-function 'list-colors-display))

(add-hook 'after-init-timer-hook
          '(lambda ()
             (custom-set-faces
              '(bold ((t (:bold t))))
              '(bold-italic ((t (:italic t :bold t))))
              '(highlight ((t (:background "#36648b")))) ;SteelBlue4
              '(italic ((t (:italic t))))
              '(show-paren-match-face
                ((t (:bold t :background "#87cefa" ;LightSkyBlue
                           :foreground "white"))))
              '(show-paren-mismatch-face
                ((t (:bold t :background "Red" :foreground "White"))))
              '(underline ((t (:underline t))))
              '(region ((t (:background "#1874cd")))) ;DodgerBlue3
              '(primary-selection ((t (:background "blue"))))
              '(isearch ((t (:background "blue"))))
              '(zmacs-region ((t (:background "blue"))))
              '(secondary-selection ((t (:background "#483d8b")))) ;darkslateblue
              '(font-lock-builtin-face ((t (:foreground "#b0c4de")))) ;LightSteelBlue
              '(font-lock-comment-face ((t (:foreground "#ff4500")))) ;OrangeRed
              '(font-lock-constant-face ((t (:foreground "#66cdaa")))) ;Aquamarine
              '(font-lock-doc-face ((t (:foreground "#ff4500")))) ;OrangeRed
              '(font-lock-function-name-face
                ((t (:foreground "#87cefa" :weight bold)))) ;LightSkyBlue
              '(font-lock-keyword-face ((t (:foreground "Cyan"))))
              '(font-lock-preprocessor-face ((t (:foreground "#66cdaa")))) ;Aquamarine
              '(font-lock-reference-face ((t (:foreground "#b0c4de")))) ;LightSteelBlue
              '(font-lock-string-face ((t (:foreground "#ffa07a")))) ;LightSalmon
              '(font-lock-type-face ((t (:foreground "#98fb98")))) ;PaleGreen
              '(font-lock-variable-name-face ((t (:foreground "#eedd82")))) ;LightGoldenrod
              '(font-lock-warning-face ((t (:bold t :foreground "pink")))) ;hotpink
              '(font-lock-regexp-grouping-:construct
                ((t (:foreground "#32cd32" :weight bold)))) ;LimeGreen
              '(font-lock-regexp-grouping-backslash
                ((t (:foreground "#32cd32" :weight bold)))) ;LimeGreen
              )
             ))

(modify-frame-parameters (selected-frame)
                         '(
                           (background-color . "black")
                           ;; (background-mode . dark)
                           ;; (border-color . "white")
                           (cursor-color . "yellow")
                           (foreground-color . "white")
                           (mouse-color . "white smoke")))

;;;; IME color
;;
(defsubst set-cursor-red ()
  (set-cursor-color "red"))

(defsubst set-cursor-yellow ()
  (set-cursor-color "yellow"))

(add-hook 'input-method-activate-hook 'set-cursor-red)
(add-hook 'input-method-inactivate-hook 'set-cursor-yellow)

;;;; 色付け速度
(global-font-lock-mode t)
;; (setq font-lock-maximum-size (* 1024 1024))

;; (if (>= emacs-major-version 21)
;; (setq font-lock-support-mode 'jit-lock-mode)   ; Just-In-Timeな文字装飾方式
;; (setq font-lock-support-mode 'lazy-lock-mode)  ; Emacs20以前では古い方式
;; )
;; (set font-lock-support-mode 'lazy-lock-mode)
(set font-lock-support-mode 'fast-lock-mode)
;; (setq font-lock-support-mode
;; '((c-mode . fast-lock-mode) (c++-mode . fast-lock-mode)
;; (t . lazy-lock-mode)))

;;;; Hilight current line
;;
;; (eval-after-load 'hl-line
  ;; '(progn
     ;; (message "Loading hl-line..")
(face-spec-set 'hlline-face
               '((((class color)
                   (background dark))
                  (:background "dark slate gray"))
                 (((class color)
                   (background light))
                  (:background "LightSkyBlue1"))
                 (t
                  ()))
               )               ;; nil :group 'font-lock-highlighting-faces)
;; ))

;;;; crosshair (cross highlight)
;;
;; (eval-after-load 'hl-line+
  ;; '(progn
(face-spec-set 'hl-line
               '((((class color)
                   (background dark))
                  (:background "dark slate gray"))
                 (((class color)
                   (background light))
                  (:background "LightSkyBlue1"))
                 (t
                  ()))
               )               ;; nil :group 'hl-line)
;; ))
;;
;;;;

;; fringe symbol color
(add-hook 'after-init-timer-hook
          '(lambda ()
             ;; (face-spec-set 'fringe '((t (:foreground "red"))))
             (face-spec-set 'fringe
                            '((t (:foreground "red" :background "gray16"))))
             ))



(provide '92_face_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 92_face_start.el ends here
