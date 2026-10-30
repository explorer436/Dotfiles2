;; org-mode
;; https://orgmode.org/
(use-package org
:config
  (setq org-log-done 'time) ;;keep track of when a certain TODO item was marked as done.
)


;; Note: Do not use ":ensure t". emacs comes with org-mode by default. When :ensure t is present, use-package tries to install the org package from ELPA. Sometimes, having an external package version installed alongside Emacs's internal libraries can lead to mixed-version conflicts, stale byte-compiled files, or weird parameter-parsing bugs. Using the built-in version directly avoids these conflicts entirely!
