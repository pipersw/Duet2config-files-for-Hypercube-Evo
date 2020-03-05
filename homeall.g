; homeall.g
; called to home all axes
;
M80                     ; power on 24V power supply
G4 S1                   ; wait 1s
M42 P2 S255             ; power on led
M280 P3 S160 I1         ; Alarm Release and Push-Pin UP
G91                     ; relative positioning
M906 X400 Y400 Z600    ; Set peak motor currents (mA)
G1 Z5 F1000 H2          ; lift Z relative to current position
G1 H1 X-335 Y-315 F4000 ; move quickly to X or Y endstop and stop there (first pass)
G1 H1 X-335             ; home X axis
G1 H1 Y-315             ; home Y axis
G1 X5 Y5 F4000          ; go back a few mm
G1 H1 X-335 F400        ; move slowly to X axis endstop once more (second pass)
G1 H1 Y-315             ; then move slowly to Y axis endstop
G90                     ; absolute positioning
G1 X150 Y70 F4000       ; go to center bed probe point and home Z
M558 A1 F300		    ; Set single probing at faster feed rate
G30 			        ; Do a single probe to home Z axis
M558 A10 F100		    ; Set detailed probing at slower feed rate
G30                     ; Do a single probe to home Z axis
M906 X800 Y800 Z1600    ; Set peak motor currents (mA)


