;; Backup files http://stackoverflow.com/questions/151945/how-do-i-control-how-emacs-makes-backup-files?lq=1
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
(setq backup-directory-alist `((--backup-directory)))
