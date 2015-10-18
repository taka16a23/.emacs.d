;;; toggle-let-astah.el --- toggle let, let*
;;
;; Version:      1.0
;; Last-Updated:2015/10/18 17:38:20 (+0900)
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
;;  borrow from
;;  http://d.hatena.ne.jp/kiwanami/20110224/1298526678
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(defun toggle-let-astah-search-let ()
  (save-excursion
    (let ((point-min (point-min))
          (re "(\\(lexical-\\)?let\\(\\*\\)?")
          (continue t) pos ast ret)
      (while (and continue (/= (point-min) (point)))
        (goto-char (or (ignore-errors (scan-lists (point) -1 1))
                       (point-min)))
        (save-excursion
          (when (and (looking-at re) (re-search-forward re nil t))
            (setq pos (match-end 0)
                  ast (match-string 2))
            (unless (ignore-errors (scan-lists (point) 1 0))
              (setq ret (cons pos ast)
                    continue nil)))))
      ret)))

(defun toggle-let-astah ()
  (interactive)
  (let (replaced (org-pos (point)))
    (save-excursion
      (let ((limit (or (save-excursion
                         (re-search-backward "\\bdef" nil t))
                       (point-min)))
            pair pos ast)
        (save-restriction
          (narrow-to-region limit org-pos)
          (setq pair (toggle-let-astah-search-let)
                pos (car pair) ast (cdr pair))
          (when pos
            (goto-char pos)
            (cond
             (ast (delete-backward-char 1))
             (t (insert "*")))
            (setq replaced t)))))
    (cond
     (replaced (message "toggle let-aster !"))
     (t (message "let not found.")))))



(provide 'toggle-let-astah)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; elisp-mode-setup.el ends here
