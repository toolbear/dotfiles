(show-paren-mode 1)
(let* ((background-mode
	  (if (display-graphic-p)
        'dark
      (let ((bg (getenv "TERM_BACKGROUND_MODE"))) (if bg (intern bg) 'light))))
    (theme-name "atelier-heath")
    (theme-suffix (if (eq background-mode 'dark) "" "-light"))
    (theme (intern (concat "base16-" theme-name theme-suffix)))
    )
  (unless (display-graphic-p)
    (if background-mode (set-terminal-parameter nil 'background-mode background-mode)))
  (when (member theme (custom-available-themes))
    (load-theme theme t)))
