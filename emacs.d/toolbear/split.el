(unless (display-graphic-p)
  (set-display-table-slot standard-display-table
                          'vertical-border
                          (make-glyph-code ?│)))
