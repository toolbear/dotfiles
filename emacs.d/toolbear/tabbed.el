;; -*- lexical-binding: t -*-
(require 'dash)

(let ((N 0))
  (defun tabs:new ()
    "Create a new frame named `tab#N` where `N` is the next available tab number."
    (interactive)
    (setq N (+ 1 N))
    (let* ((name (format "tab#%d" N))
           (parameters `((name . ,name))))
      (with-current-buffer "*scratch*"
        (let ((frame (make-frame parameters)))
          (unless (display-graphic-p) (select-frame frame)))))))

(defun tabs:select (N)
  "Select the frame named `tab#N`."
  (interactive "p")
  (select-frame-by-name (format "tab#%d" N)))

(global-set-key (kbd "M-t") 'tabs:new)
(dotimes (N 8)
  (global-set-key
   (kbd (format "M-%d" (+ 1 N)))
   (lambda ()
     (interactive)
     (tabs:select (+ 1 N)))))
