((apache-mode status "installed" recipe
              (:name apache-mode :description "Major mode for editing Apache configuration files" :type github :pkgname "emacsmirror/apache-mode"))
 (auto-async-byte-compile status "installed" recipe
                          (:name auto-async-byte-compile :description "Automatically byte-compile when saved" :website "http://www.emacswiki.org/emacs/AutoAsyncByteCompile" :type emacswiki :post-init
                                 (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
                                 :features "auto-async-byte-compile"))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)
                       :features auto-complete-config :post-init
                       (progn
                         (add-to-list 'ac-dictionary-directories
                                      (expand-file-name "dict" default-directory))
                         (ac-config-default))))
 (auto-complete-yasnippet status "installed" recipe
                          (:name auto-complete-yasnippet :description "Auto-complete sources for YASnippet" :type http :url "http://www.cx4a.org/pub/auto-complete-yasnippet.el" :depends
                                 (auto-complete yasnippet)))
 (cl-lib status "required" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (crontab-mode status "installed" recipe
               (:name crontab-mode :description "Mode for editing crontab files" :type http :url "http://web.archive.org/web/20080716014153/http://www.mahalito.net/~harley/elisp/crontab-mode.el"))
 (ctable status "installed" recipe
         (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (dired+ status "installed" recipe
         (:name dired+ :after nil :features
                (dired+)
                :description "Extensions to Dired" :type emacswiki))
 (dmacro status "installed" recipe
         (:name dmacro :description "Dynamic MACRO" :type http-tar :options
                ("xzf")
                :localname "dmacro.tar.gz" :url "ftp://ftp.sgi.com/other/dmacro/dmacro.tar.gz" :build
                (("make" "dmacro.info"))
                :info "dmacro"))
 (dsvn status "installed" recipe
       (:name dsvn :description "This is an interface for managing Subversion working copies.  It can show you an up-to-date view of the current status, and commit changes. If also helps you do other tasks such as updating, switching, diffing and more." :type http :url "http://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side/emacs/dsvn.el"))
 (e2wm status "installed" recipe
       (:name e2wm :after nil :features
              ("e2wm")
              :description "simple window manager for emacs" :website "https://github.com/kiwanami/emacs-window-manager" :type github :pkgname "kiwanami/emacs-window-manager" :depends window-layout))
 (el-get status "required")
 (emacs-w3m status "installed" recipe
            (:name emacs-w3m :description "A simple Emacs interface to w3m" :type cvs :website "http://emacs-w3m.namazu.org/" :module "emacs-w3m" :url ":pserver:anonymous@cvs.namazu.org:/storage/cvsroot" :build
                   `(("autoconf")
                     ("./configure" ,(format "--with-emacs=%s" el-get-emacs))
                     ("make"))
                   :build/windows-nt
                   (("sh" "./autogen.sh")
                    ("sh" "./configure")
                    ("make"))
                   :info "doc"))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
             (deferred ctable)))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
           (s dash)
           :type github :pkgname "rejeep/f.el"))
 (flycheck status "installed" recipe
           (:name flycheck :type github :pkgname "flycheck/flycheck" :description "On-the-fly syntax checking extension" :build
                  '(("makeinfo" "-o" "doc/flycheck.info" "doc/flycheck.texi"))
                  :info "./doc" :depends
                  (dash pkg-info let-alist cl-lib)))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (header2 status "installed" recipe
          (:name header2 :description "Support for creation and update of file headers." :type emacswiki :features "header2"))
 (jedi status "installed" recipe
       (:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :submodule nil :depends
              (epc auto-complete python-environment)))
 (let-alist status "required" recipe
            (:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type http :url "http://git.savannah.gnu.org/cgit/emacs/elpa.git/plain/packages/let-alist/let-alist.el"))
 (magit status "installed" recipe
        (:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :branch "master" :minimum-emacs-version "24.4" :depends
               (dash)
               :provide
               (with-editor)
               :info "Documentation" :load-path "lisp/" :compile "lisp/" :build
               `(("make" ,(format "EMACSBIN=%s" el-get-emacs)
                  "docs")
                 ("touch" "lisp/magit-autoloads.el"))
               :build/berkeley-unix
               `(("gmake" ,(format "EMACSBIN=%s" el-get-emacs)
                  "docs")
                 ("touch" "lisp/magit-autoloads.el"))
               :build/windows-nt
               (with-temp-file "lisp/magit-autoloads.el" nil)))
 (multi-term status "installed" recipe
             (:name multi-term :after nil :features
                    (multi-term)
                    :description "A mode based on term.el, for managing multiple terminal buffers in Emacs." :type emacswiki))
 (multiple-cursors status "installed" recipe
                   (:name multiple-cursors :description "An experiment in adding multiple cursors to emacs" :type github :pkgname "magnars/multiple-cursors.el"))
 (open-junk-file status "installed" recipe
                 (:name open-junk-file :after nil :features
                        ("open-junk-file")
                        :description "Open a junk (memo) file to try-and-error" :type emacswiki))
 (pkg-info status "installed" recipe
           (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
                  (dash epl)))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :depends cl-lib :pkgname "auto-complete/popup-el"))
 (python-environment status "installed" recipe
                     (:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
                            (deferred)))
 (s status "installed" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (savekill status "installed" recipe
           (:name savekill :description "Save kill ring to disk" :type emacswiki :features "savekill"))
 (text-translator status "installed" recipe
                  (:name text-translator :description "Translate text within GNU Emacs by online translators" :type bzr :url "lp:~khiker/+junk/text-translator" :website "http://d.hatena.ne.jp/khiker/20070503/emacs_text_translator"))
 (undo-tree status "installed" recipe
            (:name undo-tree :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
 (window-layout status "installed" recipe
                (:name window-layout :description "window layout manager" :website "https://github.com/kiwanami/emacs-window-layout" :type github :pkgname "kiwanami/emacs-window-layout" :features "window-layout"))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
                   (("git" "submodule" "update" "--init" "--" "snippets")))))
