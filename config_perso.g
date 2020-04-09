M92 X160 Y160 Z1600 E821                 ; Set steps per mm with 1/16 and BMG extruder with 0.9° stepper on XY, 1.8° on Z, leadscrew pas 2mm
M566 X720 Y720 Z20 E400                  ; jerk, Set maximum instantaneous speed changes (mm/min)
M203 X18000 Y18000 Z300 E3600            ; Set maximum speeds (mm/min)
M201 X1000 Y1000 Z100 E3000              ; Set accelerations (mm/s^2)
M906 X800 Y800 Z1400 E800 I30            ; Set peak motor currents (mA) and motor idle factor

; Pressure Advance
M572 D0 S0.2                             ; enable pressure advance

; firmware retractation (activate in slicer)
M207 S1.0 F1800 Z0.075                   ; retract 1mm 30mm/s z lift 0.075mm


; leadscrews for bed
M671 X0:312:150 Y0:310:-7 P0.5         ; adjusting screws at rear right, rear left and middle front, thread pitch 0.5mm