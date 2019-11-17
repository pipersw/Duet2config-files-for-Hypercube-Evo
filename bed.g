; bed.g
; called to perform automatic bed compensation via G32
;

M561                          ; clear any bed transform
G28 			; Home
G30 P0 X0 Y150 Z-99999       ; probe near left leadscrew
G30 P1 X300 Y150 Z-99999 S2   ; probe near right leadscrew and calibrate the 2 motors to achieve self leveling

G30 P0 X0 Y150 Z-99999       ; probe near left leadscrew
G30 P1 X300 Y150 Z-99999 S2   ; probe near right leadscrew and calibrate the 2 motors to achieve self leveling


G30 P0 X0 Y150 Z-99999       ; probe near left leadscrew
G30 P1 X300 Y150 Z-99999 S2   ; probe near right leadscrew and calibrate the 2 motors to achieve self leveling

;G28 Z				; Home

