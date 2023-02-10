;; turn on abbrev mode globally
(setq-default abbrev-mode t)
(read-abbrev-file "~/.emacs.d/abbrev_defs")
;; (setq save-abbrevs t)
(setq save-abbrevs 'silently)        ;; automatically saves abbrevs when files are saved

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

