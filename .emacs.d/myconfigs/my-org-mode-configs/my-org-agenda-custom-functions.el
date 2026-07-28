(defun my-agenda-view ()
  "Launch org-timeblock and org-timeblock-toggle-timeblock-list simulataneously"
  (interactive)
  (org-agenda-list)
  ;; (org-agenda-day-view)
  (org-agenda-day-view)
)

;; How to mark org agenda item as completed on particular day?

;; https://emacs.stackexchange.com/questions/28892/how-to-mark-org-agenda-item-as-completed-on-particular-day

;; Sometimes I fall behind in my org-agenda maintenance and have to go back a few days to mark completed tasks. In 90% of cases, I want to mark the task as completed on the day it was due, but org-agenda-todo always uses the current day and time.

;; What is the easiest way to mark agenda items as completed on the day currently being viewed in the agenda window?

;; This is similar to another question (https://emacs.stackexchange.com/questions/9433/how-to-make-org-prompt-for-a-timestamp-when-changing-state-of-a-todo) where the goal was to prompt for the date. Here you just want to use the date under the cursor. We can basically use the same answer, but we get the date in a different way. Instead of prompting with org-read-date, we use org-get-cursor-date. With this the CLOSED property and any logbook entries will be made on whatever date in the agenda you happen to be on when you call org-agenda-todo-view-date.

;; Note:
;; The function responsible for updating schedules, org-auto-repeat-maybe, uses org-today to get the date instead of org-current-effective-time (which org-today apparently does not call) so we modify it as well to match.
;; The scheduling function seems to get the date from org-today instead of org-current-effective-time.
;; We'll have to modify that function as well.

(require 'cl-lib)

(defun org-agenda-todo-view-date (&optional arg)
  (interactive "P")
  (let ((my-current-time (org-get-cursor-date)))
    (cl-letf* (((symbol-function #'org-current-effective-time)
		(lambda () my-current-time))
	       ((symbol-function #'org-today)
		(lambda () (time-to-days (org-current-effective-time)))))
      (let ((current-prefix-arg arg))
	(call-interactively 'org-agenda-todo)))))

;; Remember:
;; When you want to use this function:
;; In agenda view, jump to the date that you want to use for marking the task as complete. Do not use today's agenda view.

(defun my-check-agenda-broken-links ()
  "Scan all `org-agenda-files` for broken file and ID links."
  (interactive)
  (let ((report-buf (get-buffer-create "*Broken Agenda Links*"))
	(count 0))
    (with-current-buffer report-buf
      (read-only-mode -1)
      (erase-buffer)
      (insert "=== Broken Org Links Report ===\n\n"))

    (dolist (file (org-agenda-files))
      (when (and (stringp file) (file-exists-p file))
	(with-current-buffer (find-file-noselect file)
	  (save-excursion
	    (goto-char (point-min))
	    (let ((ast (org-element-parse-buffer)))
	      (org-element-map ast 'link
		(lambda (link)
		  (let ((type (org-element-property :type link))
			(path (org-element-property :path link))
			(line (line-number-at-pos (org-element-property :begin link))))
		    (cond
		     ;; Check file links
		     ((string= type "file")
		      (let ((resolved-path (expand-file-name path (file-name-directory file))))
			(unless (file-exists-p resolved-path)
			  (setq count (1+ count))
			  (with-current-buffer report-buf
			    (insert (format "%s:%d: Broken file link -> %s\n" file line path))))))
		     ;; Check Org ID links
		     ((string= type "id")
		      (unless (and (fboundp 'org-id-find) (org-id-find path))
			(setq count (1+ count))
			(with-current-buffer report-buf
			  (insert (format "%s:%d: Broken ID link -> %s\n" file line path)))))))))))))))

    (with-current-buffer report-buf
      (if (= count 0)
	  (insert "No broken links found across your agenda files!\n")
	(insert (format "\nTotal broken links found: %d\n" count)))
      (compilation-mode))
    (pop-to-buffer report-buf))
