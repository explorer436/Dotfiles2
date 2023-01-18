;; javascript packages

;; js-import

;; (use-package js-import
;;   :ensure t
;; )

;; rjsx-mode
;; https://github.com/felipeochoa/rjsx-mode
    
;; (use-package rjsx-mode
;;   :ensure t
;;   :mode "\\.js\\'"
;; )

;; tide    

;; prerequisite for tide: npm install -g typescript

;; (defun setup-tide-mode()
;;   "Setup function for tide."
;;   (interactive)
;;   (tide-setup)
;;   (flycheck-mode +1)
;;   (setq flycheck-check-syntax-automaticaly '(save mode-enabled))
;;   (tide-ho-identifier-mode +1)
;;   (company-mode +1)
;; )
    
;; https://github.com/ananthakumaran/tide
;; (use-package tide
;;   :ensure t
;;   ;; :after (rjsx-mode company flycheck)
;;   :after (rjsx-mode company)
;;   :hook (rjsx-mode . setup-tide-mode)
;;   :config 
;;   (global-set-key (kbd "C-c jd") 'tide-jump-to-definition)
;;   (global-set-key (kbd "C-c jb") 'tide-jump-back)
;; )
