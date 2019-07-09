; homeall.g
; called to home all axes
;

M42 P2 S255             ; LED strip on heater 2 on
G91                     ; relative positioning
G1 Z5 F6000 S2          ; lift Z relative to current position
M98 Pdeployprobe.g      ; deploy mechanical Z probe
G1 S1 X-240 Y-240 F1800 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 X5 Y5 F6000          ; go back a few mm
G1 S1 X-258 Y-235 F360  ; move slowly to X and Y axis endstops once more (second pass)
G90                     ; absolute positioning
G1 X20 Y20 F6000        ; go to first bed probe point and home Z
G30                     ; home Z by probing the bed

; Uncomment the following lines to lift Z after probing
;G91                    ; relative positioning
;G1 S2 Z5 F100          ; lift Z relative to current position
;G90                    ; absolute positioning

M98 Pretractprobe.g     ; retract mechanical Z probe
