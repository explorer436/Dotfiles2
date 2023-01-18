(setq org-agenda-files
      (if (eq system-type 'windows-nt)
	  '("~/../../Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org"
	    "~/../../Downloads/GitRepositories/my-personal-things/birthdays/Birthdays.org")
      '("~/Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org"
        "~/Downloads/GitRepositories/my-personal-things/birthdays/Birthdays.org")
      )
    )
