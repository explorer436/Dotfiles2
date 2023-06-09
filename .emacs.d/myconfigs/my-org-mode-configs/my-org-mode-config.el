;; org-mode
;; https://orgmode.org/
(use-package org
:ensure t
:config
  (setq org-log-done 'time) ;;keep track of when a certain TODO item was marked as done.
)

;; How can I show the Org-mode agenda on Emacs start-up?
(add-hook 'after-init-hook 'org-agenda-list)
