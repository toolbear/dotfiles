(when (display-graphic-p)
  (blink-cursor-mode -1)
  (set-default 'cursor-type '(hbar . 1))
  (set-default 'cursor-in-non-selected-windows 'hollow))
(global-hl-line-mode +1)

;; multiple-cursors
;; http://emacsrocks.com/e13.html
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "M-SPC") 'set-rectangular-region-anchor)
