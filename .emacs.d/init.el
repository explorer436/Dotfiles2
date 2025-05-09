;; Location of config files in Windows: C:\Users\vardh\AppData\Roaming\.emacs.d

(require 'package)
(package-initialize)

;; To install packages, it is useful to configure the package sources.
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(when (eq system-type 'gnu/linux)
  (set-frame-font "DejaVu Sans Mono" nil t)
)
;; (set-frame-font "DejaVu Sans Mono 10" nil t)
;; (set-frame-font "Monospace Regular" nil t)

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
(when (eq system-type 'darwin)
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
  (org-babel-load-file (expand-file-name "~/.emacs.d/myconfigs/my-config.org"))
  (org-babel-load-file (expand-file-name "~/.emacs.d/myconfigs/my-themes.org"))
  (org-babel-load-file (expand-file-name "~/.emacs.d/myconfigs/my-mini-buffer-completion-configs.org"))
)
(when (eq system-type 'darwin)
  (org-babel-load-file (expand-file-name "~/.emacs.d/myconfigs/my-config.org"))
  (org-babel-load-file (expand-file-name "~/.emacs.d/myconfigs/my-themes.org"))
  (org-babel-load-file (expand-file-name "~/.emacs.d/myconfigs/my-mini-buffer-completion-configs.org"))
)

(setq org-plantuml-jar-path
      (if (eq system-type 'windows-nt)
	  (setq org-plantuml-jar-path (expland-file-name "C:/Users/vardh/Downloads/GitRepositories/my-personal-things/.emacs.d/plantuml-mit-1.2025.0.jar"))
      (setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/plantuml-mit-1.2025.0.jar")))
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

(setq custom-file "~/.emacs.d/my-custom-variables-and-faces.el")
(load custom-file)  

