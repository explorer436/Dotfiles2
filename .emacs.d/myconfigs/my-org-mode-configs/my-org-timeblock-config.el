;; https://github.com/ichernyshovvv/org-timeblock

;; Commands
;; Run M-x org-timeblock to open 3-day view that starts from today’s date.

;; org-timeblock-mode. Displays timeblock view of SCHEDULED/DEADLINE org tasks or events (entries that have active timestamps in the body or heading) for specific days.
;; org-timeblock-list-mode. Displays a list of tasks (including those that are not time-specific).

(use-package org-timeblock
  :ensure t
  :quelpa (org-timeblock :fetcher github :repo "ichernyshovvv/org-timeblock")
)

(defun my-timeblock-views ()
  "Launch org-timeblock and org-timeblock-toggle-timeblock-list simulataneously"
  (interactive)
  (org-timeblock)
  (org-timeblock-toggle-timeblock-list)
  (kill-buffer "*org-timeblock*")
)

;; How can I show the Org-mode agenda on Emacs start-up?
;; (add-hook 'after-init-hook 'my-timeblock-views)
