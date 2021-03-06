;;; linux-face-setup.el ---    Setting face for Linux
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Jan  6 15:01:18 2013 (+0900)
;; Last-Updated:2015/10/15 13:10:10 (+0900)
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
;; XLFD
;; 1-2-3-4-5-6-7-8-9-10-11-12-13-14-15
;; FontNameRegistry-Foundry-Family-WeightName-Slant-SetwidthName-AddStyleName-PixelSize
;; -PointSize-ResolutionX-ResolutionY-Spacing-AverageWidth-CharSetRegistry-CharSetEncoding
;; |----+------------------+----------------------------------------------------------------|
;; |  1 | FontNameRegistry | フォント登録者の名前。通常は何も書かない。                     |
;; |----+------------------+----------------------------------------------------------------|
;; |  2 | Foundry          | フォント製造者の名前。フォント名の場合もある。                 |
;; |----+------------------+----------------------------------------------------------------|
;; |  3 | Family           | フォントファミリ。フォントの種別を表す。                       |
;; |----+------------------+----------------------------------------------------------------|
;; |  4 | WeightName       | 文字の太さ。以下のいずれかが入る。                             |
;; |    |                  | thin (ultralight)                                              |
;; |    |                  | extralight                                                     |
;; |    |                  | light                                                          |
;; |    |                  | book (semilight,demilight)                                     |
;; |    |                  | medium                                                         |
;; |    |                  | demibold (semibold)                                            |
;; |    |                  | bold                                                           |
;; |    |                  | heavy (extrabold)                                              |
;; |    |                  | black (ultrabold)                                              |
;; |----+------------------+----------------------------------------------------------------|
;; |  5 | Slant            | 文字の傾き。rは傾き無し、iは傾き有り。                         |
;; |----+------------------+----------------------------------------------------------------|
;; |  6 | SetwidthName     | 文字の横幅。narrow(狭い)、normal(普通)、wide(広い)など。       |
;; |----+------------------+----------------------------------------------------------------|
;; |  7 | AddStyleName     | 付加的なフォントスタイル。                                     |
;; |    |                  | serifやcursiveなどが入ることもあるが、通常何も書かれない。     |
;; |----+------------------+----------------------------------------------------------------|
;; |  8 | PixelSize        | ピクセル単位でのフォントサイズ。                               |
;; |----+------------------+----------------------------------------------------------------|
;; |  9 | PointSize        | ポイント単位でのフォントサイズ。                               |
;; |    |                  | ただし単位は0.1pointなので、10倍した値を書く。                 |
;; |----+------------------+----------------------------------------------------------------|
;; | 10 | ResolutionX      | 横方向の解像度。単位はdpi(dots per inch)。                     |
;; |----+------------------+----------------------------------------------------------------|
;; | 11 | ResolutionY      | 縦方向の解像度。                                               |
;; |----+------------------+----------------------------------------------------------------|
;; | 12 | Spacing          | 文字間隔。                                                     |
;; |    |                  | Mはモノスペース(等幅)、Pはプロポーショナル(可変幅)を意味する。 |
;; |    |                  | Cはセルを意味し、境界域を持つ。                                |
;; |----+------------------+----------------------------------------------------------------|
;; | 13 | AverageWidth     | 平均文字幅。                                                   |
;; |    |                  | 単位は0.1point。                                               |
;; |    |                  | 全角フォントの場合PointSizeと同値。半角の場合1/2になる。       |
;; |----+------------------+----------------------------------------------------------------|
;; | 14 | CharSetRegistry  | 登録組織、規格名など。                                         |
;; |    |                  | 和文フォントの場合は日本工業規格｜の規格番号が入る。           |
;; |----+------------------+----------------------------------------------------------------|
;; | 15 | CharSetEncoding  |                                                                |
;; |----+------------------+----------------------------------------------------------------|
;;
;;;; フォント
;; abcdefghijklmnopqrstuvwxyz
;; ABCDEFGHIJKLMNOPQRSTUVWXYZ
;; `1234567890-=\[];',./
;; ~!@#$%^&*()_+|{}:"<>?
;;
;; 壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五
;; 123456789012345678901234567890123456789012345678901234567890
;; ABCdeＡＢＣｄｅ
;;
;; ┌─────────────────────────────┐
;; │　　　　　　　　　　　　　罫線                          │
;; └─────────────────────────────┘
;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;; 2013/01/06    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package linux-face
  ;; :disabled
  :defer 2
  :init
  :config
  (message "Loading \"linux-face\"")
  )



(provide 'linux-face-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; linux-face-setup.el ends here
