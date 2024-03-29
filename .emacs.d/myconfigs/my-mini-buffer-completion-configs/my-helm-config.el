;; (use-package helm
;;   :ensure t
;;   :init
;;     (setq helm-split-window-in-side-p t
;;           helm-move-to-line-cycle-in-source t)
;;   :config 
;;     (helm-mode 1)
;;     (helm-autoresize-mode 1)
;;     (global-set-key (kbd "C-x b") 'helm-buffers-list)
;;     (global-set-key (kbd "C-x C-f") 'helm-find-files)
;;     (global-set-key (kbd "C-s") 'helm-occur)
;;     (global-set-key (kbd "C-h a") 'helm-apropos)
;;     (global-set-key (kbd "M-x") 'helm-M-x)
;;     (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; )



;; (helm-mode 0) ;; Most of Emacs prompts become helm-enabled
;; (helm-autoresize-mode 1) ;; Helm resizes according to the number of candidates
;; (global-set-key (kbd "C-x b") 'helm-buffers-list) ;; List buffers ( Emacs way )
;; (global-set-key (kbd "C-x C-f") 'helm-find-files) ;; Finding files with Helm
;; (global-set-key (kbd "C-s") 'helm-occur)  ;; Replaces the default isearch keybinding
;; (global-set-key (kbd "C-h a") 'helm-apropos)  ;; Helmized apropos interface
;; (global-set-key) (kbd "M-x") 'helm-M-x)  ;; Improved M-x menu
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)  ;; Show kill ring, pick something to paste
