;; -*- no-byte-compile: t; coding: utf-8; mode: emacs-lisp; -*-
;; [2012/10/16]


;; 下記の文章を多数のファイルの末尾に挿入する為の式

{
;; For Emacs
;; Local Variables:
;; End:
}

;;;; Main
;;
(dolist (file (append (directory-files "/root/.emacs.d/init" t ".el$")
					  (directory-files "/root/.emacs.d/init/mode" t ".el$")
					  (directory-files "/root/.emacs.d/init/function" t ".el$")
					  (directory-files "/root/.emacs.d/init/plugin" t ".el$")))
  (let ((inhibit-read-only t)
		(match nil)
		(count 0)
		first
		(text
		 "\;\; For Emacs
\;\; Local Variables:
\;\; End:
"))
	(with-current-buffer
		(find-file-noselect file)
	  (progn
		(widen)
		(goto-char (point-max))
		;; ";;; (file-name) ends here" がなければ挿入
		(if (save-excursion
				  (search-backward-regexp "ends here" nil t))
			(setq match t)
		  (setq text (concat text "\;\;\; " (file-name-nondirectory (buffer-file-name)) " ends here")))
		;; "ends here" のある行の先頭に移動
		(if match
			(progn
			  (goto-char (match-beginning 0))
			  (beginning-of-line)))
		;; 2行空白をあける
		(save-excursion
		  (while (and (< count 1) (not first))
			(previous-line 1)
			(unless (blank-line-p)
				(setq text (concat "\n" text))
				(if (eq count 0)
					(progn
					  (setq first t)
					  (setq text (concat "\n" text)))))
			(incf count)
			))
		(insert text)
		(save-buffer)
		(kill-buffer))
	)))
;;;;


(list-directory "/root/.emacs.d/init")
"/root/.emacs.d/init/"
(directory-files "/tmp/el" t ".el$")
("/tmp/el/concreted_init.el" "/tmp/el/edit_text_init.el" "/tmp/el/face_init.el" "/tmp/el/final_init.el" "/tmp/el/pre_exec_init.el" "/tmp/el/subroutines_init.el" "/tmp/el/test_init.el")

(eq 0 0)
t

(setq count 0)
0
(incf count)
1

count
1

(concat ww "hello")


(dotimes (i 3)
  (princ "hello\n"))
hello
hello
hello
nil
(forward-line 1)
nil
(previous-line 1)

0
hellohellohellonil




(match-beginning 0)
725

1


( "\n" 3)

(python-blank-line-p)

(save-excursion
  (search-backward-regexp "ends here" nil t))


(setq text
"\;\; For Emacs
\;\; Local Variables:
\;\; End:")
";; For Emacs
;; Local Variables:
;; End:"
(concat text "\n\;\;\; " (file-name-nondirectory (buffer-file-name)) " ends here")

";; For Emacs
;; Local Variables:
;; End:
hello"

";; For Emacs
;; Local Variables:
;; End:hello"

((59 59 32 70 111 114 32 69 109 97 99 115 ...))

(59 59 32 70 111 114 32 69 109 97 99 115 ...)



(append (directory-files "/root/.emacs.d/init" t ".el$")
		(directory-files "/root/.emacs.d/init/mode" t ".el$")
		(directory-files "/root/.emacs.d/init/function" t ".el$")
		(directory-files "/root/.emacs.d/init/plugin" t ".el$"))

(insert "\;")
;nil


(define-key lisp-interaction-mode-map "\C-ch"    'anything-apropos)