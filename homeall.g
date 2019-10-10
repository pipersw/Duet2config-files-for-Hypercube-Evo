; homeall.g
; called to home all axes
;
M80 ; power on 24V power supply
G4 S5 ; wait 5 second
M42 P2 S10 ; power on led
G91                     ; relative positioning
G1 Z5 F1000 S2          ; lift Z relative to current position
G1 S1 X-335 Y-315 F4000 ; move quickly to X or Y endstop and stop there (first pass)
G1 S1 X-335             ; home X axis
G1 S1 Y-315             ; home Y axis
G1 X5 Y5 F4000          ; go back a few mm
G1 S1 X-335 F400        ; move slowly to X axis endstop once more (second pass)
G1 S1 Y-315             ; then move slowly to Y axis endstop
G90                     ; absolute positioning
M280 P3 S160 I1         ; Alarm Release and Push-Pin UP
G1 X150 Y150 F4000      ; go to first bed probe point and home Z
M558 A1 F300			; Set single probing at faster feed rate
G30 				; Do a single probe to home Z axis
M558 A10 F100			; Set detailed probing at slower feed rate
G30


