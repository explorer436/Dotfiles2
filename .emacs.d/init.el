;; Location of config files in Windows: C:\Users\vardh\AppData\Roaming\.emacs.d

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package)
)


(org-babel-load-file (expand-file-name "~/.emacs.d/my-config.org"))

(setq org-agenda-files
      (if (eq system-type 'windows-nt)
	  '("~/../../Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/birthdays/Birthdays.org")
      '("~/Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org"
        "~/Downloads/GitRepositories/my-personal-things/birthdays/Birthdays.org")
      )
    )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("81c3de64d684e23455236abde277cda4b66509ef2c28f66e059aa925b8b12534" default))
;; '(org-agenda-files '("~/Downloads/GitRepositories/my-personal-things/birthdays"))
 '(package-selected-packages
   '(js-import flex-autopair tide rjsx-mode ag ripgrep org-make-toc toc-org dap-java lsp-mode helm-lsp lsp-java lsp-ui yasnippet-snippets yasnippet company evil treemacs-magit treemacs-icons-dired treemacs-projectile treemacs projectile auto-complete beacon emacs-color-themes emacs-color-theme which-key use-package try multiple-cursors magit helm haskell-mode dracula-theme avy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

