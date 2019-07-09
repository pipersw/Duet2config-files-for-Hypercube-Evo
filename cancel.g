; cancel.g
; called when a print is cancelled after a pause.

M104 S0                      ; extruder off
M140 S0                      ; heated bed heater off

G91                          ; relative positioning
G1 E-1 F300                  ; retract the filament a bit before lifting
G1 Z+0.5 E-5 X-20 Y-20 F6000 ; move Z up a bit and retract filament even more
G28 X                        ; home X, head out ofthe way
G1 Y190 F9000                ; move heatbed to front

M84                          ; steppers off
G90                          ; relative positioning
M81 S1						           ; Turn 24V power off when all thermostatic fans have turned off 
