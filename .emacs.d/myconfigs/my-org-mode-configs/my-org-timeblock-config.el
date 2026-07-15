;; https://github.com/ichernyshovvv/org-timeblock

;; Commands
;; Run M-x org-timeblock to open 3-day view that starts from today’s date.

;; org-timeblock-mode. Displays timeblock view of SCHEDULED/DEADLINE org tasks or events (entries that have active timestamps in the body or heading) for specific days.
;; org-timeblock-list-mode. Displays a list of tasks (including those that are not time-specific).

;; How can I show the Org-mode agenda on Emacs start-up? (add-hook 'after-init-hook 'my-timeblock-views)

;; Errors with this package
;; I am seeing this error
;; load-with-code-conversion: Cannot open load file: No such file or directory, compat-macs
;; Not sure how to fix it. So, I am disabling this package.

(use-package org-timeblock
  :quelpa (org-timeblock :fetcher github :repo "ichernyshovvv/org-timeblock"))

;; The org-timeblock-todo-keywords Filter
;; The package has a variable called org-timeblock-todo-keywords.
;; If this is set, it will only show tasks matching those specific keywords.
;; We can reset it to show everything by evaluating:
(setq org-timeblock-todo-keywords nil)

;; We can use a built-in Emacs function, expand-file-name, to dynamically sanitize and expand your agenda files specifically for org-timeblock so it doesn't get tripped up by the spaces or the tilde.
(setq org-timeblock-files
      (mapcar #'expand-file-name org-agenda-files))

;; (use-package org-timeblock
;;   :ensure t
;;   :quelpa (org-timeblock :fetcher github :repo "ichernyshovvv/org-timeblock")
;; )

;; (defun my-timeblock-views ()
;;   "Launch org-timeblock and org-timeblock-toggle-timeblock-list simulataneously"
;;   (interactive)
;;   (org-timeblock)
;;   (org-timeblock-toggle-timeblock-list)
;;   (kill-buffer "*org-timeblock*")
;; )

;; If org-timeblock is not working, use this function to determine if any of the entries in any of the org-agenda files have a timestamp that is causing the issue
(dolist (file org-agenda-files)
  (with-current-buffer (find-file-noselect file)
    (message "Checking file: %s" file)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward org-element-headline-re nil t)
	(let ((hl (org-element-at-point)))
	  (when (org-element-property :todo-keyword hl)
	    ;; Check for time-block patterns
	    (let ((scheduled (org-element-property :scheduled hl))
		  (deadline (org-element-property :deadline hl)))
	      (dolist (ts (list scheduled deadline))
		(when (and ts (eq (org-element-property :type ts) 'active))
		  ;; If it has a time but no explicit range, log it
		  (let ((raw-ts (org-element-property :raw-value ts)))
		    (when (and (string-match-p "[0-9]\\{2\\}:[0-9]\\{2\\}" raw-ts)
			       (not (string-match-p "-" (match-string 0 raw-ts))))
		      (message " Found Single-Time Trap in %s at line %d: %s"
			       (file-name-nondirectory file)
			       (line-number-at-pos)
			       raw-ts))))))))))))


;; If you do everything and org-timeblock still says "No Data",
;; put a TODO keyword on one of the agenda items like this.
;; This seems to be triggering org-timeblock and it seems to be pulling data from the agenda files after this change
;; * TODO Send message to seller about books
;; SCHEDULED: <2026-07-17 Fri 10:00-10:30>
