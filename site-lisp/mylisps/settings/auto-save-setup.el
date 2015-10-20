;;; auto-save-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/11 07:48:28 (+0900)
;; Last-Updated:2015/10/19 14:18:13 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(require 'environment-setup "environment-setup" 'noerr)

(custom-set-variables
 '(auto-save-timeout 10)
 '(auto-save-interval 300)
 '(auto-save-list-file-prefix (my-var-dir-join "auto-save-list/save-")))

(declare-function msdos-long-file-names "msdos.c")
(declare-function dos-8+3-filename "dos-fns" (filename))

(defadvice kill-emacs (around inhibit-delete-autosave-file activate)
  "Inhibit delete auto save files."
  (let ((delete-auto-save-files nil))
    ad-do-it
    ))

(defun make-auto-save-file-name ()
  (if buffer-file-name
      (let ((handler (find-file-name-handler buffer-file-name
                                             'make-auto-save-file-name)))
        (if handler
            (funcall handler 'make-auto-save-file-name)
          (let ((list auto-save-file-name-transforms)
                (filename buffer-file-name)
                (save-location (my-bk-autosave-dir-get))
                result uniq)
            ;; Apply user-specified translations
            ;; to the file name.
            (while (and list (not result))
              (if (string-match (car (car list)) filename)
                  (setq result (replace-match (cadr (car list)) t nil
                                              filename)
                        uniq (car (cddr (car list)))))
              (setq list (cdr list)))
            (if result
                (if uniq
                    (setq filename (concat
                                    (file-name-directory result)
                                    (subst-char-in-string
                                     ?/ ?!
                                     (replace-regexp-in-string "!" "!!"
                                                               filename))))
                  (setq filename result)))
            (setq result
                  (if (and (eq system-type 'ms-dos)
                           (not (msdos-long-file-names)))
                      ;; We truncate the file name to DOS 8+3 limits
                      ;; before doing anything else, because the regexp
                      ;; passed to string-match below cannot handle
                      ;; extensions longer than 3 characters, multiple
                      ;; dots, and other atrocities.
                      (let ((fn (dos-8+3-filename
                                 (file-name-nondirectory buffer-file-name))))
                        (string-match
                         "\\`\\([^.]+\\)\\(\\.\\(..?\\)?.?\\|\\)\\'"
                         fn)
                        (concat (file-name-directory buffer-file-name)
                                "#" (match-string 1 fn)
                                "." (match-string 3 fn) "#"))
                    (concat (expand-file-name filename save-location)
                            "#"
                            (replace-regexp-in-string "/" "!" filename)
                            "#")))

            ;; Make sure auto-save file names don't contain characters
            ;; invalid for the underlying filesystem.
            (if (and (memq system-type '(ms-dos windows-nt cygwin))
                     ;; Don't modify remote (ange-ftp) filenames
                     (not (string-match "^/\\w+@[-A-Za-z0-9._]+:" result)))
                (convert-standard-filename result)
              result))))

    ;; Deal with buffers that don't have any associated files.  (Mail
    ;; mode tends to create a good number of these.)

    (let ((buffer-name (buffer-name))
          (limit 0)
          file-name)
      ;; Restrict the characters used in the file name to those which
      ;; are known to be safe on all filesystems, url-encoding the
      ;; rest.
      ;; We do this on all platforms, because even if we are not
      ;; running on DOS/Windows, the current directory may be on a
      ;; mounted VFAT filesystem, such as a USB memory stick.
      (while (string-match "[^A-Za-z0-9-_.~#+]" buffer-name limit)
        (let* ((character (aref buffer-name (match-beginning 0)))
               (replacement
                ;; For multibyte characters, this will produce more than
                ;; 2 hex digits, so is not true URL encoding.
                (format "%%%02X" character)))
          (setq buffer-name (replace-match replacement t t buffer-name))
          (setq limit (1+ (match-end 0)))))

      ;; Generate the file name.
      (setq file-name
            (make-temp-file
             (let ((fname
                    (expand-file-name
                     (format "#%s#" buffer-name)
                     ;; Try a few alternative directories, to get one we can
                     ;; write it.
                     (cond
                      ((file-writable-p default-directory) default-directory)
                      ((file-writable-p "/var/tmp/") "/var/tmp/")
                      ("~/")))))
               (if (and (memq system-type '(ms-dos windows-nt cygwin))
                        ;; Don't modify remote (ange-ftp) filenames
                        (not (string-match "^/\\w+@[-A-Za-z0-9._]+:" fname)))
                   ;; The call to convert-standard-filename is in case
                   ;; buffer-name includes characters not allowed by the
                   ;; DOS/Windows filesystems.  make-temp-file writes to the
                   ;; file it creates, so we must fix the file name _before_
                   ;; make-temp-file is called.
                   (convert-standard-filename fname)
                 fname))
             nil "#"))
      ;; make-temp-file creates the file,
      ;; but we don't want it to exist until we do an auto-save.
      (condition-case ()
          (delete-file file-name)
        (file-error nil))
      file-name))
  )



(provide 'auto-save-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-save-setup.el ends here
