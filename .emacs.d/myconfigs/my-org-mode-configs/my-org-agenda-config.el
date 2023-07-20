(setq org-icalendar-combined-agenda-file "~/Downloads/GitRepositories/my-personal-things/Things to do/CalendarEvents/fromEmacs.ics")

;; Do not create duplicates in Google calendar when importing calendar from Org Agenda
(setq org-icalendar-store-UID 'non-nil)

(setq org-agenda-files
      (if (eq system-type 'windows-nt)
	  '("~/../../Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/CompletedMiscellaneousTasks.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/BookNotes.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/birthdays/Birthdays.org")
      '("~/Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Personal Tasks.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Reading Material.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Daily article for today.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/ProgrammingTasks.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Finance Tasks.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Health and well being.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/BirthdaysAndImportantEvents.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/CompletedMiscellaneousTasks.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/RecurringEvents.org")
      )
)
;; C-' to cycle through the agenda files (org-cycle-agenda-files)


(setq org-agenda-timegrid-use-ampm t)
;; Reference:
;; (defcustom org-agenda-timegrid-use-ampm nil
;;   "When set, show AM/PM style timestamps on the timegrid."
;;   :group 'org-agenda
;;   :version "24.1"
;;   :type 'boolean)



; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
