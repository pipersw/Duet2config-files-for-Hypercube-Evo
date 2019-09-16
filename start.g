; Start Gcode begins
M80         ; 24V power supply on
M220 S100		; Set speed factor back to 100% in case it was changed
M221 S100		; Set extrusion factor back to 100% in case it was changed
M290 R0 S0	; clear babystepping
M106 S0			; Turn part cooling blower off if it is on
; Slicer Start Gcode begins.
