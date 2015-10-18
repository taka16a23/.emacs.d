;; -*- coding: utf-8; mode: emacs-lisp -*-

;;; color-theme-t1.el --- color theme my define
;;
;; $Revision: 881 $
;; $LastChangedRevision: 881 $
;; $LastChangedDate: 2013-11-23 19:57:42 +0900 (Sat, 23 Nov 2013) $
;;
;; COLOR THEME
;; ============================================================================
;;; color-theme-t1 --- color-theme-my-definition from dark-laptop
;;
(eval-when-compile
  (require 'color-theme))

;;;###autoload
(defun color-theme-t1 ()
  "Color theme by t1"
  (interactive)
  (color-theme-install
   '(color-theme-t1
     ((background-color . "black")
      (background-mode  . dark)
      (border-color     . "white")
      (cursor-color     . "yellow")
      (foreground-color . "white")
      (mouse-color      . "white smoke"))
     ((gnus-mouse-face . highlight)
      (list-matching-lines-face . bold)
      (view-highlight-face . highlight))
     ;; (default ((t (nil))))

     ;; (fl-comment-face ((t (:foreground "pink"))))
     ;; (fl-doc-string-face ((t (:foreground "purple"))))
     ;; (fl-function-name-face ((t (:foreground "red"))))
     ;; (fl-keyword-face ((t (:foreground "cyan"))))
     ;; (fl-string-face ((t (:foreground "green"))))
     ;; (fl-type-face ((t (:foreground "yellow"))))


     ;; (highlight ((t (:background "darkolivegreen"))))

     )))

(provide 'color-theme-t1)
;;; color-theme-t1.el ends here
