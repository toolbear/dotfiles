(setq
  inhibit-startup-message t
  make-backup-files nil
  create-lockfiles nil)
(when (not (display-graphic-p))
  (menu-bar-mode -1))
(tool-bar-mode -1)