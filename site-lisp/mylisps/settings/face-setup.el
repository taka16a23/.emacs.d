;;; face-setup.el ---   view setting for Emacs
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:40 2012 (+0900)
;; Last-Updated:2016/03/28 11:13:55 (+0900)
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


(require 'bind-key "bind-key" 'noerr)

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
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(if (string-equal (system-name) "qu")
    nil
    (setq
      inhibit-menubar-update t ; menubar 更新不可
	  initial-frame-alist
      '((top                  . 90  )
        (left                 . 300 )
        (width                . 150 )
        (height               . 60  )
        ))
  )

(make-local-variable 'overflow-newline-into-fringe)
(custom-set-variables
 '(indicate-empty-lines t) ;左縁に空行を表示
 '(truncate-lines t) ;nil でない場合は、はみだす行は切り捨て表示
 '(word-wrap t) ;分割時、単語は分割しない
 '(indicate-buffer-boundaries 'left) ;set fringe symbol left
 '(overflow-newline-into-fringe t) ;行の最後が改行で改行がfringeにめりこむ
 ;; Font
 '(line-spacing nil) ;行間調整
 '(mark-even-if-inactive t)
 ;; 半画面スクロールのスクロール量
 '(scroll-up-aggressively 0.5)
 '(scroll-down-aggressively 0.5)
 ;; 1画面スクロールしたときに以前の画面を何行分残すかを設定する
 '(next-screen-context-lines 3)
 '(window-min-height 4) ;最小サイズより小さくなると、ウィンドウを削除する。
 '(window-min-width  5)
 ;; 画面上でのポイント位置を保ったまま1画面分のスクロールを行う
 '(scroll-preserve-screen-position nil)
 )

;; blink cursor
(blink-cursor-mode -1)

;;;; Color
;;
(defalias 'list-colors (symbol-function 'list-colors-display))
(defalias 'colors-list (symbol-function 'list-colors-display))
(defalias 'color-list (symbol-function 'list-colors-display))

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
 '(fringe ((t (:foreground "red" :background "gray16"))))
 '(cursor ((((class color)
             (background dark))
            (:background "yellow"))
           (((class color)
             (background light))
            (:background "yellow"))
           (t ())))
 '(default ((t
             (:background "black" :foreground "white"))))
 '(mouse-color ((((class color)
                  (background dark))
                 (:background "white"))
                (t ())))
 )

;;;; IME color
;;
(defsubst set-cursor-red ()
  (set-cursor-color "red"))

(defsubst set-cursor-yellow ()
  (set-cursor-color "yellow"))

(add-hook 'input-method-activate-hook 'set-cursor-red)
(add-hook 'input-method-inactivate-hook 'set-cursor-yellow)

;;;; 色付け速度
;; (custom-set-variables
;;  '(font-lock-support-mode '(;; (c-mode . fast-lock-mode)
;;                             ;; (c++-mode . fast-lock-mode)
;;                             (python-mode . jit-lock-mode)
;;                             (t . jit-lock-mode)))
;;  ;; '(jit-lock-context-time 0.3) ;0.5
;;  ;; '(jit-lock-defer-time 0.02) ;0.25
;;  ;; '(jit-lock-stealth-time 1)
;;  ;; '(jit-lock-stealth-verbose nil)
;;  ;; '(jit-lock-stealth-nice 0.4)
;;  ;; '(jit-lock-stealth-load 50)
;;  '(jit-lock-chunk-size 3000)
;;  '(font-lock-maximum-decoration '((c-mode . 1)
;;                                   (c++-mode . 1)
;;                                   (org-mode . 1)
;;                                   (python-mode . 1)))
;;  ;; 値を越えるバッファについてはフォント表示化を抑制
;;  '(font-lock-maximum-size (* 1024 1024))
;;  ;; fast-lock-mode で値以下のバッファについては cache を作成しない
;;  '(fast-lock-minimum-size (* 30 1024))
;;  )
;; (global-font-lock-mode t)


(defun default-frame-width ()
  "Set width of selected frame."
  (modify-frame-parameters
   (selected-frame)
   (list (cons 'width 105) (cons 'height 55))))

;;;###autoload
(defun toggle-max-window ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (if (frame-parameter nil 'fullscreen)
                           (progn
                             (default-frame-width)
                             nil)
                         (progn
                           (scroll-bar-mode -1)
                           'fullboth))))

(bind-key [(shift f10)] 'toggle-max-window)
(bind-key [f10] 'toggle-frame-maximized)


;; 透明
;; (set-frame-parameter nil 'alpha '(75 65))
;; (set-frame-parameter nil 'alpha '(100 65))
;; (set-frame-parameter (selected-frame) 'alpha '(70 50))
;; (set-frame-parameter (selected-frame) 'alpha '(100 10))
;; (set-frame-parameter nil 'alpha '80)



(provide 'face-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; face-setup.el ends here
