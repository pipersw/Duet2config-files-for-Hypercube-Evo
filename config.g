; Configuration file for Duet WiFi (firmware version 2.03)
; executed by the firmware on start-up
;

; General preferences
G90                                      ; Send absolute coordinates...
M83                                      ; ...but relative extruder moves

M669 K1                                  ; switch to CoreXY mode

; Network
M550 P"COREXY"                           ; Set machine name
M552 S1                                  ; Enable network
;*** Access point is configured manually via M587
M586 P0 S1                               ; Enable HTTP
M586 P1 S0                               ; Disable FTP
M586 P2 S0                               ; Disable Telnet

; Drives
M569 P0 S0                               ; Drive 0 goes forwards (X)
M569 P1 S0                               ; Drive 1 goes forwards (Y)
M569 P2 S0                               ; Drive 2 goes forwards (Z)
;M569 P4 S0                              ; Drive 4 goes forwards (Z) ; for Bed levelling using multiple independent Z motor drivers
;M569 P5 S0                              ; Drive 5 goes forwards (Z) ; for Bed levelling using multiple independent Z motor drivers
M569 P3 S1                               ; Drive 3 goes backwards (E0)

;M584 X0 Y1 Z2:4 E3                      ; three Z motors connected to driver outputs Z
;M671 X-74:-74:330 Y-30:330:150 S1.0     ; Z leadscrews are at (-74,-30), (-74,330) and (330,150), 1mm compensation max

M350 X16 Y16 Z16 E16 I1                  ; Configure microstepping with interpolation
M92 X80 Y80 Z400 E415                  ; Set steps per mm with 1/16 and BMG etruder with 0.9° stepper
M566 X600 Y600 Z30 E3000                  ; Set maximum instantaneous speed changes (mm/min)
M203 X15000 Y15000 Z1500 E6000              ; Set maximum speeds (mm/min)
M201 X3000 Y3000 Z100 E10000             ; Set accelerations (mm/s^2)
M906 X1400 Y1400 Z1400 E1200 I30         ; Set motor currents (mA) and motor idle factor
M84 S30                                  ; Set idle timeout

; Axis Limits
M208 X0 Y-3 Z0 S1                         ; Set axis minima
M208 X300 Y300 Z200 S0                   ; Set axis maxima

; Endstops
M574 X1 Y1 S1                            ; Set active high and disabled endstops

; Z-Probe
M574 Z1 S2                               ; Set endstops controlled by probe
M307 H3 A-1 C-1 D-1                      ; Disable heater 3 on PWM channel for BLTouch
M558 P9 H5 F150 T4000                    ; Set Z probe type to bltouch and the dive height + speeds
G31 P25 X0 Y82 Z0                        ; Set Z probe trigger value, offset and trigger height
M557 X0:300 Y80:220 S20                  ; Define mesh grid

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

; Automatic saving after power loss is not enabled

; Custom settings
M305 P101 S"DuetDriversTemp"             ; temperature warning and overheat flags on the TMC2660 on Duet
M305 P102 S"DuexDriversTemp"             ; temperature warning and overheat flags on the TMC2660 on Duex
M912 P0 S6.0                             ; calibrate CPU temperature
;M556 S80 X0.125 Y0 Z0.5                 ; axis skew compensation
M307 H2 A-1 C-1 D-1                      ; Disable heater 2 on PWM channel for LED strip
M42 P2 S0                                ; LED strip on heater 2 off

; Miscellaneous
T0                                       ; Select first tool

M501                                    ; Read stored parameters from EEPROM

;M80					 ; Turn 24V power supply ON
