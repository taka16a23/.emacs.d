;;; 80_python_mode_start.el --- python mode setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:26 2012 (+0900)
;; Last-Updated: 2013/11/26 08:54:46 (+0900)
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
;; 2013/09/19    Atami
;;    Modified: auto-mode-alist line use cons purecopy.
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  (require 'subroutines_start nil 'noerror)
  (defvar my-data-dir)
  (defvar my-plugin-dir)
  )

(defvar my-pylib-dir
  (replace-regexp-in-string "/" "\\\\" (concat my-data-dir "pylib"))
  "Location of parsonal python library.Do not add '/'.")

(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'ipython "python-mode" "IPython")

;; Pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call  "pymacs")
(autoload 'pymacs-eval  "pymacs" nil 'interactive)
(autoload 'pymacs-exec  "pymacs" nil 'interactive)
(autoload 'pymacs-load  "pymacs" nil 'interactive)
;; Document
(autoload 'pylookup-lookup "pylookup")
(autoload 'pylookup-update "pylookup")
;; Nose
(autoload 'nosetests-all        "nose" nil t)
(autoload 'nosetests-module     "nose" nil t)
(autoload 'nosetests-one        "nose" nil t)
(autoload 'nosetests-stop       "nose" nil t)
(autoload 'nosetests-pdb-all    "nose" nil t)
(autoload 'nosetests-pdb-module "nose" nil t)
(autoload 'nosetests-pdb-one    "nose" nil t)
;; Cython Mode
(autoload 'cython-mode "cython-mode" "Mode for editing Cython source files")
;; Virtual Env
(autoload 'virtualenv-activate "virtualenv"
  "Activate a Virtual Environment specified by PATH" t)
(autoload 'virtualenv-workon "virtualenv"
  "Activate a Virtual Environment present using virtualenvwrapper" t)

;; Do not remove. for load alternate python.el
(add-to-list 'load-path my-plugin-dir)

(add-to-list 'auto-mode-alist (cons (purecopy "\\.pyx\\'") 'cython-mode))
(add-to-list 'auto-mode-alist (cons (purecopy "\\.pxd\\'") 'cython-mode))
(add-to-list 'auto-mode-alist (cons (purecopy "\\.pxi\\'") 'cython-mode))
(add-to-list 'auto-mode-alist (cons (purecopy "\\.py3\\'") 'python-mode))
(add-to-list 'auto-mode-alist (cons (purecopy "\\.py\\'")  'python-mode))
(add-to-list 'auto-mode-alist (cons (purecopy "\\.pyw\\'") 'python-mode))

(defvar python-eval-after-load-hook nil
  "Hook for python `eval-after-load'.")
(add-hook 'python-eval-after-load-hook 'python-mode-custom-predefine)
(add-hook 'python-eval-after-load-hook 'python-mode-predefine 'append)
(add-hook 'python-eval-after-load-hook 'python-mode-map-predefine 'append)
(add-hook 'python-eval-after-load-hook 'python-mode-face-predefine 'append)
(add-hook 'python-eval-after-load-hook 'pymacs-predefine 'append)
(add-hook 'python-eval-after-load-hook 'inferior-python-mode-predefine 'append)
;; TODO: (Atami) [2013/11/02]
;; (add-hook 'python-eval-after-load-hook
          ;; 'inferior-python-mode-map-predefine 'append)
(run-hooks-after-load "python" 'python-eval-after-load-hook)

(defvar python-mode-eval-after-load-hook nil
  "Hook for `python-mode' `eval-after-load'.")
(add-hook 'python-mode-eval-after-load-hook 'python-mode-custom-predefine)
(add-hook 'python-mode-eval-after-load-hook 'python-mode-predefine 'append)
(add-hook 'python-mode-eval-after-load-hook
          'python-mode-map-predefine 'append)
(add-hook 'python-mode-eval-after-load-hook
          'python-mode-face-predefine 'append)
(add-hook 'python-mode-eval-after-load-hook
          'inferior-python-mode-predefine 'append)
;; (add-hook 'python-mode-eval-after-load-hook
;;           'inferior-python-mode-map-predefine 'append)
(add-hook 'python-mode-eval-after-load-hook 'pymacs-predefine 'append)
(run-hooks-after-load "python-mode" 'python-mode-eval-after-load-hook)


;; DOCUMENT
;; ============================================================================
(defvar pylookup-eval-after-load-hook nil
  "Hook for pylookup `eval-after-load'.")
(add-hook 'pylookup-eval-after-load-hook 'pylookup-mode-custom-predefine)
(add-hook 'pylookup-eval-after-load-hook 'pylookup-mode-predefine 'append)
(add-hook 'pylookup-eval-after-load-hook 'pylookup-mode-map-predefine 'append)
(add-hook 'pylookup-eval-after-load-hook 'pylookup-mode-face-predefine 'append)
(run-hooks-after-load "pylookup" 'pylookup-eval-after-load-hook)

;; TEST
;; ============================================================================

;; INTERPRETER
;; ============================================================================

;; MISCELLANEOUS
;; ============================================================================



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 80_python_mode_start.el ends here
