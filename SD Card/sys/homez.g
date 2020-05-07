; homez.g
; called to home the Z axis
;
M80                     ; power on 24V power supply
G4 S1                   ; wait 1s

G91              ; relative positioning
G1 Z5 F1000 H2   ; lift Z relative to current position
G90              ; absolute positioning
G1 X150 Y70 F4000 ; go to center bed for probe point
G30              ; home Z by probing the bed
