(show-paren-mode 1)
(let* ((background-mode
	  (if (display-graphic-p)
        'dark
      (intern (getenv "TERM_BACKGROUND_MODE"))))
    (theme-name "atelierheath")
    (theme (intern (concat "base16-" theme-name "-" (symbol-name background-mode)))))
  (unless (display-graphic-p)
    (if background-mode (set-terminal-parameter nil 'background-mode background-mode)))
  (when (member theme (custom-available-themes))
    (load-theme theme t)))
