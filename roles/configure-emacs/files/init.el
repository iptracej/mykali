(add-to-list 'backup-directory-alist
	                  (cons "." "~/.emacs.d/backups/"))
(customize-set-variable
   'tramp-backup-directory-alist backup-directory-alist)
