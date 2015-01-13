(defun customize-sh-mode ()
  (interactive)
  (setq sh-basic-offset 2)
  (setq sh-indentation 2)
  (setq highlight-indentation-offset 2)
  (highlight-indentation-mode)
  (define-key sh-mode-map (kbd "RET") 'reindent-then-newline-and-indent))

(add-hook 'sh-mode-hook 'customize-sh-mode)
