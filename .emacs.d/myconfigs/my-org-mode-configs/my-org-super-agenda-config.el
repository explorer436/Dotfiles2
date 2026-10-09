(use-package org-super-agenda
  :ensure t
  :config
  (org-super-agenda-mode 1)
  (setq org-super-agenda-groups
	'(
	  (:name "Today's Schedule"
		 :time-grid t
		 :scheduled today)
	  (:name "High Priority / Blocker"
		 :priority "A")
	  (:name "In Progress"
		 :todo "NEXT")
	  (:name "Backlog (Refine Me)"
		 :todo "BACKLOG"
		 :order 9)
	  (:name "Programming"
		 :tag ("food" "dinner" "programming")
	  )
	  (:name "Important Money related"
		 :tag ("finance" "money" "bills")
	  )
	  (:name "Money related but not important"
		 :tag ("ledgers")
	  )
  )
))
;; Hides unscheduled, low-priority noise
