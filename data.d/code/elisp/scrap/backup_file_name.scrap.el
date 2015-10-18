;; -*- coding: utf-8; mode: emacs-lisp; -*-

;;; backup_file_name.scrap.el --- description
;;
;; $Revision: 689 $
;; $LastChangedRevision: 689 $
;; $LastChangedDate: 2012-12-02 14:28:44 +0900 (Sun, 02 Dec 2012) $
;;
;; TITLE-OR-INDEX
;; ============================================================================
;;;; backup file name ;[2012/10/19]
;;
;; (setq make-backup-file-name-function 'my-make-backup-file-name)
;; (defun my-make-backup-file-name (file-name)
;;   "Create backup file name for `file-name'.
;; like this '/etc/hostnames' => '/my-backup-dir/!etc!hostnames'"
;;   (let ((backup-location my-backup-dir)
;; 		(filenm file-name))
;; 	;; For windows "c:" => "/drive_c"
;; 	(if (memq system-type '(windows-nt ms-dos cygwin))
;; 		(progn
;; 		  (or (file-name-absolute-p filenm)
;; 			  (setq filenm (expand-file-name filenm)))
;; 		  (setq filenm (expand-file-name (convert-standard-filename filenm)))
;; 		  (if (eq (aref filenm 1) ?:)
;; 			  (setq filenm (concat "/" "drive_"
;;                                    (char-to-string (downcase (aref filenm 0)))
;;                                    (if (eq (aref filenm 2) ?/)
;;                                        ""
;;                                      "/")
;;                                    (substring filenm 2))))))
;;     (if (file-exists-p backup-location)
;;         (concat (expand-file-name backup-location)
;;                 (replace-regexp-in-string "/" "!"
;;                                           (replace-regexp-in-string "!" "!!" filenm)))
;;       (concat (make-backup-file-name-1 filenm) "~"))))





;; For Emacs
;; Local Variables:
;; no-byte-compile: t
;; End:
;;; backup_file_name.scrap.el ends here
