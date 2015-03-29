;; -*- lexical-binding: t; -*-

(line-number-mode +1)
(column-number-mode +1)
(global-linum-mode +1)
(global-set-key (kbd "C-x l") 'goto-line)

;; toolbear linum extension

(defface linum:number
  `((default :inherit linum)
    ;; (((type graphic) (background dark )) :foreground "white") ;; FIXME
    ;; (((type graphic) (background light)) :foreground "black") ;; FIXME
    (((type tty)     (background dark )) :background "black" :foreground "color-18")
    (((type tty)     (background light)) :background "brightwhite" :foreground "color-21"))
  "Face for the line number."
  :group 'linum)
(defface linum:current-line-number
  `((default :inherit linum:number)
    (((type graphic) (background dark )) :bold t) ;; FIXME
    (((type graphic) (background light)) :bold t) ;; FIXME
    (((type tty)     (background dark )) :foreground "color-19")
    (((type tty)     (background light)) :foreground "color-20"))
  "Face for the current line number."
  :group 'linum)
(defface linum:separator
  `((default :inherit linum)
    ;; (((type graphic) (background dark )) :foreground "white") ;; FIXME
    ;; (((type graphic) (background light)) :foreground "black") ;; FIXME
    (((type tty)     (background dark )) :background "black" :foreground "color-18")
    (((type tty)     (background light)) :background "brightwhite" :foreground "color-21"))
  "Face for the line number separator."
  :group 'linum)
(defface linum:current-line-separator
  `((default :inherit linum:separator)
    (((type tty)     (background dark )) :foreground "color-20")
    (((type tty)     (background light)) :foreground "color-19"))
  "Face for the current line number separator."
  :group 'linum)
(defcustom linum:separator-string "  "
  "Separates line numbers from editor text."
  :group 'linum)
(defcustom linum:current-line-separator-string "∙ "
  "Separates line numbers from editor text."
  :group 'linum)

(mapc #'make-variable-buffer-local '(linum:format linum:current))

(add-hook 'linum-before-numbering-hook
  (lambda ()
    (setq linum:format
      (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
        (concat "%" (number-to-string w) "d")))))

(advice-add 'linum-update :before
  (lambda (buffer)
    "Stash the current line number."
    ;; FIXME: want (line-number-at-pos (window-point win)), but linum reuses
    ;;   formatted line numbers across windows.
    (setq linum:current (line-number-at-pos))))

(defun linum:format-func (line-number)
  (if (and linum-mode linum:format linum:current)
      (let* ((current (eq line-number linum:current))
             (line (propertize (format linum:format line-number) 'face (if current 'linum:current-line-number 'linum:number)))
             (separator-string (if current linum:current-line-separator-string linum:separator-string))
             (separator (propertize separator-string 'face (if current 'linum:current-line-separator 'linum:separator))))
        (if (display-graphic-p) line (concat line separator)))))

(setq linum-format 'linum:format-func)
