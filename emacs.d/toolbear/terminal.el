(require 'multi-term)
(setq
  default-terminal-coding-system "utf-8-unix"
  multi-term-program "zsh")
(global-unset-key (kbd "C-x m"))
(define-key global-map (kbd "C-x m") 'multi-term)
(add-hook 'term-mode-hook
  (lambda ()
    (setq term-buffer-maximum-size 10000)
    (setq show-trailing-whitespace nil)
    ;;(autopair-mode -1)
    ;;(colorful-points -1)
    (add-to-list 'term-bind-key-alist '("C-M-[" . multi-term-prev))
    (add-to-list 'term-bind-key-alist '("C-M-]" . multi-term-next))
    (define-key term-raw-map (kbd "C-y") 'term-paste)
    ))
