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

;; Commenting out the Windows configuration
;; (setq org-agenda-files
;;       (if (eq system-type 'windows-nt)
;;	  '("~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/BadHabitsThatINeedToQuit.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/BirthdaysAndImportantEvents.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/FieldManualForTheDay.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/EverySaturday.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/FinanceTasks.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/FixedVolumeTasksToMoveTheNeedleOnLongTermGoals.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/UrgentAndImportant.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/UrgentButNotImportant.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/Health.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/Inbox.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/NotesInMindmap.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/NotesFromYoutube.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/Books.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/ProgrammingTasks.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/RecurringPersonalTasks.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/WellBeing.org"
;;	    "~/../../Downloads/GitRepositories/my-personal-things/ThingsToDo/Work.org")
;;       '("~/Downloads/GitRepositories/my-personal-things/ThingsToDo/BadHabitsThatINeedToQuit.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/BirthdaysAndImportantEvents.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/FieldManualForTheDay.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/EverySaturday.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/FinanceTasks.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/FixedVolumeTasksToMoveTheNeedleOnLongTermGoals.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/UrgentAndImportant.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/UrgentButNotImportant.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/Health.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/Inbox.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/NotesInMindmap.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/NotesFromYoutube.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/Books.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/ProgrammingTasks.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/RecurringPersonalTasks.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/WellBeing.org"
;;	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/Work.org")
;;       )
;; )

;; There should not be spaces in the paths for agenda files
;; e.g. It is not a good naming convention - if there are spaces in your directory path: .../Things to do/....
;; While standard org-agenda handles spaces in file paths perfectly fine, org-timeblock relies heavily on internal Emacs commands and regex parsing to scrub file names.
;; Spaces in paths frequently break its ability to locate or read the files, causing it to return a silent nil (No Data) when scanning them.
;; On top of the spaces, org-timeblock requires absolute, fully expanded paths. The tilde (~) can sometimes fail to expand inside its custom search loops.
(setq org-agenda-files
      '("~/Downloads/GitRepositories/my-personal-things/ThingsToDo/BadHabitsThatINeedToQuit.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/BirthdaysAndImportantEvents.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/FieldManualForTheDay.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/EverySaturday.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/FinanceTasks.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/FixedVolumeTasksToMoveTheNeedleOnLongTermGoals.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/UrgentAndImportant.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/UrgentButNotImportant.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/Health.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/Inbox.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/NotesInMindmap.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/NotesFromYoutube.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/Books.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/ProgrammingTasks.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/RecurringPersonalTasks.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/WellBeing.org"
	"~/Downloads/GitRepositories/my-personal-things/ThingsToDo/Work.org")
)

;; Commenting out the Windows configuration
;; (setq my-org-refile-targets
;;       (if (eq system-type 'windows-nt)
;;	  '("~/../../Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedPersonalTasks.org"
;;		  "~/../../Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedProgrammingTasks.org")
;;       '("~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedPersonalTasks.org"
;;	"~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedFinanceTasks.org"
;;	"~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedProgrammingTasks.org"
;;	"~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CancelledItems.org")
;;       )
;; )
(setq my-org-refile-targets
      '("~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedPersonalTasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedFinanceTasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedProgrammingTasks.org"
	"~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CancelledItems.org")
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
