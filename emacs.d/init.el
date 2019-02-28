;; do these early so we never see them, not even for an instant
;; otherwise they'd be in `toolbear/shh.el`

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(defun boxed-wine--load-user-customizations ()
  "Load all customizations in `~/.emacs.d/CURRENT-USER'.

Loading messages are suppressed. Skips `custom.el'."
  (when (file-exists-p current-user-dir)
    (dolist (file-name (directory-files current-user-dir 't "^[^.#].*\\.el$"))
      (when (not (string-match-p "/custom\\.el$" file-name))
        (load file-name nil 't)))))

(defun boxed-wine--find-custom-themes ()
  (dolist (dir (boxed-wine--find-theme-dirs theme-dir))
    (add-to-list 'custom-theme-load-path dir)))

(defun boxed-wine--find-theme-dirs (parent)
  "Recursively find directories containing themes under DIR."
  (let (matches)
    (cond
     ((not (file-directory-p parent)))

     ((directory-files parent nil "^[^.#].*-theme\.el$" 't) (list parent))

     (t (dolist (d (directory-files parent 't "^[^.#]" 't))
          (setq matches (append (boxed-wine--find-theme-dirs d) matches)))
        matches))))

;;;###autoload
(defun boxed-wine-initialize ()
  (let* ((current-user     (getenv "USER"))
         (current-user-dir (expand-file-name current-user user-emacs-directory))
         (theme-dir        (expand-file-name "themes" user-emacs-directory)))
    (load (setq custom-file (expand-file-name "custom.el" current-user-dir)))
    (boxed-wine--find-custom-themes)
    (boxed-wine--load-user-customizations)))

(provide 'boxed-wine)

(boxed-wine-initialize)
