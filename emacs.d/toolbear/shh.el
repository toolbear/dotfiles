(setq
  inhibit-startup-message t
  make-backup-files nil
  create-lockfiles nil
  revert-without-query '(".*"))
(when (not (display-graphic-p))
  (menu-bar-mode -1))
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
