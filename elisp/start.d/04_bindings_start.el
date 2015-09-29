;;; 04_bindings_start.el --- key bind setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:06 2012 (+0900)
;; Last-Updated: 2015/09/13 22:03:40 (+0900)
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
;; 2015/07/31    Atami
;;    Added: ctrl-: "h" or "C-h" `switch-hotstring'
;;
;; 2015/02/01    Atami
;;    Added: keybind "C-e C-w", "C-e w" to `query-replace' in `ctl-e-map'
;;
;; 2015/02/01    Atami
;;    Removed: remove keybind "C-e C-w", "C-e w" `ispell-complete-word'
;;    in `ctl-e-map'
;;
;; 2015/02/01    Atami
;;    Added: "C-e C-SPC", "C-e SPC" bind `remark' in `ctl-e-map'
;;
;; 2014/03/24    Atami
;;    Added: Prefix C-e map
;;
;; 2013/09/22    Atami
;;    Added: ctrl-: `switch-ipython'
;;
;; 2012/12/12    Atami
;;    Added: Ctrl+tab mapped to Alt+tab
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerror)
  (require 'subroutines_start nil 'noerror))

(keyboard-translate ?\C-x ?\C-d)
(keyboard-translate ?\C-d ?\C-x)

;;;; Undefine control-digits.
;;
(let ((i ?0))
  (while (<= i ?9)
    (global-unset-key (read (format "[?\\C-%c]" i)))
    (setq i (1+ i))))

;;;; Remap Universal argument
;;
;; (setq universal-argument-map
;;       '(keymap
;;         (57 . digit-argument)
;;         (56 . digit-argument)
;;         (55 . digit-argument)
;;         (54 . digit-argument)
;;         (53 . digit-argument)
;;         (52 . digit-argument)
;;         (51 . digit-argument)
;;         (50 . digit-argument)
;;         (49 . digit-argument)
;;         (48 . digit-argument)
;;         (45 . universal-argument-minus)
;;         (6 . universal-argument-more)  ;; 6 is ^F, and (old) 21 is ^U
;;         (switch-frame)
;;         (27 keymap
;;             (t . universal-argument-other-key))
;;         (t . universal-argument-other-key)))

;; Ctrl+tab mapped to Alt+tab
(define-key function-key-map [(control tab)] [?\M-\t])

;;;; Prefix C-: map
;;
(defvar ctl-colon-map nil ;;(make-keymap)
  "Default keymap for C-: commands.")
(define-prefix-command 'ctl-colon-map)
(define-many-keys ctl-colon-map
  ;; number
  (           "_" 'launch-or-switch-term       )
  (           "!" 'launch-or-switch-term       )
  (           "\"" 'launch-or-switch-term      )
  (           "#" 'launch-or-switch-term       )
  (           "$" 'launch-or-switch-term       )
  (           "%" 'launch-or-switch-term       )
  (           "&" 'launch-or-switch-term       )
  (           "'" 'launch-or-switch-term       )
  (           "(" 'launch-or-switch-term       )
  (           ")" 'launch-or-switch-term       )
  (           "1" 'launch-or-switch-term       )
  (           "2" 'launch-or-switch-term       )
  (           "3" 'launch-or-switch-term       )
  (           "4" 'launch-or-switch-term       )
  (           "5" 'launch-or-switch-term       )
  (           "6" 'launch-or-switch-term       )
  (           "7" 'launch-or-switch-term       )
  (           "8" 'launch-or-switch-term       )
  (           "9" 'launch-or-switch-term       )
  ;;
  (        "\C-s" 'switch-scratch              )
  (        "\C-t" 'switch-test_start           )
  (        "\C-b" 't1-switch-04_bindings_start )
  (           "b" 't1-switch-04_bindings_start )
  ( [(control :)] 'iswitchb-buffer             )
  (           "m" 'switch-message              )
  (           "a" 'switch-allinone             )
  (        "\C-a" 'switch-allinone             )
  ;; (        "\C-b" 'next-buffer                 )
  (        "\C-f" 'previous-buffer             )
  (           "@" 'find-file-conf              )
  (        "\C-@" 'find-file-conf              )
  (           "d" 'switch-dired                )
  (        "\C-x" 'switch-dired                )
  (        "\C-j" 'switch-junk                 )
  (           "j" 'switch-junk                 )
  (        "\C-p" 'switch-snippets             )
  (           "p" 'switch-snippets             )
  (           "w" 'w3m                         )
  (        "\C-w" 'w3m                         )
  (        "\C-u" 'register-buffer             )
  (        "\C-e" 'register-buffer             )
  (           "i" 'switch-ipython              )
  (           "I" 'switch-ipython              )
  (        "\C-i" 'switch-ipython              )
  (        "\M-s" 'switch-start-dir            )
  (        "\C-h" 'switch-hotstring            )
  (           "h" 'switch-hotstring            )
  (           "H" 'switch-hotstring            )
  )

;;;; Prefix C-e map
;;
(defvar ctl-e-map nil ;(make-keymap)
  "Default keymap for <control>-<e> commands.")
(define-prefix-command 'ctl-e-map)
(define-many-keys ctl-e-map
  (    "c" 'make-revision                     )
  (    "C" 'make-revision                     )
  (    "R" 'make-revision                     )
  (    ":" 'timestamp-insert                  )
  (    "*" 'toggle-let-astah                  )
  ( "\C-q" 'quoted-insert                     )
  ;; (    "w" 'ispell-complete-word              )
  ;; ( "\C-w" 'ispell-complete-word              )
  ( "\C-a" 'align-regexp                      )
  (    "a" 'align-regexp                      )
  ( "\C-g" 'keyboard-quit                     )
  ( "\C-b" 'delete-blank-lines                )
  ( "\C-f" 'fixup-whitespace                  )
  ( "\C-w" 'query-replace                     )
  (    "w" 'query-replace                     )
  ;; CAPITALIZE & lower
  ( "\C-u" 'upcase-word                       )
  ( "\C-l" 'downcase-word                     )
  (    "u" 'upcase-region                     )
  (    "l" 'downcase-region                   )
  ;; duplicate
  (    "k" 'duplicate-previous-line           )
  (    "n" 'duplicate-following-line          )
  ( "\C-k" 'duplicate-previous-line           )
  ( "\C-n" 'duplicate-following-line          )
  ;; rotate text
  ( "\C-r" 'rotate-word-at-point              )
  ;; anything
  ( "\C-e" 'my-anything-edit                  )
  ;; trans-regions
  ( "\M-t" 'trans-regions                     )
  ;; auto-highlight-symbol
  (    "h" 'ahs-edit-mode                     )
  ( "\C-h" 'ahs-edit-mode                     )
  (    "H" 'ahs-edit-mode-tmp-whole-buffer    )
  ;; register
  ( "\C-c" 'copy-to-register                  )
  (    "c" 'copy-to-register                  )
  ( "\C-v" 'insert-register-disable-exchange  )
  (    "v" 'insert-register-disable-exchange  )
  ;; remark region
  ( [67108896] 'remark                        ) ; C-SPC
  (    " " 'remark                            ) ; SPC
  )

;;;; Prefix C-c map
;;
(define-many-keys mode-specific-map
  (    "l" 'info-lookup-symbol  )
  (    "d" 'delete-indentation  )
  (    "i" 'imenu               )
  ( "\C-g" 'keyboard-quit       )
  )

;;;; Prefix C-x map
;;
(define-many-keys ctl-x-map
  (   [f4] 'kmacro-start-macro-or-insert-counter )
  ( "\M-d" 'dired-jump-other-window              )
  (    "D" 'dired-jump-other-window              )
  ( "\M-p" 'backward-page                        )
  ( "\M-b" 'forward-page                         )
  ( "\C-s" 'rename-old-del                       )
  ( "\C-c" 'kill-emacs                           )
  (    "k" 'kill-this-buffer                     )
  ( "\C-k" 'kill-this-buffer                     )
  ( "\C-g" 'keyboard-quit                        )
  ( "\C-b" 'bs-show                              )
  (    "f" 'find-file                            )
  (    "t" 'swap-screen-with-cursor              )
  (    "r" 'recenter                             )
  ( "\M-f" 'query-replace-regexp                 )
  (    "o" 'moccur                               )
  ( "\M-o" 'dmoccur                              )
  (    "h" 'help-command                         )
  (    "z" 'winner-undo                          )
  (    "Z" 'winner-redo                          )
  ( "\C-b" 'make-backup-revision                 )
  (    "b" 'make-backup-revision                 )
  (    "F" 'revert-buffer                        )
  ( "\C-l" 'linum-mode                           )
  )

;;;; Define key minibuffer
;;
(define-many-keys minibuffer-local-map
  ( "\C-n" 'next-history-element              )
  ( "\C-k" 'previous-history-element          )
  ( "\M-n" 'next-matching-history-element     )
  ( "\M-k" 'previous-matching-history-element )
  ( "\C-j" 'backward-char                     )
  ( "\C-l" 'forward-char                      ))

(define-many-keys minibuffer-local-must-match-map
  ( "\C-j" 'backward-char      )
  ( "\C-a" 'backward-kill-word ))

;;;; Isearch
;;
(define-many-keys isearch-mode-map
  ( "\C-f" 'isearch-repeat-forward )
  ( "\C-j" 'isearch-delete-char    )
  ( "\C-t" 'isearch-toggle-regexp  ))

;;;; common view bind
;;
(defvar my-view-map (make-keymap))
(define-prefix-command 'my-view-map)
(define-many-keys my-view-map
  (         "w" 'whitespace-mode        )
  (         "v" 'column-highlight-mode  )
  (         "n" 'column-highlight-mode  )
  ( [134217741] 'view-mode              ))
(defvar common-view-map-list
  `( ;; Left hand
    ( "v"             . next-line                   )
    ( "f"             . forward-char                )
    ( "d"             . previous-line               )
    ( "s"             . backward-char               )
    ( "g"             . my-forward-seq              )
    ( "e"             . cua-scroll-down             )
    ;; common
    ( "a"             . my-backward-seq             )
    ( "\d"            . nil                         )
    ( "c"             . nil                         )
    ( " "             . my-view-map                 )
    ( "b"             . cua-scroll-up               )
    ( "y"             . sdic-describe-word-at-point )
    ;; Right hand
    ( "n"             . next-line                   )
    ( "l"             . forward-char                )
    ( "j"             . backward-char               )
    ( "k"             . previous-line               )
    ( "-"             . my-forward-seq              )
    ( "o"             . other-window                )
    ( "p"             . cua-scroll-down             )
    ( "h"             . my-backward-seq             )
    ( "i"             . turn-off-view-mode          )
    ( "M"             . bm-toggle                   )
    ( "\M-m"          . bm-previous                 )
    ( "m"             . bm-next                     )
    ( "."             . tabbar-forward-tab          )
    ( ","             . tabbar-backward-tab         )
    ;;
    ( "\C-e"          . ctl-e-map                   )
    ( "\C-n"          . next-line                   )
    ( "\C-l"          . forward-char                )
    ( "\C-j"          . backward-char               )
    ( "\C-k"          . previous-line               )
    ( "\C-\M-n"       . cua-scroll-up               )
    ( "\C-\M-k"       . cua-scroll-down             )
    ( "\C-h"          . my-backward-seq             )
    ( "\C-m"          . nil                         )
    (   [(control -)] . my-forward-seq              )
    ( [(control ?\s)] . seq-set-mark                )
    ( "E" . text-translator-all-by-auto-selection)
    ))

;;;; global map
;
(global-unset-key (kbd "M-<down-mouse-1>"))
(define-many-keys global-map
  ;; prefix
  (               "\C-e" 'ctl-e-map                           )
  (       [(control ?:)] 'ctl-colon-map                       )
  ;;
  (               "\C-k" 'previous-line                       )
  (               "\C-j" 'backward-char                       )
  (               "\C-l" 'forward-char                        )
  (               "\M-j" 'backward-word                       )
  (               "\M-l" 'forward-word                        )
  (               "\C-h" 'my-backward-seq                     )
  (       [(control ?-)] 'my-forward-seq                      )
  (               "\M-h" 'backward-whitespace                 )
  (          [(meta ?-)] 'forward-whitespace                  )
  (            "\C-\M-j" 'backward-whitespace                 )
  (  [(control meta ?-)] 'forward-whitespace                  )
  (               "\M-k" 'backward-sentence                   )
  (               "\M-n" 'forward-sentence                    )
  (       [(control ?.)] 't1-forward-thing                    )
  (       [(control ?,)] 't1-backward-thing                   )
  (            "\C-\M-j" 't1-backward-thing                   )
  (            "\C-\M-l" 't1-forward-thing                   )
  (               "\M-," 'beginning-of-defun                  )
  (               "\M-." 'end-of-defun                        )
  (               "\C-p" 'beginning-of-defun                  )
  (               "\C-b" 'end-of-defun                        )
  (               "\M-p" 'backward-paragraph                  )
  (               "\M-b" 'forward-paragraph                   )
  (            "\C-\M-k" 'scroll-down                         )
  (            "\C-\M-n" 'scroll-up                           )
  (               "\M-g" 'goto-line                           )
  (               "\M-d" 'anything-M-x                        )
  (               "\C-s" 'save-buffer                         )
  ( [(control meta ?\s)] 'cua-set-rectangle-mark              )
  (            "\C-\M-t" 'transpose-lines                     )
  (           [C-return] 'open-line                           )
  (     [(shift return)] 'return-on-line                      )
  (               "\M-;" 'comment-or-uncomment-region         )
  (            "\C-\M-g" 'keyboard-escape-quit                )
  (               "\C-d" 'kill-region                         )
  (               "\C-v" 'x-clipboard-yank                    )
  (               "\C-m" 'default-indent-new-line             )
  (               "\C-t" 'move-text-up                        )
  (           [67108896] 'seq-set-mark                        ) ; "C-SPC"
  (            "\C-\M-t" 'transpose-chars                     )
  (            "\C-\M-x" 'dabbrev-expand                      )
  ;; (                  "f" 'ffap-other-window                   )
  (               "\C-r" 'repeat                              )
  (               "\C-y" 'my-kill-line                        )
  ;; (             "\C-f" 'universal-argument          )
  ;; (             "\M-f" 'isearch-forward             )
  (               "\C-f" 'isearch-forward                     )
  (                 [f6] 'view-mode                           )
  (           [M-return] 'view-mode                           )
  (               "\C-q" 'view-mode                           )
  (               "\C-o" 'my-ll-debug-toggle-comment-region-or-line)
  (               "\M-o" 'll-debug-insert                     )
  (           "\C-x\M-o" 'll-debug-revert                     )
  ;; Window
  (               "\M-K" 'windmove-up-or-splitmove            )
  (               "\M-N" 'windmove-down-or-splitmove          )
  (               "\M-J" 'windmove-left-or-splitmove          )
  (               "\M-L" 'windmove-right-or-splitmove         )
  (               "\M-X" 'shrink-window                       )
  (               "\M-E" 'enlarge-window                      )
  (               "\M-S" 'shrink-window-horizontally          )
  (               "\M-F" 'enlarge-window-horizontally         )
  (               "\M-B" 'scroll-other-window                 )
  (               "\M-P" 'scroll-other-window-down            )
  (               "\M-?" 'winner-undo                         )
  (               "\M-R" 'scroll-window-to-top                )
  ;; Edit
  (        [C-backspace] 'backward-kill-line                  )
  (        [M-backspace] 'my-backward-delete-word             )
  (        [S-backspace] 'delete-char                         )
  (      [S-M-backspace] 'kill-word                           )
  (        [S-backspace] 'kill-line                           )
  (      [S-C-backspace] 'kill-line                           )
  (                  ")" 'mark-wrap                           )
  (                  "]" 'mark-wrap                           )
  (                  ")" 'mark-wrap                           )
  (                  "}" 'mark-wrap                           )
  (                  "'" 'mark-wrap                           )
  (                 "\"" 'mark-wrap                           )
  (                  ">" 'mark-wrap                           )
  ;; mouse
  (          [C-mouse-5] 'text-scale-decrease                 )
  (          [C-mouse-4] 'text-scale-enlarge                  )
  (          [C-mouse-2] 'text-scale-default                  )
  ;; anyhting
  (           "\C-x\C-x" 'anything                            )
  (              "\C-xm" 'anything-man-woman                  )
  (               "\M-y" 'anything-show-kill-ring             )
  (            "\C-\M-f" 'anything-c-moccur-buffer-list       )
  (               "\M-d" 'anything-M-x                        )
  ;; tabbar
  (               "\M->" 'tabbar-forward-tab                  )
  (               "\M-<" 'tabbar-backward-tab                 )
  (               "\M-V" 'tabbar-backward-group               )
  (               "\M-~" 'tabbar-backward-group               )
  ;; multiple-cursors
  (  (kbd "M-<mouse-1>") 'mc/add-cursor-on-click              )
  (          (kbd "s-s") 'mc/edit-lines                       )
  (               "\M-@" 'mc/mark-next-like-this              )
  (               "\M-`" 'mc/mark-previous-like-this          )
  ;; misc
  (    [zenkaku-hankaku] 'toggle-input-method                 )
  (       (kbd "S-<f4>") 'kmacro-start-macro-or-insert-counter)
  (      (kbd "s-<f12>") 'rest-room                           )
  (          (kbd "M-+") 'e2wm:toggle-start-stop              )
  ;; annotation
  (            "\C-\M-o" 'annotation                          )
  )

;;;; for putty
;;
(define-many-keys global-map
  (                 "" 'end-of-line                         )
  (               "\C-^" 'open-line                           )
  (          (kbd "M-&") 'return-on-line                      )
  (               "\M-$" 'cua-set-rectangle-mark              )
  )


;;;; Prefix C-e map
;;
(define-many-keys ctl-e-map
  ;; auto-yasnippet
  (                  "Y" 'create-auto-yasnippet               )
  (                  "y" 'auto-yasnippet-ext                  )
  (               "\C-y" 'auto-yasnippet-ext                  )
  )



(provide '04_bindings_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 04_bindings_start.el ends here
