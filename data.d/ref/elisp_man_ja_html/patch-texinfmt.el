--- texinfmt.el-ORIG	Sun May 30 04:21:06 1999
+++ texinfmt.el	Thu Jan 13 10:52:58 2000
@@ -1111,6 +1111,78 @@
 
 ;;; @node, @menu, @detailmenu
 
+; section levels taken from makeinfo.c
+(defconst texinfo-format-node-levels
+  '( ("unnumberedsubsubsec" . 5)
+     ("unnumberedsubsec" . 4)
+     ("unnumberedsec" . 3)
+     ("unnumbered" . 2)
+     ("appendixsubsubsec" . 5)
+     ("appendixsubsec" . 4)
+     ("appendixsec" . 3)
+     ("appendixsection" . 3)
+     ("appendix" . 2)
+     ("subsubsec" . 5)
+     ("subsubsection" . 5)
+     ("subsection" . 4)
+     ("section" . 3)
+     ("chapter" . 2)
+     ("top" . 1)))
+
+(defvar texinfo-format-node:*level-name
+  (vector nil nil nil nil nil nil))
+
+(defun texinfo-format-node-find-level ()
+  (let (level)
+    (save-excursion
+      (forward-line 1)
+      (while (null level)
+	(let (pos)
+	  (if (setq pos (re-search-forward "^@[a-zA-Z0-9]+" nil t))
+	      (setq level (assoc (buffer-substring
+				  (progn (beginning-of-line)
+					 (forward-char 1)
+					 (point))
+				  pos)
+				 texinfo-format-node-levels))
+	    (setq level t)))))
+    (if (eq level t)
+	0
+      (cdr level))))
+
+
+(defun texinfo-format-node-find-next (level)
+  (let (node-pos node-name (done nil))
+    (save-excursion
+      (while (null done)
+	(forward-line 1)
+	(if (setq node-pos (re-search-forward "^@node  *" nil t))
+	    (let (next)
+	      (setq node-name
+		    (buffer-substring
+		     node-pos
+		     (progn (re-search-forward "$\\|,")
+			    (forward-char -1)
+			    (unless (eq (following-char) ?,)
+			      (forward-char 1))
+			    (point))))
+	      (if (eq (following-char) ?,)
+		  (setq done t
+			node-name nil)
+		(forward-line 1)
+		(if (integerp (setq next (texinfo-format-node-find-level)))
+		    (if (= next level)
+			(setq done t)
+		      (if (< next level)
+			  (setq done t
+				node-name nil)
+			(setq node-name nil)))
+		  (setq node-name nil))))
+	  ;; re-search-foward failed
+	  (setq done t
+		node-name nil))))
+  node-name))
+
 (put 'node 'texinfo-format 'texinfo-format-node)
 (put 'nwnode 'texinfo-format 'texinfo-format-node)
 (defun texinfo-format-node ()
@@ -1118,7 +1190,31 @@
          (name (nth 0 args))
          (next (nth 1 args))
          (prev (nth 2 args))
-         (up (nth 3 args)))
+         (up (nth 3 args))
+	 (level (texinfo-format-node-find-level)))
+    ;; XXX -- beginning of make node links
+    (if (and (integerp level) (> level 0))
+	(let ((i (1+ level)))
+	  (while (<= i 5)
+	    (aset texinfo-format-node:*level-name
+		  i nil)
+	    (setq i (1+ i)))
+	  (if (and name next prev up)
+	      ;; set up default for descending nodes
+	      (progn (aset texinfo-format-node:*level-name
+			   level name)
+		     (aset texinfo-format-node:*level-name
+			   (1- level) up))
+	    ;; only node name without next, prev, up
+	    (unless up (setq up (aref texinfo-format-node:*level-name
+				      (1- level))))
+	    (unless prev (setq prev (aref texinfo-format-node:*level-name
+					  level)))
+	    (aset texinfo-format-node:*level-name
+		  level name)
+	    (unless next 
+	      (setq next (texinfo-format-node-find-next level))))))
+    ;; XXX --  end of make node links
     (texinfo-discard-command)
     (setq texinfo-last-node name)
     (let ((tem (if texinfo-fold-nodename-case (downcase name) name)))
@@ -1212,7 +1308,8 @@
         (insert (or fname (car args)) ": ")
         (if (nth 3 args)
             (insert "(" (nth 3 args) ")"))
-        (insert (car args))))))
+        (insert (or (car args) ""))
+        (or (save-excursion (looking-at "[.,]")) (insert "."))))))
 
 (put 'pxref 'texinfo-format 'texinfo-format-pxref)
 (defun texinfo-format-pxref ()
@@ -1220,6 +1317,7 @@
   (or (save-excursion
         (forward-char -2)
         (looking-at "::"))
+      (save-excursion (looking-at "[.,]"))
       (insert ".")))
 
 ;; @inforef{NODE, FNAME, FILE}
@@ -1230,7 +1328,8 @@
   (let ((args (texinfo-format-parse-args)))
     (texinfo-discard-command)
     (if (nth 1 args)
-        (insert "*Note " (nth 1 args) ": (" (nth 2 args) ")" (car args))
+        (prog1 (insert "*Note " (nth 1 args) ": (" (nth 2 args) ")" (car args))
+               (or (save-excursion (looking-at "[.,]")) (insert ".")))
       (insert "*Note " "(" (nth 2 args) ")" (car args) "::"))))
 
 
