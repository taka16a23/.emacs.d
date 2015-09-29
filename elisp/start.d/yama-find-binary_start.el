;;; yama-find-binary_start.el --- functions for yama-find-binary
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 23:55:33 2012 (+0900)
;; Last-Updated: 2013/03/09 15:31:41 (+0900)
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
;; 2013/01/16    Atami
;;    Add: "ahk" add to `YAMA-file-not-binary-files'
;;
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defvar YAMA-file-not-binary-extensions
  '("el" "ahk")
  "バイナリと見なさないファイルの拡張子を
    (\"txt\") のようにリストで指定する
    ただしすべて小文字で指定する")

;;;###autoload
(defvar YAMA-file-not-binary-files
  '("tags" "gsyms" "gpath" "grtags" "gsyms" "gtags" "el")
  "バイナリとみなされないファイル名を指定する。
     ただし、すべて小文字で指定のこと")

;;;###autoload
(defun YAMA-file-binary-p (file &optional full)
  "Return t if FILE contains binary data.  If optional FULL is non-nil,
  check for the whole contents of FILE, otherwise check for the first
    1000-byte."
  (let ((coding-system-for-read 'binary)
        set-buffer-multibyte)
    (if (or
         (and
          (boundp 'image-types)
          (or
           (memq (intern (upcase (file-name-extension file)))
                 image-types)
           (memq (intern (downcase (file-name-extension file)))
                 image-types)))
         (member (downcase (file-name-extension file))
                 YAMA-file-not-binary-extensions)
         (member (downcase (file-name-nondirectory file))
                 YAMA-file-not-binary-files))
        nil
      (with-temp-buffer
        (insert-file-contents file nil 0 (if full nil 1000))
        (goto-char (point-min))
        (and (re-search-forward
              "[\000-\010\016-\032\034-\037]"
              nil t)
             t)))))


(provide 'yama-find-binary_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; yama-find-binary_start.el ends here
