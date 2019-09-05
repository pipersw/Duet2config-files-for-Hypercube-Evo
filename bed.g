; bed.g
; called to perform automatic bed compensation via G32
;

M42 P2 S255                  ; LED strip on heater 2 on

;M561                        ; clear any bed transform
G28 				                ; Home
G30 P0 X10 Y150 Z-99999        ; probe near a leadscrew, half way along Y axis
G30 P1 X290 Y150 Z-99999 S2   ; probe near a leadscrew and calibrate 2 motors
