;; -*- lexical-binding: t -*-

;; tabbed.el
;; Emacs frames on a TTY are always full screen and map pretty cleanly to a mental
;; model of tabs. This provides a (leaky) abstraction of frames as tabs.
;;
;; ## TODO
;; * [ ] detect frame creation of the 1st frame from a new client (e.g. `emacsclient --tty`)
;;   and rename it to 'tab#1'. Currently one must manually do `M-x rename-tab` and set it to
;;   tab#1
;; * [ ] when closing tab, renumber subsequent tabs; e.g. tab#(n) becomes tab#(n-1) where
;;   n > number of the closed tab

(defalias 'rename-tab 'set-frame-name)

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
