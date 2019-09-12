; Configuration file for Duet WiFi (firmware version 2.03)
; executed by the firmware on start-up
;

; General preferences
G90                                      ; Send absolute coordinates...
M83                                      ; ...but relative extruder moves

M669 K1                                  ; switch to CoreXY mode

; Network
M550 P"HYPERCUBE_EVO_NGEN"               ; Set machine name
M552 S1                                  ; Enable network
M586 P0 S1                               ; Enable HTTP
M586 P1 S0                               ; Disable FTP
M586 P2 S0                               ; Disable Telnet

; Drives
M569 P0 S0                               ; Drive 0 goes forwards (X)
M569 P1 S0                               ; Drive 1 goes forwards (Y)
M569 P2 S0                               ; Drive 2 goes forwards (Z)
M569 P3 S1                               ; Drive 3 goes backwards (E0)
M569 P4 S0                               ; Drive 4 goes forwards (E1/Z2)

M584 X0 Y1 Z2:4 E3                       ; Set drive mapping, two Z motors connected to driver outputs Z and E1
M671 X-25:325 Y150:150 S1.0 		 ; leadscrews at left (connected to Z) and right (connected to E1) of X axis

M350 X16 Y16 Z16 E16 I1                  ; Configure microstepping with interpolation
M92 X80 Y80 Z400 E820                    ; Set steps per mm with 1/16 and BMG extruder with 0.9° stepper
M566 X1200 Y1200 Z60 E3000               ; Set maximum instantaneous speed changes (mm/min)
M203 X30000 Y30000 Z1000 E6000           ; Set maximum speeds (mm/min)
M201 X5000 Y5000 Z500 E10000            ; Set accelerations (mm/s^2)
M906 X1400 Y1400 Z1400 E1200 I30         ; Set motor currents (mA) and motor idle factor
M84 S30                                  ; Set idle timeout

; Axis Limits
M208 X0 Y-3 Z0 S1                        ; Set axis minima
M208 X300 Y300 Z205 S0                   ; Set axis maxima

; Endstops
M574 X1 Y1 S1                            ; Set active high and disabled endstops

; Z-Probe
M574 Z1 S2                               ; Set endstops controlled by probe
M307 H3 A-1 C-1 D-1                      ; Disable heater 3 on PWM channel for BLTouch
M558 P9 F100 H3 R0.5 T6000 A10 S0.03 B0  ; Set Z probe type to bltouch and the dive height + speeds
G31 P25 X0 Y80 Z1.030                    ; Set Z probe trigger value, offset and trigger height
M557 X0:300 Y80:300 S20			 ; Set Z probe point or define probing grid


; Heaters
M307 H0 A254.7 C545.2 D0.9 S1.00 V24.4 B0     ; Disable bang-bang mode for the bed heater and set PWM limit
M307 H1 A564.6 C201.7 D6.1 S1.00 V24.1 B0     ; Disable bang-bang mode for the nozzle heater and set PWM limit
M305 P0 T100000 B4725 C7.060000e-8 R4700     ; Set thermistor + ADC parameters for heater 0
M143 H0 S120                                 ; Set temperature limit for heater 0 to 120C
M305 P1 T100000 B4725 C7.060000e-8 R4700     ; Set thermistor + ADC parameters for heater 1
M143 H1 S275                                 ; Set temperature limit for heater 1 to 275C

; Fans
M106 P0 S0 I0 F500 H-1 C"HotEnd_Fan"                ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S1 I0 F500 H1 T45 C"Extruder_Fan"           ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 H100:101:102 T45:55 L0.3 C"Electronic_Fan"  ; set fan 2 value, turn on at 30% if the CPU temperature reaches 45C, and increase to full speed gradually as the temperature rises to 55C

; Tools
M563 P0 D0 H1                            ; Define tool 0
G10 P0 X0 Y0 Z0                          ; Set tool 0 axis offsets
G10 P0 R0 S0                             ; Set initial tool 0 active and standby temperatures to 0C
M572 D0 S0.1                             ; pressure advance with 0.1mm retractation

; Automatic saving after power loss is not enabled

; Custom settings
M305 P101 S"DuetDriversTemp"             ; temperature warning and overheat flags on the TMC2660 on Duet
M912 P0 S6.0                             ; calibrate CPU temperature
M307 H2 A-1 C-1 D-1                      ; Disable heater 2 on PWM channel for LED strip
M42 P2 S0                                ; LED strip on heater 2 off


; Miscellaneous
T0                                       ; Select first tool

M501                                    ; Read stored parameters from EEPROM
