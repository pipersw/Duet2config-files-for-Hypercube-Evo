; cancel.g
; called when a print is cancelled after a pause.

M104 S0                      ; extruder off
M140 S0                      ; heated bed heater off
G1 F4000
G91                          ; relative positioning
G1 E-0.2 F300                ; retract the filament a bit before lifting
G1 Z+0.5 X-20 Y-20 F6000     ; move Z up a bit and retract filament even more
G1 X0 Y0 F4000             ; move head to rear

;M84                         ; steppers off
G90                          ; relative positioning
 
