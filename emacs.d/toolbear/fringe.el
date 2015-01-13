(setq-default
  indicate-buffer-boundaries 'left
  indicate-empty-lines +1)
(global-diff-hl-mode)
(when (not (display-graphic-p)) (diff-hl-margin-mode))
