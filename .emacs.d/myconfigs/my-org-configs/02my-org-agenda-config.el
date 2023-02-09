;; https://orgmode.org/manual/Agenda-Commands.html

(setq org-agenda-files
      (if (eq system-type 'windows-nt)
	  '("~/../../Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/CompletedMiscellaneousTasks.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/Things to do/BookNotes.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/birthdays/Birthdays.org")
      '("~/Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Scheduled.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/Take notes from books.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/BirthdaysAndImportantEvents.org"
        "~/Downloads/GitRepositories/my-personal-things/Things to do/CompletedMiscellaneousTasks.org")
      )
)

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;; Refile Targets

;; https://orgmode.org/manual/Refile-and-Copy.html
;; https://blog.aaronbieber.com/2017/03/19/organizing-notes-with-refile.html

;; First, we must set the value of org-refile-targets, which tells Org how to find the possible targets. Be sure to read the documentation for this variable, because there are a few ways to define targets, but for this scenario, I want to be able to move a node to any of my agenda files, and I also want to consider nodes up to three levels deep.

;; That’s exactly what this setting will do.

;; (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

;; With this set, you can trigger Refile with C-c C-w in any Org file and get a completing read of all headings up to three levels deep in all files in org-agenda-files.

;; If you use Helm, which you really should, you will see a very pretty hierarchical display of possible targets. You can type a filename to narrow down to headings within that file, and so on.

