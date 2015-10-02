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
 (auto-highlight-symbol status "installed" recipe
                        (:name auto-highlight-symbol :type github :pkgname "emacsmirror/auto-highlight-symbol" :description "Automatic highlighting current symbol minor mode" :website "https://github.com/emacsmirror/auto-highlight-symbol/"))
 (basic-edit-toolkit status "installed" recipe
                     (:name basic-edit-toolkit :description "Basic edit toolkit." :type emacswiki :features basic-edit-toolkit))
 (bm status "installed" recipe
     (:name bm :pkgname "joodland/bm" :website "http://joodland.github.com/bm/" :type github :description "Visible, persistent, buffer local, bookmarks"))
 (c-eldoc status "installed" recipe
          (:name c-eldoc :description "eldoc-mode plugin for C source code" :type github :pkgname "nflath/c-eldoc" :post-init
                 (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)))
 (cl-lib status "required" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (col-highlight status "installed" recipe
                (:type github :pkgname "emacsmirror/col-highlight" :name col-highlight :description "Highlight the current column." :type emacsmirror :depends vline))
 (color-moccur status "installed" recipe
               (:name color-moccur :website "https://github.com/myuhe/color-moccur.el" :description "multi-buffer occur (grep) mode" :type github :pkgname "myuhe/color-moccur.el"))
 (column-marker status "installed" recipe
                (:name column-marker :description "Highlight certain character columns" :type emacswiki :features column-marker))
 (crontab-mode status "installed" recipe
               (:name crontab-mode :description "Mode for editing crontab files" :type http :url "http://web.archive.org/web/20080716014153/http://www.mahalito.net/~harley/elisp/crontab-mode.el"))
 (csv status "installed" recipe
      (:name csv :description "Functions for reading and parsing CSV (Comma Separated Value) files." :type http :url "http://ulf.epplejasper.de/downloads/csv.el" :features csv))
 (ctable status "installed" recipe
         (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (cython-mode status "installed" recipe
              (:name cython-mode :description "Major mode for the Cython language" :type http :url "https://raw.github.com/cython/cython/master/Tools/cython-mode.el" :features cython-mode :localname "cython-mode.el"))
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
 (edit-server status "installed" recipe
              (:name edit-server :description "Emacs edit-server. This provides an edit server to respond to requests from the Chrome Emacs Chrome plugin." :type http :url "http://github.com/stsquad/emacs_chrome/raw/master/servers/edit-server.el"))
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
 (expand-region status "installed" recipe
                (:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme"))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
           (s dash)
           :type github :pkgname "rejeep/f.el"))
 (flycheck status "installed" recipe
           (:name flycheck :type github :pkgname "flycheck/flycheck" :description "On-the-fly syntax checking extension" :build
                  '(("makeinfo" "-o" "doc/flycheck.info" "doc/flycheck.texi"))
                  :info "./doc" :depends
                  (dash pkg-info let-alist cl-lib)))
 (fold-dwim status "installed" recipe
            (:name fold-dwim :website "https://github.com/emacsmirror/fold-dwim" :description "Unified user interface for Emacs folding mode" :type github :pkgname "emacsmirror/fold-dwim"))
 (frame-fns status "installed" recipe
            (:name frame-fns :description "Non-interactive frame and window functions." :type emacswiki :features "frame-fns"))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (google-this status "installed" recipe
              (:name google-this :description "A set of Emacs functions and bindings to Google under point." :type github :pkgname "Bruce-Connor/emacs-google-this"))
 (gtags status "installed" recipe
        (:name gtags :type http :url "http://cvs.savannah.gnu.org/viewvc/*checkout*/global/global/gtags.el" :description "gtags facility for Emacs" :website "http://www.gnu.org/software/global/"))
 (header2 status "installed" recipe
          (:name header2 :description "Support for creation and update of file headers." :type emacswiki :features "header2"))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
              (("make"))
              :build/darwin
              `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
              :build/windows-nt
              (let
                  ((generated-autoload-file
                    (expand-file-name "helm-autoloads.el"))
                   \
                   (backup-inhibited t))
              (update-directory-autoloads default-directory)
              nil)))
(hide-lines status "installed" recipe
(:name hide-lines :description "Commands for hiding lines based on a regexp." :type github :pkgname "vapniks/hide-lines"))
(highlight-indentation status "installed" recipe
(:name highlight-indentation :description "Function for highlighting indentation" :type git :url "https://github.com/antonj/Highlight-Indentation-for-Emacs"))
(init-loader status "installed" recipe
(:name init-loader :website "https://github.com/emacs-jp/init-loader" :description "It enables you to categorize your configurations and separate them into multiple files." :type github :pkgname "emacs-jp/init-loader"))
(jaspace status "required" recipe nil)
(jedi status "installed" recipe
(:name jedi :description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :submodule nil :depends
(epc auto-complete python-environment)))
(key-chord status "installed" recipe
(:name key-chord :description "Map pairs of simultaneously pressed keys to commands." :type emacswiki :features "key-chord"))
(let-alist status "required" recipe
(:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type http :url "http://git.savannah.gnu.org/cgit/emacs/elpa.git/plain/packages/let-alist/let-alist.el"))
(linkd status "installed" recipe
(:name linkd :type http-tar :description "Make hypertext with active links in any buffer" :options
("xzvf")
:url "http://www.emacswiki.org/emacs/download/linkd.tar.gz"))
(linum-off status "installed" recipe
(:name linum-off :description "Provides an interface for turning line-numbering off" :type emacswiki :features linum-off))
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
(mark-multiple status "installed" recipe
(:name mark-multiple :description "mark several regions at once" :website "http://emacsrocks.com/e08.html" :type github :pkgname "magnars/mark-multiple.el" :features "mark-more-like-this"))
(moccur-edit status "installed" recipe
(:name moccur-edit :website "https://github.com/myuhe/moccur-edit.el" :description "apply replaces to multiple files" :type github :pkgname "myuhe/moccur-edit.el" :depends
(color-moccur)))
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
(org-mode status "installed" recipe
(:name org-mode :website "http://orgmode.org/" :description "Org-mode is for keeping notes, maintaining ToDo lists, doing project planning, and authoring with a fast and effective plain-text system." :type git :url "git://orgmode.org/org-mode.git" :info "doc" :build/berkeley-unix `,(mapcar
(lambda
(target)
(list "gmake" target
(concat "EMACS="
(shell-quote-argument el-get-emacs))))
'("oldorg"))
:build `,(mapcar
(lambda
(target)
(list "make" target
(concat "EMACS="
(shell-quote-argument el-get-emacs))))
'("oldorg"))
:load-path
("." "contrib/lisp" "lisp")
:load
("lisp/org-loaddefs.el")))
(pkg-info status "installed" recipe
(:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
(dash epl)))
(popup status "installed" recipe
(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :depends cl-lib :pkgname "auto-complete/popup-el"))
(python-environment status "installed" recipe
(:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
(deferred)))
(python-mode status "installed" recipe
(:name python-mode :description "Major mode for editing Python programs" :type bzr :url "lp:python-mode" :load-path
("." "test")
:compile nil :prepare
(progn
(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'doctest-mode "doctest-mode" "Doctest unittest editing mode." t)
(setq py-install-directory
(el-get-package-directory "python-mode"))
(add-to-list 'auto-mode-alist
'("\\.py$" . python-mode))
(add-to-list 'interpreter-mode-alist
'("python" . python-mode)))))
(python-pep8 status "installed" recipe
(:type github :pkgname "emacsmirror/python-pep8" :name python-pep8 :type emacsmirror :description "Minor mode for running `pep8'" :features python-pep8 :post-init
(require 'tramp)))
(quickrun status "installed" recipe
(:name quickrun :description "Run commands quickly" :website "https://github.com/syohex/emacs-quickrun" :type github :pkgname "syohex/emacs-quickrun" :features "quickrun"))
(rainbow-delimiters status "installed" recipe
(:name rainbow-delimiters :website "https://github.com/Fanael/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "Fanael/rainbow-delimiters"))
(recentf-ext status "installed" recipe
(:name recentf-ext :description "Recentf extensions" :type emacswiki :features "recentf-ext"))
(revive status "installed" recipe
(:name revive :description "Revive.el saves current editing status including the window splitting configuration, which can't be recovered by `desktop.el' nor by `saveconf.el', into a file and reconstructs that status correctly." :website "http://www.gentei.org/~yuuji/software/" :type http :url "http://www.gentei.org/~yuuji/software/revive.el" :features "revive"))
(s status "installed" recipe
(:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
(savekill status "installed" recipe
(:name savekill :description "Save kill ring to disk" :type emacswiki :features "savekill"))
(smart-operator status "installed" recipe
(:name smart-operator :description "Insert operators with surrounding spaces smartly." :type github :pkgname "xwl/smart-operator"))
(smartchr status "installed" recipe
(:name smartchr :type github :pkgname "imakado/emacs-smartchr" :features smartchr :description "Emacs version of smartchr.vim"))
(smartrep status "installed" recipe
(:name smartrep :description "Support sequential operation which omitted prefix keys." :website "http://sheephead.homelinux.org/2011/12/19/6930/" :type github :pkgname "myuhe/smartrep.el" :prepare
(progn
(autoload 'smartrep-restore-original-position "smartrep" nil t)
(autoload 'smartrep-map-internal "smartrep" nil t))))
(space-chord status "installed" recipe
(:name space-chord :description "Key chord with Space" :type emacswiki :depends
(key-chord)
:features space-chord))
(syslog-mode status "installed" recipe
(:name syslog-mode :description "Emacs major-mode for viewing log files." :type github :pkgname "vapniks/syslog-mode" :depends
(hide-lines)
:prepare
(progn
(add-to-list 'auto-mode-alist
'("/var/log.*\\'" . syslog-mode)))))
(systemd-mode status "installed" recipe
(:name systemd-mode :description "Major mode for editing systemd units" :type github :pkgname "holomorph/systemd-mode"))
(tabbar status "installed" recipe
(:name tabbar :description "Display a tab bar in the header line." :type github :pkgname "dholm/tabbar" :lazy t))
(tail status "installed" recipe
(:name tail :description "Tail files within Emacs" :type http :url "http://www.drieu.org/code/sources/tail.el" :features tail))
(text-translator status "installed" recipe
(:name text-translator :description "Translate text within GNU Emacs by online translators" :type bzr :url "lp:~khiker/+junk/text-translator" :website "http://d.hatena.ne.jp/khiker/20070503/emacs_text_translator"))
(undo-tree status "installed" recipe
(:name undo-tree :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
(vline status "installed" recipe
(:name vline :description "show vertical line (column highlighting) mode." :type emacswiki :features vline))
(w3m-extension status "installed" recipe
(:name w3m-extension :description "Emacs-W3m extensions" :depends
(emacs-w3m basic-edit-toolkit)
:type emacswiki :features w3m-extension))
(window-layout status "installed" recipe
(:name window-layout :description "window layout manager" :website "https://github.com/kiwanami/emacs-window-layout" :type github :pkgname "kiwanami/emacs-window-layout" :features "window-layout"))
(yasnippet status "installed" recipe
(:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
(("git" "submodule" "update" "--init" "--" "snippets")))))
