;; Reference: https://niklasfasching.de/posts/org-html-export-inline-images/

;; The default org html-export does not embed images, which means to share exports with images, you have to send around archives. That got annoying real fast and after looking for a workaround and finding this mailing list entry (https://lists.gnu.org/archive/html/emacs-orgmode/2010-09/msg00226.html), I ended up with the following.

(defun org-html-export-to-mhtml (async subtree visible body)
  (cl-letf (((symbol-function 'org-html--format-image) 'format-image-inline))
    (org-html-export-to-html nil subtree visible body)))

(defun format-image-inline (source attributes info)
  (let* ((ext (file-name-extension source))
	 (prefix (if (string= "svg" ext) "data:image/svg+xml;base64," "data:;base64,"))
	 (data (with-temp-buffer (url-insert-file-contents source) (buffer-string)))
	 (data-url (concat prefix (base64-encode-string data)))
	 (attributes (org-combine-plists `(:src ,data-url) attributes)))
    (org-html-close-tag "img" (org-html--make-attribute-string attributes) info)))

(org-export-define-derived-backend 'html-inline-images 'html
  :menu-entry '(?h "Export to HTML" ((?m "As MHTML file and open" org-html-export-to-mhtml))))

;; With this images are embedded as data urls (https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/Data_URIs) and sharing is as simple as sending the html file.

;; I'm so happy there's something like flet/cl-letf (http://endlessparentheses.com/understanding-letf-and-how-it-replaces-flet.html) making this not only possible but really easy. Emacs really is the extensible editor.

;; ------------------

;; Org-mode needs to know what to do with the results when exporting the document to PDF, HTML, or Markdown. By default, it looks for header arguments to determine if it should evaluate the code and output the results (:results value or :results output). If no results argument is explicitly defined, internal functions (like org-babel-merge-params) can fail to resolve default parameters properly, throwing:

;; Symbol’s value as variable is void: value

;; To fix this, we need to explicitly declare the :results header argument on our src blocks
;; 1. #+begin_src sql :results output
;; 2. #+begin_src sql :results value
;; 3. #+begin_src sql :eval no -- If we just want to display the code block as-is in our document without running it during export

(defun org-html-export-without-eval (async subtree visible body)
  "Export to HTML with all source blocks forced to `:eval no`."
  ;; org-babel-default-header-args holds the default parameters for babel blocks.
  ;; We can let-bind it during the export so every block treats its eval setting as "no".
  (let ((org-babel-default-header-args
	 (cons '(:eval . "no")
	       (assq-delete-all :eval org-babel-default-header-args))))
    (org-html-export-to-html async subtree visible body)))

(org-export-define-derived-backend 'html-no-eval 'html
  :menu-entry '(?h "Export to HTML"
		((?e "As HTML (no evaluation)" org-html-export-without-eval))))
