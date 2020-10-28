M80          ; power on power
G4 P1000     ; wait 1000ms
G28 XY       ; home X and Y
G1 X50       ; move carriage away from stepper fan
G10 P0 S100  ; set extruder 0 to 100 degres
M116 H1      ; wait temperature to be reached on extruder
G92 E0       ;Reset the position of the extruder
G1 E-1000 F6000 ; retract 1000mm 100mm/s