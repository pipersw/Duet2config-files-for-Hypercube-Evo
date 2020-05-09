;M117 "Start.g"
M80             ; power on 24V power supply
M144 S0         ; set bed to standby temperature

M203 X18000 Y18000 Z300 E3600            ; Set maximum feedrate speeds (mm/min)
M201 X1000 Y1000 Z100 E3000              ; Set accelerations (mm/s^2)

