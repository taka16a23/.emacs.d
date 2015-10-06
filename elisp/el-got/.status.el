((auto-complete-yasnippet status "required" recipe
                          (:name auto-complete-yasnippet :description "Auto-complete sources for YASnippet" :type http :url "http://www.cx4a.org/pub/auto-complete-yasnippet.el" :depends
                                 (auto-complete yasnippet)))
 (basic-edit-toolkit status "installed" recipe
                     (:name basic-edit-toolkit :description "Basic edit toolkit." :type emacswiki :features basic-edit-toolkit))
 (cl-lib status "required" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (el-get status "required")
 (jaspace status "required" recipe nil)
 (key-chord status "required" recipe
            (:name key-chord :description "Map pairs of simultaneously pressed keys to commands." :type emacswiki :features "key-chord"))
 (let-alist status "required" recipe
            (:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type http :url "http://git.savannah.gnu.org/cgit/emacs/elpa.git/plain/packages/let-alist/let-alist.el"))
 (linkd status "installed" recipe
        (:name linkd :type http-tar :description "Make hypertext with active links in any buffer" :options
               ("xzvf")
               :url "http://www.emacswiki.org/emacs/download/linkd.tar.gz"))
 (moccur-edit status "installed" recipe
              (:name moccur-edit :website "https://github.com/myuhe/moccur-edit.el" :description "apply replaces to multiple files" :type github :pkgname "myuhe/moccur-edit.el" :depends
                     (color-moccur)))
 (python-pep8 status "installed" recipe
              (:type github :pkgname "emacsmirror/python-pep8" :name python-pep8 :type emacsmirror :description "Minor mode for running `pep8'" :features python-pep8 :post-init
                     (require 'tramp)))
 (smartchr status "installed" recipe
           (:name smartchr :type github :pkgname "imakado/emacs-smartchr" :features smartchr :description "Emacs version of smartchr.vim"))
 (space-chord status "required" recipe
              (:name space-chord :description "Key chord with Space" :type emacswiki :depends
                     (key-chord)
                     :features space-chord)))
