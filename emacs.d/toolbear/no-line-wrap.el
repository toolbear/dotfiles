(set-default 'truncate-lines t)
(set-display-table-slot standard-display-table
                        'truncation
                        (make-glyph-code ?⋮))
(set-display-table-slot standard-display-table
                        'wrap
                        (make-glyph-code ?⤸))
