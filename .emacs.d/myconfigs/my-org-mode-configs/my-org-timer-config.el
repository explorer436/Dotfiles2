;; (setq org-clock-sound "./ding_ding.mp3")

;; However, whenever I run org-timer-set-timer, it plays some weird white noise, instead of the file placed in the Downloads folder above.
;; How can I go about fixing this?

;; The Org clock timer uses "aplay" to play the sound and that can only play WAV files - nothing else.
;; If you download an mp3 file, don't expect that to work with org-timer

(setq org-clock-sound "./ding_ding.wav")
