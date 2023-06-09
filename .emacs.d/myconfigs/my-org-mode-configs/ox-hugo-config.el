(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  :pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)


;; https://ox-hugo.scripter.co/doc/org-toc/
(setq org-hugo-export-with-toc t)

(setq org-hugo-base-dir "..")
