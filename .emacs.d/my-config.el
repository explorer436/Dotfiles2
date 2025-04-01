(setq inhibit-startup-screen t)
(setq initial-buffer-choice
	(lambda ()
	 ;; (org-agenda-list)
	 ;; (get-buffer "*Org Agenda*")
))
(setq visible-bell 1)

(global-visual-line-mode t)

(global-display-line-numbers-mode 0) ;; disable line numbers
;; (global-display-line-numbers-mode 1) ;; enable line numbers
;; (setq display-line-numbers-type 'relative)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq-default word-wrap t)

(global-hl-line-mode t)

;; (dired-hide-details-mode 1)

(define-advice org-agenda-goto (:around (org-agenda-goto &rest args) "new-frame")
  (cl-letf (((symbol-function 'switch-to-buffer-other-window)
             (symbol-function 'switch-to-buffer-other-frame)))
    (apply org-agenda-goto args)))

(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

;; (use-package neotree
;;   :ensure t
;; )

(use-package rg
  :ensure t
  :config 
  (rg-enable-default-bindings)
)

(use-package fzf
;; :bind
;; Don't forget to set keybinds!
:config
(setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
      fzf/executable "fzf"
      fzf/git-grep-args "-i --line-number %s"
      ;; command used for `fzf-grep-*` functions
      ;; example usage for ripgrep:
      ;; fzf/grep-command "rg --no-heading -nH"
      fzf/grep-command "grep -nrH"
      ;; If nil, the fzf buffer will appear at the top of the window
      fzf/position-bottom t
      fzf/window-height 15))

(use-package avy
	:config 
	  (global-set-key (kbd "C-c jc1") 'avy-goto-char)
	  (global-set-key (kbd "C-c jc2") 'avy-goto-char-2)
	  (global-set-key (kbd "C-c jl") 'avy-goto-line)
	  ;; (global-set-key (kbd "C-c jl") 'avy-goto-line-above)
	  (global-set-key (kbd "C-c jw") 'avy-goto-word-1)
	  (global-set-key (kbd "C-c ja") 'avy-goto-word-0)
	  ;;(global-set-key (kbd "C-c at") 'avy-goto-char-timer)
	  :ensure t)

(use-package beacon 
   :ensure t
   :config
   (beacon-mode 1))

(use-package cl-lib
  :ensure t)

(use-package flex-autopair
  :ensure t
  :config
    (flex-autopair-mode 1)
)

(use-package git-gutter
  :ensure t
  :config
    (global-git-gutter-mode +1)
)

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  :ensure t)

(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :ensure t)

(use-package evil
  :config 
    (evil-mode 0)
  :ensure t)

(use-package which-key
  :config 
    (setq which-key-idle-delay 0.3)
    (setq which-key-popup-type 'frame)
    (which-key-mode)
    (which-key-setup-minibuffer)
    (set-face-attribute 'which-key-local-map-description-face nil 
       :weight 'bold)
    :ensure t)

(add-to-list 'load-path
	"/home/explorer436/.emacs.d/plugins/yasnippet")

(use-package yasnippet
	:ensure t
	:config
	  (use-package yasnippet-snippets
	    :ensure t)

	(yas-reload-all)
	(yas-global-mode 1)
)

(use-package whitespace-cleanup-mode
	:ensure t
)

(global-whitespace-cleanup-mode t)

(use-package string-inflection
    :ensure t
)

(use-package smartscan
	  :ensure t
	  :config
	 (global-smartscan-mode 1)
)
