;;; x-haskell.el --- Emacs Prelude: Nice config for Haskell programming.


;;; Commentary:

;; Nice config for Haskell programming.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

(require 'x-programming)
(x-require-packages '(haskell-mode))

(with-eval-after-load 'haskell-mode
  (defun x-haskell-mode-defaults ()
    (subword-mode +1)
    (eldoc-mode +1)
    (haskell-indentation-mode +1)
    (interactive-haskell-mode +1))

  (setq x-haskell-mode-hook 'x-haskell-mode-defaults)

  (add-hook 'haskell-mode-hook (lambda ()
                                 (run-hooks 'x-haskell-mode-hook))))

(provide 'x-haskell)

;;; x-haskell.el ends here
