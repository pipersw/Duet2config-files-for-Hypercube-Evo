; bed.g
; called to perform manual bed compensation via G32
; caution probe coordinate, take offset probe into account
G28 ; home
M906 X400 Y400 Z800    ; Set peak motor currents (mA)

G30 P0 X300 Y300 Z-99999 ; probe near an adjusting screw
G30 P1 X300 Y80 Z-99999 ; probe near an adjusting screw
G30 P2 X0 Y80 Z-99999 ; probe corner
G30 P3 X0 Y300 Z-99999 S3 ; probe corner and report adjustments needed

M906 X800 Y800 Z1600    ; Set peak motor currents (mA)


