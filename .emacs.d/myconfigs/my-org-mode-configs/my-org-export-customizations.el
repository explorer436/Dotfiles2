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
