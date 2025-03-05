(use-package org-caldav
  :ensure t
  :init
  ;; This is the sync on close function; it also prompts for save after syncing so
  ;; no late changes get lost
  (defun org-caldav-sync-at-close ()
    (org-caldav-sync)
    (save-some-buffers))

  ;; This is the delayed sync function; it waits until emacs has been idle for
  ;; "secs" seconds before syncing.  The delay is important because the caldav-sync
  ;; can take five or ten seconds, which would be painful if it did that right at save.
  ;; This way it just waits until you've been idle for a while to avoid disturbing
  ;; the user.
  (defvar org-caldav-sync-timer nil
     "Timer that `org-caldav-push-timer' used to reschedule itself, or nil.")

  (defun org-caldav-sync-with-delay (secs)
    (when org-caldav-sync-timer
      (cancel-timer org-caldav-sync-timer))
    (setq org-caldav-sync-timer
      (run-with-idle-timer
       (* 1 secs) nil 'org-caldav-sync)))

  ;; https://github.com/dengste/org-caldav/blob/master/doc/org-caldav.org
  (setq 
      org-caldav-calendar-id "personal"
      org-caldav-url "https://use10.thegood.cloud/remote.php/dav/calendars/explorer436@tutanota.com"
      org-caldav-files org-agenda-files
      org-caldav-inbox "~/Downloads/GitRepositories/my-personal-things/Things to do/nextcloud-inbox.org")

  (setq org-caldav-backup-file "/home/explorer436/Downloads/GitRepositories/my-personal-things/.emacs.d/org-caldav/org-caldav-backup.org")
  (setq org-caldav-save-directory "/home/explorer436/Downloads/GitRepositories/my-personal-things/.emacs.d/org-caldav/")

  :config
  
  (setq org-icalendar-alarm-time 1)

  ;; This makes sure to-do items as a category can show up on the calendar
  (setq org-icalendar-include-todo t)

  ;; This ensures all org "deadlines" show up, and show up as due dates
  (setq org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due))

  ;; This ensures "scheduled" org items show up, and show up as start times
  (setq org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo))

  ;; Add the delayed save hook with a five minute idle timer
  ;; (add-hook 'after-save-hook
  ;;     (lambda ()
  ;;       (when (eq major-mode 'org-mode)
  ;;	(org-caldav-sync-with-delay 300))))
  ;;
  ;; Add the close emacs hook
  ;; (add-hook 'kill-emacs-hook 'org-caldav-sync-at-close)
)

;; My custom function to call org-caldav-sync-everything first and then call org-caldav-sync
(setq org-caldav-delete-calendar-entries '(always))
(defun my-caldav-sync (pref)
  (interactive "spref")
  (org-caldav-delete-everything pref)
  (org-caldav-sync)
)

;; (defun sort-and-dedup (beg end)
;;    (interactive <mumble>)
;;    (sort-lines nil beg end)
;;    (delete-duplicate-lines beg end))

;; (defun doodlebug (a b c)
;;   "Nonce function"
;;   (interactive "sAdjective: \nsNoun: \nsExclamation: \n")
;;   (message "Its a %s thing, this %s, so it is, %s" a b c))
