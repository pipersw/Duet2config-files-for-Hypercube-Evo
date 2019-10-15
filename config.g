; Configuration file for Duet WiFi (firmware version 2.03)
; executed by the firmware on start-up
;

; General preferences
G90                                      ; Send absolute coordinates...
M83                                      ; ...but relative extruder moves

M669 K1                                  ; switch to CoreXY mode

; Network
M550 P"HYPERCUBE"                        ; Set machine name
M552 S1                                  ; Enable network
M586 P0 S1                               ; Enable HTTP
M586 P1 S0                               ; Disable FTP
M586 P2 S0                               ; Disable Telnet

; Drives
M569 P0 S0 F8                            ; Drive 0 goes forwards (X)
M569 P1 S0 F8                            ; Drive 1 goes forwards (Y)
M569 P2 S0 F8                            ; Drive 2 goes forwards (Z)
M569 P3 S0 F4                            ; Drive 3 goes forwards (E0)
M569 P4 S0 F8                            ; Drive 4 goes forwards (E1/Z2)
M584 X0 Y1 Z2:4 E3                       ; Set drive mapping, two Z motors connected to driver outputs Z and E1
M671 X-25:325 Y150:150 S1.1 		     ; leadscrews at left (connected to Z) and right (connected to E1) of X axis
M350 X16 Y16 Z16 E16 I1                  ; Configure microstepping with interpolation
M92 X80 Y80 Z400 E815                    ; Set steps per mm with 1/16 and BMG extruder with 0.9° stepper
M566 X600 Y600 Z100 E120                 ; jerk, Set maximum instantaneous speed changes (mm/min)
M203 X15000 Y15000 Z400 E2100            ; Set maximum speeds (mm/min)
M201 X5000 Y5000 Z1000 E2000             ; Set accelerations (mm/s^2)
M204 P5000 T4000                         ; Set Max acceleration for P=printing moves and T=travel move
M906 X1100 Y1100 Z1100 E900 I30          ; Set motor currents (mA) and motor idle factor
M84 S30                                  ; Set idle timeout

; Axis Limits
M208 X0:300 Y-3:300 Z0:205               ; Set axis minima maxima

; X Y Endstops
M574 X1 Y1 S1                            ; Set active high and disabled endstops

; Z-Probe
M574 Z1 S2                               ; Set endstops controlled by probe
M307 H3 A-1 C-1 D-1                      ; Disable heater 3 on PWM channel for BLTouch
M558 P9 F100 H3 R0.5 T2000 A10 S0.03 B1  ; Set Z probe type to bltouch and the dive height + speeds
G31 P25 X0 Y80 Z0.90                     ; Set Z probe trigger value, offset and trigger height
M557 X0:300 Y80:300 S20			             ; Set Z probe point or define probing grid

; Thermal Sensors
M305 P0 T100000 B3950 R4700                  ; Set thermistor + ADC parameters for heater 0
M305 P1 T100000 B4725 C7.060000e-8 R4700     ; Set thermistor + ADC parameters for heater 1
M305 P101 S"Duet_TMC"                        ; temperature warning and overheat flags on the TMC2660 on Duet
M305 P103 S"Left_Stepper" X2 T100000 B3950   ; Set thermistor + ADC parameters for heater 2 - this is used to measure left XY stepper temperature

; Calibrate MCU Temperature
M912 P0 S6.0                                 ; calibrate CPU temperature

; Max temp Protection
M143 H0 S125                                 ; Set temperature limit for heater 0 to 125C
M143 H1 S275                                 ; Set temperature limit for heater 1 to 275C

; PID settings
M307 H0 A125.0 C140.2 D0.3 S1.00 V24.0 B1    ; Disable bang-bang mode for the bed heater and set PWM limit
M307 H1 A426.6 C148.6 D4.8 S1.00 V24.0 B1    ; Disable bang-bang mode for the nozzle heater and set PWM limit

; Fans
M106 P0 S0 I0 F500 H-1 C"HotEnd_Fan"                ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S1 I0 F500 H1 T45 C"Extruder_Fan"           ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 H100:101:102 F30000 L0.0 X0.05 B0.5 T50:70 C"Duet_Fan"        ; set fan 2 value, turn on at 50% if the CPU temperature reaches 55C, and increase to full speed gradually as the temperature rises to 70C

; Tools
M563 P0 D0 H1                            ; Define tool 0
G10 P0 X0 Y0 Z0                          ; Set tool 0 axis offsets
G10 P0 R0 S0                             ; Set initial tool 0 active and standby temperatures to 0C

; Pressure Advance
;M572 D0 S0.1                             ; enable pressure advance

; Automatic saving after power loss is not enabled

; Led strip
M307 H2 A-1 C-1 D-1                                       ; Disable heater 2 on PWM channel for LED strip

; firmware retractation (activate in slicer)
M207 S1.2 F2100 Z0.075                   ; retract 1.2mm 35mm/s

; Miscellaneous
T0                                       ; Select first tool

M501                                    ; Read stored parameters from EEPROM
