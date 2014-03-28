(show-paren-mode 1)
(when (member 'solarized-dark (custom-available-themes))
  (setq solarized-broken-srgb nil)
  (load-theme 'solarized-dark t))
