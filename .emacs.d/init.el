;; Location of config files in Windows: C:\Users\vardh\AppData\Roaming\.emacs.d

(require 'package)
(package-initialize)

;; To install packages, it is useful to configure the package sources.
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; To manage the package configurations with use-package, you must install it with the following code snippet.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package delight :ensure t)
(use-package use-package-ensure-system-package :ensure t)

(use-package quelpa-use-package
  :ensure t
  :init
  (setq quelpa-update-melpa-p nil)
  (setq quelpa-self-upgrade-p nil))

;; Recursively load config definitions from a folder/folders recursively
;;https://www.emacswiki.org/emacs/DotEmacsModular
(load "~/.emacs.d/load-directory")
(load-directory "~/.emacs.d/myconfigs")
;;(load-directory "~/.emacs.d/myconfigs2")
;;(load-directory "~/.emacs.d/myconfigs3")

(org-babel-load-file (expand-file-name "~/.emacs.d/my-config.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/my-themes.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elfeed-feeds '("https://blog.osm-ai.net/feed.xml"))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(quelpa-use-package org-timeblock org-modern org-caldav elfeed-org elfeed calfw-org calfw org-tree-slide string-inflection embark-consult embark whitespace-cleanup-mode soft-morning-theme firecode-theme marginalia orderless vertico htmlize ox-hugo consult rg js-import flex-autopair tide rjsx-mode ag ripgrep org-make-toc toc-org dap-java lsp-mode helm-lsp lsp-java lsp-ui yasnippet-snippets yasnippet company evil treemacs-magit treemacs-icons-dired treemacs-projectile treemacs projectile auto-complete beacon emacs-color-themes emacs-color-theme which-key use-package try multiple-cursors magit helm haskell-mode dracula-theme avy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

