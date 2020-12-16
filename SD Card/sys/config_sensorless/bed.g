; =========================================================================================================
;
; bed.g
; called to perform automatic bed compensation via G32
;
; =========================================================================================================
;
G30 P0 X0 Y310 Z-99999 ; probe near an adjusting screw
G30 P1 X170 Y80 Z-99999 ; probe near an adjusting screw
G30 P2 X300 Y310 Z-99999 S3 ; probe near an adjusting screw and report adjustments needed

G28                                     ; Home-all
M561 									; clear any bed transform
G29 S2 									; Clear height map
G29  									; probe the bed and enable compensation
G1 X0 Y0 F6000							; Go to X0 Y0