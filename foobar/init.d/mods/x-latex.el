;;; x-latex.el --- Emacs X: Sane setup for LaTeX writers.


;;; Commentary:

;; Nice defaults for the premium LaTeX editing mode auctex.

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

(x-require-packages '(auctex cdlatex))
(require 'smartparens-latex)
;; for case
(require 'cl-lib)

(with-eval-after-load "company"
  (x-require-packages '(company-auctex))
  (company-auctex-init))

(defcustom x-latex-fast-math-entry 'LaTeX-math-mode
  "Method used for fast math symbol entry in LaTeX."
  :link '(function-link :tag "AUCTeX Math Mode" LaTeX-math-mode)
  :link '(emacs-commentary-link :tag "CDLaTeX" "cdlatex.el")
  :group 'x
  :type '(choice (const :tag "None" nil)
                 (const :tag "AUCTeX Math Mode" LaTeX-math-mode)
                 (const :tag "CDLaTeX" cdlatex)))

;; AUCTeX configuration
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-close-quote "")
(setq TeX-open-quote "")

(setq-default TeX-master nil)

;; use pdflatex
(setq TeX-PDF-mode t)

;; sensible defaults for macOS, other OSes should be covered out-of-the-box
(when (eq system-type 'darwin)
  (setq TeX-view-program-selection
        '((output-dvi "DVI Viewer")
          (output-pdf "PDF Viewer")
          (output-html "HTML Viewer")))

  (setq TeX-view-program-list
        '(("DVI Viewer" "open %o")
          ("PDF Viewer" "open %o")
          ("HTML Viewer" "open %o"))))

(defun x-latex-mode-defaults ()
  "Default X hook for `LaTeX-mode'."
  (turn-on-auto-fill)
  (abbrev-mode +1)
  (smartparens-mode +1)
  (cl-case x-latex-fast-math-entry
    (LaTeX-math-mode (LaTeX-math-mode 1))
    (cdlatex (turn-on-cdlatex))))

(setq x-latex-mode-hook 'x-latex-mode-defaults)

(add-hook 'LaTeX-mode-hook (lambda ()
                             (run-hooks 'x-latex-mode-hook)))

(provide 'x-latex)

;;; x-latex.el ends here
