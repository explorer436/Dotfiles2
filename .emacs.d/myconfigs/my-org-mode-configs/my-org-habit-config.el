;; In the graph, "Today" is represented by !

(use-package org-habit
  :ensure nil
  :after org
  :commands (org-habit-toggle-habits org-habit-toggle-display-in-agenda)
  :config (progn
      (add-to-list 'org-modules 'org-habit)
      (setq org-habit-graph-column 80)
    )
  (message "org-habit ready ✔"))
