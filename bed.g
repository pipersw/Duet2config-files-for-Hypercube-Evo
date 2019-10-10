; bed.g
; called to perform automatic bed compensation via G32
;

M80                           ; 24V power supplie on
M42 P2 S255                   ; LED strip on heater 2 on

M561                          ; clear any bed transform
G28 				          ; Home
G30 P0 X0 Y80 Z-99999        ; probe front left
G30 P1 X0 Y150 Z-99999       ; probe near left leadscrew
G30 P2 X0 Y300 Z-99999       ; probe rear left
G30 P3 X300 Y300 Z-99999      ; probe rear right
G30 P4 X300 Y150 Z-99999      ; probe near right leadscrew
G30 P5 X300 Y80 Z-99999     ; probe front right
G30 P6 X150 Y150 Z-99999 S2 ; Probe center and calibrate the 2 motors to achieve self leveling

;G28 				; Home

