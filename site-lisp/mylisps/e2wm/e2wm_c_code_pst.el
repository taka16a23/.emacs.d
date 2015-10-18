;;; e2wm_c_code_pst.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/01 11:40:47 (+0900)
;; Last-Updated: 2015/10/01 12:36:16 (+0900)
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
;;
;;; Code:


(require 'e2wm "e2wm" 'noerr)

(defvar e2wm:C-code-recipe
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

(defvar e2wm:C-code-winfo
      '((:name main)
        (:name upsub     :default-hide t)
        (:name files     :plugin dired)
        (:name imenu     :plugin imenu :default-hide nil)
        (:name history   :plugin history-list :default-hide t)
        (:name right     :default-hide nil)
        (:name sub :buffer "*info*" :default-hide nil)))

(defun e2wm:dp-C-code-switch (buf)
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

(defun e2wm:dp-code-init ()
  (let*
      ((code-wm
        (wlf:no-layout
         e2wm:C-code-recipe
         e2wm:C-code-winfo))
       (buf (or e2wm:prev-selected-buffer
                (e2wm:history-get-main-buffer))))

    (when (e2wm:history-recordable-p e2wm:prev-selected-buffer)
      (e2wm:history-add e2wm:prev-selected-buffer))

    (wlf:set-buffer code-wm 'main buf)
    code-wm))

(e2wm:pst-class-register
 (make-e2wm:$pst-class
  :name       'C-code
  :extend     'base
  :title      "Coding"
  :init       'e2wm:dp-code-init
  :main       'main
  :switch     'e2wm:dp-C-code-switch
  :popup      'e2wm:dp-code-popup
  :after-bury 'e2wm:dp-code-after-bury
  :keymap     'e2wm:dp-code-minor-mode-map))

;;;###autoload
(defun e2wm:dp-C-code () ;[2015/10/01]
  ""
  (interactive)
  (e2wm:pst-change 'C-code))



(provide 'e2wm_c_code_pst)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; e2wm_c_code_pst.el ends here
