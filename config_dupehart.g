M117 "config Dupe Hart"                  ; display config type
M92 X160 Y160 Z1600 E821                 ; Set steps per mm with 1/16 and BMG extruder with 0.9° stepper on XY, 1.8° on Z, leadscrew pas 2mm
M566 X720 Y720 Z24 E400                  ; jerk, Set maximum instantaneous speed changes (mm/min)
M203 X18000 Y18000 Z300 E3600            ; Set maximum speeds (mm/min)
M201 X1500 Y1500 Z250 E3000              ; Set accelerations (mm/s^2)
M906 X800 Y800 Z1600 E800 I30            ; Set peak motor currents (mA) and motor idle factor

; Pressure Advance
;M572 D0 S0.2                             ; enable pressure advance