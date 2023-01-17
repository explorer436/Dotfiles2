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

;; org-capture
(setq org-default-notes-file "~/Downloads/GitRepositories/my-personal-things/Things to do/tasks.org")

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
  (quote
    (
      ("t" "todo" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org")
         "\n* %^{Please write task heading here} \n\nCREATED ON:%t\n\n %?")
      ;;("r" "respond" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;;   "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
      ;;("n" "note" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;;   "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
      ;;("j" "Journal" entry (file+datetree "~/Downloads/GitRepositories/my-personal-things/Things to do/diary.org")
      ;;   "* %?\n%U\n" :clock-in t :clock-resume t)
      ;;("w" "org-protocol" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;;   "* TODO Review %c\n%U\n" :immediate-finish t)
      ;;("m" "Meeting" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;;   "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
      ;;("p" "Phone call" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;;   "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
      ;;("h" "Habit" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;; "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
    )
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
   '(rg js-import flex-autopair tide rjsx-mode ag ripgrep org-make-toc toc-org dap-java lsp-mode helm-lsp lsp-java lsp-ui yasnippet-snippets yasnippet company evil treemacs-magit treemacs-icons-dired treemacs-projectile treemacs projectile auto-complete beacon emacs-color-themes emacs-color-theme which-key use-package try multiple-cursors magit helm haskell-mode dracula-theme avy)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

