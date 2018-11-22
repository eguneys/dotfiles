;; http://stackoverflow.com/questions/31079204/emacs-package-install-script-in-init-file
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(setq package-list
      '(web-mode js2-mode expand-region markdown-mode))

; activate all the packages
;(package-initialize)


; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
