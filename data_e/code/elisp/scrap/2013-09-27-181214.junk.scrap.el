;; -*- coding: utf-8; mode: emacs-lisp; no-byte-compile: t; no-update-autoloads: t -*-
;;; 2013-09-27-181214.junk.el ---

(defun py-wharap-quote ()
  ""
  (interactive)
  (let ((re-start (rx symbol-start))
        (re-end (rx symbol-end)))
    (unless (looking-at re-start)
      (re-search-backward re-start nil 'noerror)
      (insert "'")
      (re-search-backward re-end nil 'noerror)
      (insert "'")
      )))


(defun py-wharap-quote ()
  ""
  (interactive)
  (let ((re-start (rx symbol-start))
        (re-end (rx symbol-end)))
    (unless (looking-at re-start)
      (re-search-backward re-start nil 'noerror))
    (insert "'")
    (re-search-forward re-end nil 'noerror)
    (insert "'")
    ))
