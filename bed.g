; bed.g
; called to perform automatic bed compensation via G32
;
M80                         ; 24V power supply on
M42 P2 S255                 ; LED strip on heater 2 on

M561                        ; clear any bed transform
G28 				                ; Home
;G30 P0 X0 Y0 Z-99999 		  ; Probe near  Front left leadscrew
;G30 P1 X0 Y300 Z-99999 	  ; PROBE POINT 2 Front right leadscrew
;G30 P2 X130 Y300 Z-99999 	; Probe near Rear Middle leadscrew
;G30 P3 X300 Y300 Z-99999 	; PROBE POINT 4 Rear Right 
;G30 P4 X150 Y150 Z-99999 	; PROBE POINT 5 Center
;G30 P5 X150 Y0 Z-99999 	  ; PROBE POINT 6 Front Middle
;G30 P6 X3000 Y0 Z-99999 S3 	; Probe near a leadscrew and calibrate the 3 motors to achieve self leveling
;G28				                ; Home
