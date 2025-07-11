;; Read:
;; https://orgmode.org/manual/Agenda-Commands.html
;; https://karl-voit.at/2017/01/15/org-clone-subtree-with-time-shift/

;; How to
;; Mark task status right from the agenda view without having to go into the file: Just use the letter "t"

;; C-' to cycle through the agenda files (org-cycle-agenda-files)

;; How can I show the Org-mode agenda on Emacs start-up?
(add-hook 'after-init-hook 'my-agenda-view)

;; Location of the combined exported agenda file that will be exported by org-mode
(setq org-icalendar-combined-agenda-file "~/Downloads/GitRepositories/my-personal-things/Things to do/CalendarEvents/fromEmacs.ics")
;; Alt-x org-icalendar-combine-agenda-files

;; Set a UUID on each entry in the org files.
;; Essentially, this will help with
;; not creating duplicates in Google calendar when importing calendar from Org Agenda
(setq org-icalendar-store-UID 'non-nil)

;; Each state with ! is recorded as state change. In this case, we are logging TODO, DONE, NOT DONE and CANC states
(setq org-todo-keywords
;;      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(d)" "NEXT(n)" "CANCELED(c)")))
      '((sequence "TODO(t!)" "NEXT(n)" "STARTED(s)" "SOMEDAY(l)" "WAITING(w)" "|" "DONE(d!)" "NOT DONE(N!)" "CANCELLED(c!)")))
;; How do we refresh the list of todo-keywords in a file after making changes in that specific file?
;; M-x org-mode-restart

;; Log TODO creation also
(setq org-treat-insert-todo-heading-as-state-change t)

;; Log into LOGBOOK drawer
(setq org-log-into-drawer t)

(setq org-agenda-files
      (if (eq system-type 'windows-nt)
	  '("~/../../Downloads/GitRepositories/my-personal-things/Things to do/Bad habits that I need to quit.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Birthdays and Important events.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Field manual for the day.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Every Saturday.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Finance tasks.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Fixed volume tasks.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Health.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Inbox.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Near future tasks.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Programming tasks.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Recurring personal tasks.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Well being.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/Work.org")
      '("~/Downloads/GitRepositories/my-personal-things/Things to do/Bad habits that I need to quit.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Birthdays and Important events.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Field manual for the day.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Every Saturday.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Finance tasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Fixed volume tasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Health.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Inbox.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Moving the needle.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Notes from Youtube.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Near future tasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Programming tasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Recurring personal tasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Well being.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/Work.org")
      )
)
(setq my-org-refile-targets
      (if (eq system-type 'windows-nt)
	  '("~/../../Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedPersonalTasks.org"
		  "~/../../Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedProgrammingTasks.org")
      '("~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedPersonalTasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedFinanceTasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedProgrammingTasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CancelledItems.org")
      )
)
;; Why is refiling to specific files (e.g. one for programming) important?
;; Because, if we refile everything to one file,
;; it could be difficult to look at the tasks that are completed for one topic (like programming)
;; and get an understanding of the progress made in that area.


; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
				 (my-org-refile-targets :maxlevel . 9))))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling


;; A week starts on Sunday as opposed to Monday:
(setq org-agenda-start-on-weekday 0)

(setq org-agenda-timegrid-use-ampm t)
;; Reference:
;; (defcustom org-agenda-timegrid-use-ampm nil
;;   "When set, show AM/PM style timestamps on the timegrid."
;;   :group 'org-agenda
;;   :version "24.1"
;;   :type 'boolean)



;; Customizations
;; If you don't want to see the filename in org-agenda-list,
;; and want to see something else,
;; you can change that behavior by adding a CATEGORY property for the headings in question.

;; How to do?
;; Color coding for agenda list
