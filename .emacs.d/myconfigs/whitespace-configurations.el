; global-whitespace-mode

; Many tools choke when there are excess whitespace characters, or when they are in the wrong place. It is also common for coding styles to encourage a line width limit.

; http://xahlee.info/emacs/emacs/whitespace-mode.html

    (global-whitespace-mode 1)
    ;; see the apropos entry for whitespace-style

;; Define the whitespace style.
;; (setq-default whitespace-style
;; 	      '(face spaces empty tabs newline trailing space-mark tab-mark newline-mark))

; How do I stop Emacs from coloring text beyond 80 columns differently?
; You can leave whitespace-mode on and remove lines-tail from whitespace-style.
; To see all options: C-h v whitespace-style RET

(setq
   whitespace-style
   '(face ; viz via faces
	 trailing ; trailing blanks visualized
;	 lines-tail ; lines beyond
		    ; whitespace-line-column
	 space-before-tab
	 space-after-tab
	 newline ; lines with only blanks
	 indentation ; spaces used for indent
		     ; when config wants tabs
	 empty
	    ; empty lines at beginning or end
	 )
   whitespace-line-column 100
	    ; column at which
	    ; whitespace-mode says the line is too long
)


; whitespace-clean-up

; https://github.com/purcell/whitespace-cleanup-mode/tree/master

      (use-package whitespace-cleanup-mode
	:ensure t
      )

      (global-whitespace-cleanup-mode t)

;; To manually clean-up whitespaces in a file, do ~M-x whitespace-cleanup~
