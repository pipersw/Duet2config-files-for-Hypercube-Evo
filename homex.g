; homex.g
; called to home the X axis
;
; generated by RepRapFirmware Configuration Tool v2 on Mon Jul 22 2019 22:50:24 GMT+0200 (heure d’été d’Europe centrale)
G91               ; relative positioning
G1 Z5 F2000 S2    ; lift Z relative to current position
G1 S1 X-335 F1800 ; move quickly to X axis endstop and stop there (first pass)
G1 X5 F4000       ; go back a few mm
G1 S1 X-335 F360  ; move slowly to X axis endstop once more (second pass)
G1 Z-5 F2000 S2   ; lower Z again
G90               ; absolute positioning
