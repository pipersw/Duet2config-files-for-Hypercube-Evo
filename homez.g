; homez.g
; called to home the Z axis
;
M913 X50 Y50 Z50           ; set X Y Z motors to 50% of their normal current
G91                        ; relative positioning
G1 Z5 F6000 S2             ; lift Z relative to current position
G90                        ; absolute positioning
G1 X20 Y20 F6000           ; go to first probe point
G30                        ; home Z by probing the bed

; Uncomment the following lines to lift Z after probing
;G91                       ; relative positioning
;G1 S2 Z5 F100             ; lift Z relative to current position
;G90                       ; absolute positioning
M913 X100 Y100 Z100        ; set X Y Z motors to 100% of their normal current
