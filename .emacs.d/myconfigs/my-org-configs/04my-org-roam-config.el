;; org-roam
;; https://github.com/org-roam/org-roam
;; https://www.orgroam.com/manual.html#Keystroke-Index

;; Prerequisites:
;; 1. Before you can use org-roam in a Linux distribution, you need to have a C compiler installed in it. If not, you will see errors that say "No EmacSQL SQLite binary available". Install a C compiler for your distribution using the appropriate command. e.g. "sudo apt install clang" for Ubuntu.
;; 2. Install Graphviz for the Linux distribution. e.g. "sudo apt install graphviz" for Ubuntu.
;; 3. If you are using terminal only version of Linux (WSL), and if you don't have a browser installed in Linux, you need to install a browser as well.

;; Troubleshooting for the error "Symbol’s function definition is void"
;; Install org-roam using this first.
;; And then, use the next script for customizing it.
;; It seems to be having trouble if we try to do all of it at once.

(use-package org-roam
 :ensure t)

;; After making sure that org-roam is installed successfully, then run the following script for customization.
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Downloads/GitRepositories/my-personal-wiki"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n g" . org-roam-graph)
   ("C-c n i" . org-roam-node-insert)
   ("C-c n c" . org-roam-capture)
   ;; Dailies
   ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
)

;; 1. "org-roam-node-insert" to insert a node in another node. creates a node if it doesn not already exist.
;; 1. "org-roam-node-find" to create/insert a new node if it does not already exist; and visits the node.
;; 1. "org-roam-capture" creates a node if it does not already exist; restores the current window configuration upon completion.
;; 1. "org-roam-buffer-toggle" to open backlinks buffer for a node
;; 1. "org-id-get-create" to convert headings in an org file into nodes (instead of creating separate files for small sections)
;; 1. "org-roam-graph" to launch a graph view of the org-roam notes

;; How to reload cache on-demand after making changes to files? Run: org-roam-db-sync.

;; How to rename a note with everything updated at the same time? The references don't seem to get updated. Find a good solution for this.

;; Rename it within emacs e.g. using dired.
;; Org-roam notices when renaming happens within emacs and will update your links accordingly.
;; If you do it through a file editor, it has no idea!

;; Rename the #+TITLE in your file and you should see the change in org-roam-find-file. You shouldn’t need to run org-roam-db-build-cache.

;; If you want the description of links in all of your org-roam files to reflect the TITLE change as well as the filename change – [[file:AAA.org][AAA]] to [[file:ABC.org][ABC]] – looking in the code I think if you rename TITLE first, and then rename the file through dired, your link descriptions should be updated also.




;; org-roam-ui
;; https://github.com/org-roam/org-roam-ui
;; Prerequisites: org-roam

(use-package org-roam-ui
    :ensure t
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

;; Just use "Meta-X org-roam-ui-open" and it will launch a tab in the browser with this url: http://localhost:35901/
