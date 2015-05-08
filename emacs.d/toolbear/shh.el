(setq
  inhibit-startup-message t
  make-backup-files nil
  create-lockfiles nil
  revert-without-query '(".*"))
(fset 'yes-or-no-p 'y-or-n-p)
