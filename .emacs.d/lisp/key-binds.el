(global-set-key (kbd "C-o") (kbd "C-a C-j TAB C-p TAB C-e"))
(defun just-newline ()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent)
  )