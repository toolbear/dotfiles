(when (display-graphic-p)
  ;; FIXME style/adstyle "Light" is ignored if "Regular" is installed
  (set-face-attribute 'default nil :font "Source Code Pro Light 14")
  (set-fontset-font
    (frame-parameter nil 'font)
    'ipa
    (font-spec :family "Menlo" :size 14)
    nil
    'prepend))
