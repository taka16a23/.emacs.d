;; -*- coding: utf-8; mode: emacs-lisp; -*-

;;; make-file-executable.el --- chmod +x file
;;
;; $Revision: 881 $
;; $LastChangedRevision: 881 $
;; $LastChangedDate: 2013-11-23 19:57:42 +0900 (Sat, 23 Nov 2013) $
;;
;; MAKE FILE EXECUTABLE
;; ============================================================================
;;;###autoload
(defun make-file-executable ()
  "Make the file of this buffer executable, when it is a script source."
  (save-restriction
    (widen)
    (if (string= "#!" (buffer-substring-no-properties 1 (min 3 (point-max))))
        (let ((name (buffer-file-name)))
          (or (equal ?. (string-to-char (file-name-nondirectory name)))
              (let ((mode (file-modes name)))
                (set-file-modes name (logior mode (logand (/ mode 4) 73)))
                (message (concat "Wrote " name " (+x)"))))))))



(provide 'make-file-executable)
;; For Emacs
;; Local Variables:
;; End:
;;; make-file-executable.el ends here