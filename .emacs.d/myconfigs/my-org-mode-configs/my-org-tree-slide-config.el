;; Turn any org document into a presentation by doing: ~M-x org-tree-slide-mode~
;; https://github.com/takaxp/org-tree-slide

(use-package org-tree-slide
  :ensure t
  :custom
  (org-image-actual-width nil))
;; do not let large images take up the entire screen or more size than the screen.

;; How to move forward and backward in the presentation?
;; https://github.com/takaxp/org-tree-slide?tab=readme-ov-file#control-functions
;; Control functions
;; 1. org-tree-slide-move-next-tree (C->)
;; 1. org-tree-slide-move-previous-tree (C-<)
;; 1. org-tree-slide-content (C-x s c)
