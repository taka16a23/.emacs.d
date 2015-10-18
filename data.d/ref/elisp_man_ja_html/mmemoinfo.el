(require 'texinfmt)

(setq texinfo-no-refill-regexp
      (concat
   "^[ ]*@"
   "\\("
   "direntry\\|"
   "lisp\\|"
   "smalllisp\\|"
   "example\\|"
   "smallexample\\|"
   "display\\|"
   "smalldisplay\\|"
   "format\\|"
   "smallformat\\|"
   "flushleft\\|"
   "flushright\\|"
   "menu\\|"
   "multitable\\|"
   "titlepage\\|"
   "iftex\\|"
   "ifhtml\\|"
   "tex\\|"
   "html"
   "\\)"))

(setq texinfo-part-of-para-regexp
  (concat
   "^[ ]*@"
   "\\("
   "b{\\|"
   "bullet{\\|"
   "cite{\\|"
   "code{\\|"
   "email{\\|"
   "emph{\\|"
   "equiv{\\|"
   "error{\\|"
   "expansion{\\|"
   "file{\\|"
   "i{\\|"
   "inforef{\\|"
   "kbd{\\|"
   "key{\\|"
   "lisp{\\|"
   "minus{\\|"
   "point{\\|"
   "print{\\|"
   "pxref{\\|"
   "r{\\|"
   "ref{\\|"
   "result{\\|"
   "samp{\\|"
   "sc{\\|"
   "t{\\|"
   "TeX{\\|"
   "today{\\|"
   "url{\\|"
   "var{\\|"
   "w{\\|"
   "xref{\\|"
   "@-\\|"    ; @- is a descretionary hyphen (not an accent) (a noop).
   texinfo-accent-commands
   "\\)"
   ))

(defun texinfo-append-refill ()
  "Append @refill at end of each paragraph that should be filled.
Do not append @refill to paragraphs within @example and similar environments.  
Do not append @refill to paragraphs containing @w{TEXT} or @*."

  ;; It is necessary to append @refill before other processing because
  ;; the other processing removes information that tells Texinfo
  ;; whether the text should or should not be filled.
  
  (while (< (point) (point-max))
    (let ((refill-blank-lines "^[ \t\n]*$")
          (case-fold-search nil))       ; Don't confuse @TeX and @tex....
      (beginning-of-line)
      ;; 1. Skip over blank lines;
      ;;    skip over lines beginning with @-commands, 
      ;;    but do not skip over lines
      ;;      that are no-refill environments such as @example or
      ;;      that begin with within-paragraph @-commands such as @code.
      (while (and (looking-at (concat "^@\\|^\\\\\\|" refill-blank-lines))
                  (not (looking-at 
                        (concat
                         "\\(" 
                         texinfo-no-refill-regexp
                         "\\|" 
                         texinfo-part-of-para-regexp
                         "\\)")))
                  (< (point) (point-max)))
        (forward-line 1))
      ;; 2. Skip over @example and similar no-refill environments.
      (if (looking-at texinfo-no-refill-regexp)
          (let ((environment
                 (buffer-substring (match-beginning 1) (match-end 1))))
            (progn (re-search-forward (concat "^@end " environment) nil t)
                   (forward-line 1)))
        ;; Else
        ;; 3. Do not refill a paragraph containing @w or @*, or ending
        ;;    with @<newline> followed by a newline.
        (if  (or
              (>= (point) (point-max))
              (re-search-forward 
               "@w{\\|@\\*\\|@\n\n" 
               (save-excursion
                 (forward-paragraph)
                 (forward-line 1)
                 (point)) t))
            ;; Go to end of paragraph and do nothing.
            (forward-paragraph) 
          ;; 4. Else go to end of paragraph and insert @refill
          (forward-paragraph)
          (forward-line -1)
	  (let ((line-beg (point)))
	    (end-of-line)
	    (delete-region
	     (point)
	     (save-excursion (skip-chars-backward " \t") (point)))
	    (forward-char 1)
	    (unless (re-search-backward "@c[ \t\n]\\|@comment[ \t\n]" line-beg t)
	      (forward-char -1))
	    (unless (re-search-backward "@refill\\|@bye\\|@end" line-beg t)
	      (insert "@refill")))
          (forward-line 1))))))

(goto-char (point-min))
(replace-regexp " @emph{([0-9]*/[0-9]*/[0-9]*)}" "")

(defadvice texinfo-raise-lower-sections
  (before delete activate)
  (goto-char (point-min))
  (replace-regexp " @emph{([0-9]*/[0-9]*/[0-9]*)}" ""))

(defun texinfo-unsupported ()
  (message
   (format "%s is not handled by texinfo"
         (buffer-substring texinfo-command-start texinfo-command-end))))
