;; -*- coding: utf-8; mode: emacs-lisp; no-byte-compile: t; no-update-autoloads: t -*-
;;; 2013-10-05-041036.junk.el ---

(defun py:class-next--internal ()
  ""
  (let ((orig (point)))
    ;; fix position for move next
    (when (looking-at py:class-re)
      (goto-char (match-end 0)))
    (if (re-search-forward py:class-re nil 'noerror)
        (if (py:string|comment-at-p)
            (py:class-next--internal) ;recursive
          (goto-char (match-beginning 0))
          (point))
      (goto-char orig)
      nil)))

(defun py:class-prev--internal ()
  ""
  (let ((orig (point)))
    (if (re-search-backward py:class-re nil 'noerror)
        (if (py:string|comment-at-p)
            (py:class-prev--internal) ;recursive
          (goto-char (match-beginning 0))
          (point))
      (goto-char orig)
      nil)))

(defun py:class-next (n)
  "N"
  (interactive "p")
  ;; prevent bad value
  (when (or (not (integerp n))
            (< n 0))
    (error "Value error"))
  (while (and (not (eq n 0))
              (py:class-next--internal))
    (setq n (- n 1)))
  (point))

(defun py:class-prev (n)
  "N"
  (interactive "p")
  ;; prevent bad value
  (when (or (not (integerp n))
            (> n 0))
    (error "Value error"))
  (while (and (not (eq n 0))
              (py:class-prev--internal))
    (setq n (+ n 1)))
  (point))



;; (defun py:class-next (n)
;;   "N"
;;   (interactive "p")
;;   (let* ((orig (point))
;;          (regexp py:class-re)
;;          (n (or n 1))
;;          (tmp (cond ((negative-p n) (list 1 #'match-beginning #'re-search-backward))
;;                     ((positive-p n) (list -1 #'match-end #'re-search-forward))
;;                     (t '(0 nil nil))))
;;          (addn (car tmp))
;;          (adjust-fn (car (cdr tmp)))
;;          (search-fn (car (cdr (cdr tmp))))
;;          done)
;;     (while (and (not (eq n 0))
;;                 (not done))
;;       ;; skip target regexp before move
;;       (when (looking-at regexp)
;;         (goto-char (funcall adjust-fn 0)))
;;       (if (funcall search-fn regexp nil 'noerror)
;;           (when (not (py:string|comment-at-p))
;;             (goto-char (match-beginning 0))
;;             (setq n (+ n addn)))
;;         (setq done t) ;not matched
;;         (goto-char (match-beginning 0)))) ;fix point
;;     (if (eq orig (point))
;;        (point)
;;        nil)
;;     ))

;; (defun py:class-prev (n)
;;   "N"
;;   (interactive "p")
;;   (when (positive-p n)
;;     (setq n (- n)))
;;   (py:class-next n)) ;go previous
