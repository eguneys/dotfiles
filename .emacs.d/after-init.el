;(load-theme 'solarized-light t)
(load-theme 'zenburn t)

;; switch buffers
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
(global-set-key (kbd "C-x t") 'switch-to-previous-buffer)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-M-h") 'er/expand-region)
(global-set-key (kbd "C-M-w") 'er/mark-outside-quotes)

;; whitespace-mode
(setq whitespace-style '(face tabs spaces trailing lines space-before-tab indentation empty space-after-tab space-mark tab-mark))

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs?\\'" . web-mode))
;; jsx-support https://truongtx.me/2014/03/10/emacs-setup-jsx-mode-and-jsx-syntax-checking/
;(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
;; (add-hook 'web-mode-hook (lambda() 
;;                            (local-set-key (kbd "C-M-x RET") 'web-mode-set-content-type)
;;                            (whitespace-mode)
;;                            ))
;; (add-hook 'js2-mode-hook (lambda()
;;                            (local-set-key (kbd "C-M-h") 'er/mark-js-function)
;;                            (whitespace-mode)))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
        ad-do-it))

;; (require 'flycheck)
;; ;; JSX Syntax checking for web-mode
;; (flycheck-define-checker jsxhint-checker
;;                          "A JSX syntax and style checker based on JSXHint."

;;                          :command ("jsxhint" source)
;;                          :error-patterns
;;                          ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
;;                          :modes (web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (equal web-mode-content-type "jsx")
;;               ;; enable flycheck
;;               (flycheck-select-checker 'jsxhint-checker)
;;                             (flycheck-mode))))
;; ;;http://codewinds.com/blog/2015-04-02-emacs-flycheck-eslint-jsx.html
;; (add-hook 'web-mode-hook (lambda() 
;;                            (when (or (equal web-mode-content-type "jsx")
;;                                      (equal web-mode-content-type "javascript"))
;;                              ;; enable flycheck
;;                              (flycheck-select-checker 'javascript-eslint)
;;                              (flycheck-mode))
;;                            ))
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
;; (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))

(setq web-mode-engines-alist
      '(("erb" . "\\.erb\\'")
	("ctemplate" . "\\.hbs\\'"))
      )

(setq web-mode-markup-indent-offset 2)

(setq web-mode-enable-auto-pairing t)

;; js2 mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))


(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))



;; unbind mardown M-n M-p bindings
(add-hook 'markdown-mode-hook 
          (lambda()
            (setq comment-start "~~")
            (setq comment-end "~~")
            (local-unset-key (kbd "M-n"))
            (local-unset-key (kbd "M-p"))))

;; bind C-J as smart indent in coffee
(add-hook 'coffee-mode-hook
          (lambda()
            (local-set-key (kbd "C-j") (kbd "RET"))))

;; flyspell
(dolist (hook '(markdown-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))



(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


(setq cider-show-error-buffer nil)
