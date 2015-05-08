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
   ;; \E[nG - Cursor Horizontal Absolute, e.g. move cursor to column n (terminfo: cuf, cuf1)
   ((eq char ?G)
    (let ((col (min term-width (max 0 term-terminal-parameter))))
      (term-move-columns (- col (term-current-column)))))
   (t)))
(advice-add 'term-handle-ansi-escape :before #'toolbear:term-handle-ansi-escape)
