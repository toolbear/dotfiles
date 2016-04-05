(require 'multi-term)
(setq
  default-terminal-coding-system "utf-8-unix"
  multi-term-program "zsh")
(global-unset-key (kbd "C-x m"))
(global-set-key (kbd "C-x m") 'multi-term)
(defun toolbear:entered-term-mode ()
  (setq term-buffer-maximum-size 10000)
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (setq show-trailing-whitespace nil)

  (let ((disabled-modes '(autopair-mode
                          colorful-points
                          linum-mode
                          hl-line-mode
                          crosshairs-mode)))
    (mapc (lambda (f) (when (fboundp f) (funcall f -1))) disabled-modes)))
(add-hook 'term-mode-hook 'toolbear:entered-term-mode)

(defun toolbear:term-handle-ansi-escape (proc char)
  "Handle additional ansi escapes."
  (cond
   ;; \E[{n}G - Cursor Horizontal Absolute, e.g. move cursor to column n (terminfo: cuf, cuf1)
   ((eq char ?G)
    (let ((col (min term-width (max 0 term-terminal-parameter))))
      (term-move-columns (- col (term-current-column)))))
   ;; \E[2K - Clear whole line (terminfo: undocumented)
   ((eq char ?K)
    ;; term-erase-in-line treats 2K as just K, so we synthesize a 1K here
    (when (= term-terminal-parameter 2)
      (term-erase-in-line 1)))
   ((eq char ?s) ;; \E[s Save Cursor; copied from `Save cursor (terminfo: sc)` in `term.el` which technically is `Save cursor & attrs`
    (term-handle-deferred-scroll)
    (setq term-saved-cursor
          (list (term-current-row)
                (term-horizontal-column)
                term-ansi-current-bg-color
                term-ansi-current-bold
                term-ansi-current-color
                term-ansi-current-invisible
                term-ansi-current-reverse
                term-ansi-current-underline
                term-current-face)
          )
    (setq term-terminal-state 0))
   ((eq char ?u) ;; \E[u Unsave Cursor; copied from `Restore cursor (terminfo: rc)` in `term.el` which technically is `Restore cursor & attrs`
    (when term-saved-cursor
      (term-goto (nth 0 term-saved-cursor)
                 (nth 1 term-saved-cursor))
      (setq term-ansi-current-bg-color
            (nth 2 term-saved-cursor)
            term-ansi-current-bold
            (nth 3 term-saved-cursor)
            term-ansi-current-color
            (nth 4 term-saved-cursor)
            term-ansi-current-invisible
            (nth 5 term-saved-cursor)
            term-ansi-current-reverse
            (nth 6 term-saved-cursor)
            term-ansi-current-underline
            (nth 7 term-saved-cursor)
            term-current-face
            (nth 8 term-saved-cursor)))
    (setq term-terminal-state 0))
   (t)))
(advice-add 'term-handle-ansi-escape :before #'toolbear:term-handle-ansi-escape)

(defun toolbear:filter-term-handle-ansi-escape (args) ;; (proc char)
  "Filter ansi escape, such as transliterating one char to another"
  ;; \E[{row};{column}f - Force Cursor Position, is identical to Cursor Home
  (let ((proc (car args))
        (char (car (cdr args))))
    ;;(message (format "escape: %c" char))
    (if (eq char ?f)
        (list proc ?H)
      args)))
(advice-add 'term-handle-ansi-escape :filter-args #'toolbear:filter-term-handle-ansi-escape)
