; bed.g
; called to perform automatic bed compensation via G32
;
; generated by RepRapFirmware Configuration Tool v3.1.3 on Thu Jun 11 2020 20:53:45 GMT+0200 (heure d’été d’Europe centrale)
G30 P0 X0 Y310 Z-99999 ; probe near an adjusting screw
G30 P1 X170 Y80 Z-99999 ; probe near an adjusting screw
G30 P2 X300 Y310 Z-99999 S3 ; probe near an adjusting screw and report adjustments needed
;M561 ; clear any bed transform
;G29  ; probe the bed and enable compensation

