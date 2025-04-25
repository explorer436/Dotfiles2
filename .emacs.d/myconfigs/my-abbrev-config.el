;; turn on abbrev mode globally
(setq-default abbrev-mode t)
;; (setq abbrev-file-name "/home/explorer436/Downloads/GitRepositories/my-personal-things/.emacs.d/abbrev_defs")
;; (read-abbrev-file "/home/explorer436/Downloads/GitRepositories/my-personal-things/.emacs.d/abbrev_defs")
;; (setq save-abbrevs t)
(setq save-abbrevs 'silently)        ;; automatically saves abbrevs when files are saved

(when (eq system-type 'gnu/linux)
  (setq abbrev-file-name "~/.emacs.d/abbrev_defs")
  (read-abbrev-file "~/.emacs.d/abbrev_defs")
)
(when (eq system-type 'darwin)
  (setq abbrev-file-name "~/.emacs.d/abbrev_defs")
  (read-abbrev-file "~/.emacs.d/abbrev_defs")
)
(when (eq system-type 'windows-nt)
  (setq abbrev-file-name "C:/Users/vardh/Downloads/GitRepositories/my-personal-things/.emacs.d/abbrev_defs")
  (read-abbrev-file "C:/Users/vardh/Downloads/GitRepositories/my-personal-things/.emacs.d/abbrev_defs")
)

;; Ctrl-x a (and look at the list of functions available)
;;          add-global-abbrev
;;          list-abbrevs (to see the list but not edit it)
;;          edit-abbrevs (the best way to add or remove abbrevs)
;;                        When done with editing abbrevs, to load and or save, call any of:
;;                        edit-abbrevs-redefine (Redefine abbrevs according to current buffer contents.)
;;                        abbrev-edit-save-buffer (Redefine and save to abbrev file.)
;;                        abbrev-edit-save-to-file (Redefine and save to abbrev file, but ask for new location.)
;; Meta-x write-abbrev-file to save new abbreviations.


;; Resources
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Abbrevs.html
;; http://xahlee.info/emacs/emacs/emacs_abbrev_mode_tutorial.html
;; https://www.emacswiki.org/emacs/AbbrevMode
;; https://www.oreilly.com/library/view/learning-gnu-emacs/1565921526/ch04s04.html#:~:text=Enter%20word%20abbreviation%20mode%20by,add%2Dinverse%2Dlocal.)
;; https://en.wikipedia.org/wiki/Wikipedia:Lists_of_common_misspellings
;; https://en.wikipedia.org/wiki/Commonly_misspelled_English_words

;; Use case 1 - fixing incorrectly typed spellings for words
;; How to add an abbrev to the global file on the file?
;; Lets say, you wanted to type one word, but incorrectly typed some other spelling of that word.
;; What I shouldn't do is, remove the word and then type the spelling correctly again.
;; What I should do is, put the cursor after the incorrectly typed spelling, M-x inverse-add-global-abbrev and then type the correct spelling in the buffer.
;; This will save the incorrect spelling as an abbev in the global abbreviations file and emacs will fix the spelling for us everytime we type that spelling incorrectly.

;; Use case 2 - notice that is taking too much time to type and then add an abbrev for it.
;; Put your cursor after some text in a buffer and call the function "M-x add-global-abbrev". And type a shortcut for that difficult to type text.
;; This will be saved to the global abbrev file and you can just use the shortcut from now on instead of typing the whole text again.
