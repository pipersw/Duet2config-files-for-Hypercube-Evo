; bed.g
; called to perform automatic bed compensation via G32
;

M42 P2 S255                 ; LED strip on heater 2 on

M561                        ; clear any bed transform
G28 				                ; Home
