(when (display-graphic-p)
  (blink-cursor-mode -1)
  (set-default 'cursor-type '(hbar . 1))
  (set-default 'cursor-in-non-selected-windows 'hollow))