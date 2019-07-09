; homex.g
; called to home the X axis
;
M913 X50 Y50 Z50     ; set X Y Z motors to 50% of their normal current
G91                  ; relative positioning
G1 Z5 F6000 S2       ; lift Z relative to current position
G1 S1 X-258 F1800    ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F6000          ; go back a few mm
G1 S1 X-258 F360     ; move slowly to X axis endstop once more (second pass)
G1 Z-5 F6000 S2      ; lower Z again
G90                  ; absolute positioning
M913 X100 Y100 Z100  ; set X Y Z motors to 100% of their normal current
