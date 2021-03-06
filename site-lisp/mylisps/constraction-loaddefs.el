;;; constraction-loaddefs.el --- constraction my loaddefs
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/01 01:07:34 (+0900)
;; Last-Updated:2015/10/12 14:41:22 (+0900)
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
;; 2013/11/01    Atami
;;    initialize
;;
;;
;;; Code:


(require '00_environment_setup "00_environment_setup" 'noerr)
(require 'autoload nil 'noerror)

(defvar loaddefs-init-file
  (expand-file-name "06_loaddefs_start.el" (my-inits-dir-get)))

;;;###autoload
(defun constraction-loaddefs ()
  "Make 06_loaddefs_start.el file that parsed autoload."
  (interactive)
  (when (get-buffer "06_loaddefs_start.el")
    (kill-buffer "06_loaddefs_start.el"))
  (let ((loaddefs_path loaddefs-init-file)
        (emacs-lisp-mode-hook nil))
    (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
    (when (called-interactively-p 'interactive)
      (condition-case nil
          (progn (when (file-exists-p loaddefs_path) (delete-file loaddefs_path))
                 (when (file-exists-p (concat loaddefs_path "c"))
                   (delete-file (concat loaddefs_path "c"))))))
    (unless (file-exists-p loaddefs_path)
      (make-loaddefs_start))))

(defun make-loaddefs_start ()
  "Generate autoloads.el in my-init-dir for all elips files in x-emacs-lisp-dir."
  (interactive)
  (require 'autoload)
  (let ((inhibit-read-only       t)
		(generated-autoload-file loaddefs-init-file))
    (if (file-exists-p generated-autoload-file)
		(delete-file generated-autoload-file))
    (cond
	 ;; (
	 ;; (fboundp 'update-autoloads-from-directory)
	 ;; (update-autoloads-from-directory my-elisp-dir))
	 ;; ((fboundp 'update-autoloads-from-directories)
	 ;; (update-autoloads-from-directories my-elisp-dir)) ; 22.1
	 ((fboundp 'update-directory-autoloads) ; 23
	  (init-update-directory-autoloads
	   (let (dirs
			 attrs
			 (pending (list (my-inits-dir-get))))
		 ;; This loop does a breadth-first tree walk on DIR's subtree,
		 ;; putting each subdir into DIRS as its contents are examined.
		 (while pending
		   (push (pop pending) dirs)
		   (let* ((this-dir          (car dirs))
				  (contents          (directory-files this-dir))
				  (default-directory this-dir))
			 (dolist (file contents)
			   ;; The lower-case variants of RCS and CVS are for DOS/Windows.
			   (unless (member file '("." ".." "RCS" "CVS" "rcs" "cvs"))
				 (when (and (string-match "\\`[[:alnum:]]" file)
							;; Avoid doing a `stat' when it isn't necessary
							;; because that can cause trouble when an NFS server
							;; is down.
							(not (string-match "\\.elc?\\'" file))
							(file-directory-p file))
				   (let ((expanded (expand-file-name file)))
					 (unless (file-exists-p (expand-file-name ".nosearch"
															  expanded))
					   (setq pending (nconc pending (list expanded))))))))))
		 dirs))))))

(defun init-update-directory-autoloads (&rest dirs)
  "\
Update loaddefs.el with all the current autoloads from DIRS, and no old ones.
This uses `update-file-autoloads' (which see) to do its work.
In an interactive call, you must give one argument, the name
of a single directory.  In a call from Lisp, you can supply multiple
directories as separate arguments, but this usage is discouraged.

The function does NOT recursively descend into subdirectories of the
directory or directories specified."
  (interactive "DUpdate autoloads from directory: ")
  (let* ((files-re (let ((tmp nil))
                     (dolist (suf (get-load-suffixes)
                                  (concat "^[^=.].*" (regexp-opt tmp t) "\\'"))
                       (unless (string-match "\\.elc" suf) (push suf tmp)))))
         (files (apply 'nconc
                       (mapcar (lambda (dir)
                                 (directory-files (expand-file-name dir)
                                                  t files-re))
                               (car dirs))))
         (done ())
         (this-time (current-time))
         ;; Files with no autoload cookies or whose autoloads go to other
         ;; files because of file-local autoload-generated-file settings.
         (no-autoloads nil)
         (autoload-modified-buffers nil))
    (with-current-buffer
        (find-file-noselect
         (autoload-ensure-default-file (autoload-generated-file)))
      (save-excursion

        ;; Canonicalize file names and remove the autoload file itself.
        (setq files (delete (file-relative-name buffer-file-name)
                            (mapcar 'file-relative-name files)))

        (goto-char (point-min))
        (while (search-forward generate-autoload-section-header nil t)
          (let* ((form (autoload-read-section-header))
                 (file (nth 3 form)))
            (cond ((and                     (consp file) (stringp (car file)))
                   ;; This is a list of files that have no autoload cookies.
                   ;; There shouldn't be more than one such entry.
                   ;; Remove the obsolete section.
                   (autoload-remove-section (match-beginning 0))
                   (let                     ((last-time (nth 4 form)))
                     (dolist (file file)
                       (let ((file-time (nth 5 (file-attributes file))))
                         (when (and file-time
                                    (not (time-less-p last-time file-time)))
                           ;; file unchanged
                           (push file no-autoloads)
                           (setq files (delete file files)))))))
                  ((not (stringp file)))
                  ((or (not (file-exists-p file))
                       ;; Remove duplicates as well, just in case.
                       (member file done))
                   ;; Remove the obsolete section.
                   (autoload-remove-section (match-beginning 0)))
                  ((not (time-less-p (nth 4 form)
                                     (nth 5 (file-attributes file))))
                   ;; File hasn't changed.
                   nil)
                  (t
                   (autoload-remove-section (match-beginning 0))
                   (if (autoload-generate-file-autoloads
                        file (current-buffer) buffer-file-name)
                       (push file no-autoloads))))
            (push file done)
            (setq files (delete file files)))))
      ;; Elements remaining in FILES have no existing autoload sections yet.
      (dolist (file files)
        (if (autoload-generate-file-autoloads file nil buffer-file-name)
            (push file no-autoloads)))

      (when no-autoloads
        ;; Sort them for better readability.
        (setq no-autoloads (sort no-autoloads 'string<))
        ;; Add the `no-autoloads' section.
        (goto-char (point-max))
        (search-backward "\f" nil t)
        (autoload-insert-section-header
         (current-buffer) nil nil no-autoloads this-time)
        (insert generate-autoload-section-trailer)
        ;; Add
        (save-excursion
          (goto-char (point-max))
          (re-search-backward ";;[[:blank:]]+no-byte-compile:[[:blank:]]*t[[:blank:]]*\n" nil 'noerror)
          (replace-match "")
          ;; (replace-string
          ;; ";; no-byte-compile: t\n" "" nil
          ;; (search-backward "\n\^L" (max (- (point-max) 3000) (point-min)))
          ;; (point-max))
          ))
      (save-buffer)
      ;; In case autoload entries were added to other files because of
      ;; file-local autoload-generated-file settings.
      (autoload-save-buffers)
      (emacs-lisp-byte-compile))))



(provide 'constraction-loaddefs)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; constraction-loaddefs.el ends here
