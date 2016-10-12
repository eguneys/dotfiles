(global-set-key (kbd "C-o") (kbd "C-a C-j TAB C-p TAB C-e"))
(defun just-newline ()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent)
  )

(global-set-key (kbd "M-t") (kbd "C-f M-b M-d"))

(global-set-key (kbd "M-e") 'backward-sentence)
(global-set-key (kbd "M-a") 'forward-sentence)
