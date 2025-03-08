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

;; https://elpa.gnu.org/packages/delight.html
(use-package delight :ensure t)
;; (use-package use-package-ensure-system-package :ensure t)

;; use quelpa in addition to melpa as a source of packages
(use-package quelpa-use-package
  :ensure t
  :init
  (setq quelpa-update-melpa-p nil)
  (setq quelpa-self-upgrade-p nil))

;; Recursively load config definitions from a folder/folders recursively
;;https://www.emacswiki.org/emacs/DotEmacsModular
;; (load "/home/explorer436/.emacs.d/load-directory")
;; (load-directory "/home/explorer436/.emacs.d/myconfigs")
;;(load-directory "~/.emacs.d/myconfigs2")
;;(load-directory "~/.emacs.d/myconfigs3")

(when (eq system-type 'gnu/linux)
  (load "~/.emacs.d/load-directory")
  (load-directory "~/.emacs.d/myconfigs")
)
(when (eq system-type 'windows-nt)
  (load "C:/Users/vardh/Downloads/GitRepositories/my-personal-things/.emacs.d/load-directory")
  (load-directory "C:/Users/vardh/Downloads/GitRepositories/my-personal-things/.emacs.d/myconfigs")
)


;; How to navigate by sentences in a paragraph? M-a Move back to the beginning of the sentence (backward-sentence). M-e Move forward to the end of the sentence (forward-sentence).
;; See C-h i g (emacs) Sentences for full details.
;; Take particular note of this:
;; The sentence commands assume that you follow the American typist’s convention of putting two spaces at the end of a sentence. That is, a sentence ends wherever there is a ., ? or ! followed by the end of a line or two spaces, with any number of ), ], ', or " characters allowed in between. A sentence also begins or ends wherever a paragraph begins or ends. It is useful to follow this convention, because it allows the Emacs sentence commands to distinguish between periods that end a sentence and periods that indicate abbreviations.
;; If you want to use just one space between sentences, you can set the variable sentence-end-double-space to nil to make the sentence commands stop for single spaces. However, this has a drawback: there is no way to distinguish between periods that end sentences and those that indicate abbreviations. For convenient and reliable editing, we therefore recommend you follow the two-space convention.
(setq sentence-end-double-space nil)

(when (eq system-type 'gnu/linux)
  (org-babel-load-file (expand-file-name "~/.emacs.d/my-config.org"))
  (org-babel-load-file (expand-file-name "~/.emacs.d/my-themes.org"))
)

(setq org-plantuml-jar-path
      (if (eq system-type 'windows-nt)
          '("C:/Users/vardh/Downloads/GitRepositories/my-personal-things/.emacs.d/plantuml-mit-1.2025.0.jar")
      '("~/Downloads/GitRepositories/my-personal-things/.emacs.d/plantuml-mit-1.2025.0.jar"))
)

(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

;; https://orgmode.org/manual/Evaluating-Code-Blocks.html
;; https://orgmode.org/manual/Languages.html
(org-babel-do-load-languages
  'org-babel-load-languages '(
    (java . t)
    (haskell . t)
    (python . t)
    (plantuml . t)
  )
)

(nconc org-babel-default-header-args:java '(
     (:dir . nil)
     (:results . value)
))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nil nil t)
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(avy beacon calfw calfw-org delight dired-sidebar dracula-theme
	 embark-consult evil flex-autopair fzf git-gutter magit
	 marginalia multiple-cursors orderless org-caldav org-modern
	 org-roam-ui org-tree-slide projectile quelpa-use-package rg
	 smartscan string-inflection toc-org vertico
	 whitespace-cleanup-mode yasnippet-snippets))
 '(safe-local-variable-values
   '((org-roam-db-location
      . "/home/explorer436/Downloads/GitRepositories/programming-notes/org/org-roam.db")
     (org-roam-directory
      . "/home/explorer436/Downloads/GitRepositories/programming-notes/org")
     (org-roam-db-location
      . "~/Downloads/GitRepositories/my-personal-things/Books/org-roam.db")
     (org-roam-directory
      . "~/Downloads/GitRepositories/my-personal-things/Books/")
     (org-roam-directory
      . "~/Downloads/GitRepositories/mindset-notes/org/.dir-locals.el")
     (org-roam-db-location
      . "~/Downloads/GitRepositories/my-articles-collection/org/org-roam.db")
     (org-roam-directory
      . "~/Downloads/GitRepositories/my-articles-collection/org")
     (org-roam-db-location
      . "~/Downloads/GitRepositories/career-notes/org/org-roam.db")
     (org-roam-directory
      . "~/Downloads/GitRepositories/career-notes/org")
     (org-roam-db-location
      . "~/Downloads/GitRepositories/health-notes/org/org-roam.db")
     (org-roam-directory
      . "~/Downloads/GitRepositories/health-notes/org")
     (org-roam-db-location
      . "~/Downloads/GitRepositories/finance-notes/org/org-roam.db")
     (org-roam-directory
      . "~/Downloads/GitRepositories/finance-notes/org")
     (org-roam-db-location
      . "~/Downloads/GitRepositories/mindset-notes/org/org-roam.db")
     (org-roam-directory
      . "~/Downloads/GitRepositories/mindset-notes/org")
     (org-roam-db-location
      . "~/Downloads/GitRepositories/programming-notes/org/org-roam.db")
     (org-roam-directory
      . "~/Downloads/GitRepositories/programming-notes/org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
