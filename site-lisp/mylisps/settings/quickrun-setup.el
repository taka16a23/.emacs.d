;;; quickrun-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/15 05:00:50 (+0900)
;; Last-Updated:2015/10/15 05:04:42 (+0900)
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


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package quickrun
  ;; :disabled
  :defer
  :commands
  (quickrun)
  :init
  :config
  (message "Loading \"quickrun\"")
  (quickrun-add-command
   "c++/g++" '((:command . "g++")
               (:exec    . ("%c -std=c++11 -x c++ %o -o %e %s" "%e %a"))
               (:compile-only . "%c -std=c++11 -Wall -Werror %o -o %e %s")
               (:remove  . ("%e"))
               (:description . "Compile C++ file with g++ and execute"))
   :override t)

  (quickrun-add-command
   "c++/clang++" '((:command . "clang++")
                   (:exec    . ("%c -std=c++11 -x c++ %o -o %e %s" "%e %a"))
                   (:compile-only . "%c -std=c++11 -Wall -Werror %o -o %e %s")
                   (:remove  . ("%e"))
                   (:description . "Compile C++ file with llvm/clang++ and execute"))
   :override t)
  )



(provide 'quickrun-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; quickrun-setup.el ends here
