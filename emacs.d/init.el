;; do these early so we never see them, not even for an instant
;; otherwise they'd be in `toolbear/shh.el`
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'cask)
(cask-initialize)
(boxed-wine-initialize)
