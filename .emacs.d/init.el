(when (display-graphic-p)
  ;; FIXME style/adstyle "Light" is ignored if "Regular" is installed
  (set-face-attribute 'default nil :font "Source Code Pro Light 14")
  (set-fontset-font
    (frame-parameter nil 'font)
    'ipa
    (font-spec :family "Menlo" :size 14)
    nil
    'prepend))
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq-default scss-compile-at-save nil)
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(current-language-environment "UTF-8")
 '(make-backup-files nil)
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
