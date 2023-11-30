;; https://karl-voit.at/2017/01/15/org-clone-subtree-with-time-shift/

;; C-' to cycle through the agenda files (org-cycle-agenda-files)

;; Location of the combined exported agenda file that will be exported by org-mode
(setq org-icalendar-combined-agenda-file "~/Downloads/GitRepositories/my-personal-things/Things to do/CalendarEvents/fromEmacs.ics")

;; Set a UUID on each entry in the org files.
;; Essentially, this will help with
;; not creating duplicates in Google calendar when importing calendar from Org Agenda
(setq org-icalendar-store-UID 'non-nil)

(setq org-agenda-files
      (if (eq system-type 'windows-nt)
	  '("~/../../Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/BookNotes.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/birthdays/Birthdays.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/CompletedMiscellaneousTasks.org")
      '("~/Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Personal Tasks.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Reading Material.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Daily article for today.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/ProgrammingTasks.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Finance Tasks.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Health and well being.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/BirthdaysAndImportantEvents.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Work.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedPersonalTasks.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/refile-targets/CompletedProgrammingTasks.org")
      )
)
;; Why is refiling to specific files (e.g. one for programming) important?
;; Because, if we refile everything to one file,
;; it could be difficult to look at the tasks that are completed for one topic (like programming)
;; and get an understanding of the progress made in that area.


; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
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
