(when (display-graphic-p)
  (set-face-attribute 'default nil :font "Source Code Pro Light 14")
  (set-fontset-font
    (frame-parameter nil 'font)
    'ipa
    (font-spec :family "Menlo" :size 14)
    nil
    'prepend))
