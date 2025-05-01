;; https://github.com/oantolin/orderless

;; When you type a few characters in the mini buffer, it shows all the possible function names.
;; Very useful to recall any of the available functions from the mini buffer.

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))
