;; Spell check - install "aspell" and aspell dictionaries.
;; The required dictionaries need to be installed in the computer.
;; sudo pacman -S aspell
;; sudo pacman -S aspell-en

(setq
  ispell-program-name "aspell"
  ispell-extra-args '("--sug-mode=ultra"))

;; M-x flyspell-mode
;; Enable Flyspell mode, which highlights all misspelled words.

;; M-x flyspell-prog-mode
;; Enable Flyspell mode for comments and strings only.
