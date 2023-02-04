;; org-capture
(setq org-default-notes-file "~/Downloads/GitRepositories/my-personal-things/Things to do/tasks.org")

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
  (quote
    (
      ("t" "todo" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/01ToDoList.org")
         "\n* %^{Please write task heading here} \n\nCREATED ON:%U\n\n %?")
      ("q" "quote" entry (file "~/Downloads/GitRepositories/my-personal-things/Quotes/02Quotes.org")
         "\n* %? \n")
      ;;("r" "respond" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;;   "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
      ;;("n" "note" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;;   "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
      ;;("j" "Journal" entry (file+datetree "~/Downloads/GitRepositories/my-personal-things/Things to do/diary.org")
      ;;   "* %?\n%U\n" :clock-in t :clock-resume t)
      ;;("w" "org-protocol" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;;   "* TODO Review %c\n%U\n" :immediate-finish t)
      ;;("m" "Meeting" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;;   "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
      ;;("p" "Phone call" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;;   "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
      ;;("h" "Habit" entry (file "~/Downloads/GitRepositories/my-personal-things/Things to do/refile.org")
      ;; "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")
    )
  )
)

;; https://orgmode.org/manual/Template-expansion.html
;; https://orgmode.org/manual/Capture-templates.html
