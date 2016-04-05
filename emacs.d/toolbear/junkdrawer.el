;; Magnus giving tips on figuring out how to get the CWD or current process via TTY escape codes

;; Tim Taylor:
;; so there’s a few warts, but I’ve been having decent success using multi-term
;; Magnus Stahre:
;; ah, cool
;; Tim Taylor:
;; it lacks a few advanced TTY features that tools like NPM use to move the cursor and provide a little spinner, so I get output like -\|/-\|/-\|-\|/…
;; Magnus Stahre:
;; the backspace thing yeah
;; Tim Taylor:
;; actually, it’s “move cursor to col-N”. The backspace works.
;; Magnus Stahre:
;; fair
;; Tim Taylor:
;; anyhow. One thing I’d like to figure out how to make it do is track the current working directory in the buffer name, so instead of *terminal<1>* it’d be *~/src/dotfiles*, similar to how dired names the buffer based on the directory
;; Magnus Stahre:
;; ah
;; Tim Taylor:
;; but, I’m done with emacs hacking for a little while.
;; Magnus Stahre:
;; maybe you can use uniqify somehow
;; or whatev it’s called
;; Tim Taylor:
;; well, I think there’s escape codes that zsh or my zsh theme is already sending, via my prompt. I’d like it to match whatever my prompt is shortened to.
;; Magnus Stahre:
;; ok
;; hold on
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Tim Taylor:
;; actually, I *know* that it’s sending those escapes, because Terminal.app shows the current directory or currently running process.
;; Magnus Stahre:
;; maybe look into what ansi-color does and use something from there
;; Tim Taylor:
;; oh cool
;; Magnus Stahre:
;; I use that to get pretty looking output from cucumber etc when I run it from within emacs
;; or rspec or similar tools
;; but you should be able to do something similar and call rename-buffer based on it
;; Tim Taylor:
;; that’d be keen
;; I guess if I figure out how to tap into arbitrary escape codes, I can implement my own “move cursor to column-N” workaround, too.
;; Magnus Stahre:
;; ansi-color might already do that
;; Tim Taylor:
;; ansi-color is for shell mode. The ansi handling for eterm is baked into eterm itself.
;; at least, that’s my understanding
;; Magnus Stahre:
;; fair
;; could very well be
;; Tim Taylor:
;; however…I should try running `npm install` as a shell command with ansi-color on and see if it works better
;; Magnus Stahre:
;; (defun ms/colorize-compilation ()
;;     (when (eq major-mode 'compilation-mode)
;;           (ansi-color-apply-on-region compilation-filter-start (point-max))))

;; (add-hook 'compilation-filter-hook 'ms/colorize-compilation)

;; that part is related too
