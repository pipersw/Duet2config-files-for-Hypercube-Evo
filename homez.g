; homez.g
; called to home the Z axis
;

G91              ; relative positioning
G1 Z5 F1000 S2   ; lift Z relative to current position
G90              ; absolute positioning
G1 X150 Y70 F4000 ; go to center bed for probe point
G30              ; home Z by probing the bed
