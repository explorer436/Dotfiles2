;; Table of contents in org mode
(use-package toc-org
  :ensure t
)

(if (require 'toc-org nil t)
(progn
  (add-hook 'org-mode-hook 'toc-org-mode)

  ;; enable in markdown, too
  ;;(add-hook 'markdown-mode-hook 'toc-org-mode)
  ;;(define-key markdown-mode-map (kbd "\C-c\C-o") 'toc-org-markdown-follow-thing-at-point)
)
(warn "toc-org not found"))

;; 1. How to insert table of contents in an org file?
;; 1. Put a heading in the document. After the line with the heading, add a ~TOC_5~ tag. Change 5 to something else based on the depth that you need for the table of contents.
;; 1. To add a TOC tag, you can use the command ~org-set-tags-command~ (C-c C-q)
;; 1. Enter TOC

;; Advantages of using toc-org
;; 1. Nice table of contents view in Github

;; Disadvantages
;; 1. Issues while exporting org documents as html or markdown format.
;;    Emacs shows this error:
;;    Unable to resolve link: (item from table of contents)

;; If we are exporting org documents to html using emacs built-in export option, toc is not necessary. Because, we can auto-generate it using org-publish-project-alist's ":with-toc" setting.
