;; -*- lexical-binding: t -*-

(defun tabs:new ()
  "Create a new frame named `tab#N` where `N` is the next available tab number."
  (interactive)
  (let* ((latest (car (tabs:ours)))
         (latest-name (if latest (frame-parameter latest 'name)))
         (name (cond ((null latest-name) "tab#1")
                     ((string-match "^tab#\\([1-9][0-9]?\\)$" latest-name)
                      (let ((N (string-to-number (match-string 1 latest-name))))
                        (format "tab#%d" (+ 1 N))))
                     (t "tab#1")))
         (parameters `((name . ,name))))
    (with-current-buffer "*scratch*"
      (let ((f (make-frame parameters)))
        (unless (display-graphic-p) (select-frame f))))))

(defun tabs:select (N)
  "Select the frame named `tab#N`."
  (interactive "p")
  (select-frame-by-name (format "tab#%d" N)))

(defun tabs:ours ()
  "Return a list of all frames that are tabs on this terminal."
  (let ((terminal (get-device-terminal nil)))
    (filtered-frame-list
     (lambda (frame)
       (and
        (eq (frame-terminal frame) terminal)
        (string-match-p "^tab#[1-9][0-9]?$" (frame-parameter frame 'name)))))))

(global-set-key (kbd "M-t") 'tabs:new)
(dotimes (N 8)
  (global-set-key
   (kbd (format "M-%d" (+ 1 N)))
   (lambda ()
     (interactive)
     (tabs:select (+ 1 N)))))
