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

(use-package magit
	  :ensure t
	  :config
		  (defadvice magit-status (around magit-fullscreen activate)
	    (window-configuration-to-register :magit-fullscreen)
	    ad-do-it
	    (delete-other-windows))

	  (defadvice magit-mode-quit-window (after magit-restore-screen activate)
	    "Restores the previous window configuration and kills the magit buffer"
	    (jump-to-register :magit-fullscreen))

	  (define-key magit-status-mode-map (kbd "q") 'magit-mode-quit-window)	
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

;; (require 'calfw) 
;; (require 'calfw-org) 
(use-package calfw
    :ensure t
)
(use-package calfw-org
    :ensure t
)

(defun my-calfw-view ()
  "Launch org-timeblock and org-timeblock-toggle-timeblock-list simulataneously"
  (interactive)
  (cfw:open-org-calendar)
)

(use-package smartscan
    :ensure t
    :config
   (global-smartscan-mode 1)
)

(global-auto-revert-mode t)

(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))
(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)
(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))
(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

(global-set-key (kbd "M-j")
     (lambda ()
           (interactive)
           (join-line -1)))

(defun delete-current-buffer-file ()
"Removes file connected to current buffer and kills buffer."
(interactive)
(let ((filename (buffer-file-name))
      (buffer (current-buffer))
      (name (buffer-name)))
  (if (not (and filename (file-exists-p filename)))
      (ido-kill-buffer)
    (when (yes-or-no-p "Are you sure you want to remove this file? ")
      (delete-file filename)
      (kill-buffer buffer)
      (message "File '%s' successfully removed" filename)))))

(global-set-key (kbd "C-x C-k") 'delete-current-buffer-file)

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)

(defun my-put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

(global-set-key (kbd "C-S-n")
         (lambda ()
           (interactive)
           (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

(setq isearch-lazy-count t)
(setq lazy-count-prefix-format "(%s/%s) ")
(setq lazy-count-suffix-format nil)

(setq search-whitespace-regexp ".*?")

(define-minor-mode my-override-mode
  "Overrides all major and minor mode keys" t)

(defvar my-override-map (make-sparse-keymap "my-override-map")
  "Override all major and minor mode keys")

(add-to-list 'emulation-mode-map-alists
  `((my-override-mode . ,my-override-map)))

(define-key my-override-map (kbd "<left>")
  (lambda ()
    (interactive)
    (message "Use Vim keys: h for Left")))

(define-key my-override-map (kbd "<right>")
  (lambda ()
    (interactive)
    (message "Use Vim keys: l for Right")))

(define-key my-override-map (kbd "<up>")
  (lambda ()
    (interactive)
    (message "Use Vim keys: k for Up")))

(define-key my-override-map (kbd "<down>")
  (lambda ()
    (interactive)
    (message "Use Vim keys: j for Down")))

(evil-make-intercept-map my-override-map)
