;(require 'ido)
;(ido-mode t)
;(setq ido-enable-flex-matching t)

(require 'ido)
(ido-mode 1)
(ido-everywhere 1)

(require 'flx-ido)
(flx-ido-mode 1)

(require 'ido-completing-read+)
(ido-ubiquitous-mode 1)

(require 'ido-vertical-mode)
(ido-vertical-mode 1)
(setq ido-use-virtual-buffers t)
