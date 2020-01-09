; Configuration file for Duet WiFi (firmware version 3.00)
; executed by the firmware on start-up
;

; General preferences
G90                                      ; Send absolute coordinates...
M83                                      ; ...but relative extruder moves

M669 K1                                  ; switch to CoreXY mode

; Network
M550 P"Imprimante"                        ; Set machine name
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
M584 X0 Y1 Z2 E3                         ; Set drive mapping
M350 X16 Y16 Z16 E16 I1                  ; Configure microstepping with interpolation
M92 X160 Y160 Z1600 E830                 ; Set steps per mm with 1/16 and BMG extruder with 0.9° stepper on XY, 1.8° on Z, leadscrew pas 2mm
M566 X1000 Y1000 Z400 E120               ; jerk, Set maximum instantaneous speed changes (mm/min)
M203 X12000 Y12000 Z400 E1200            ; Set maximum speeds (mm/min)
M201 X2000 Y2000 Z300 E360               ; Set accelerations (mm/s^2)
M906 X1200 Y1200 Z1400 E800 I30          ; Set peak motor currents (mA) and motor idle factor
M84 S30                                  ; Set idle timeout

; Axis Limits
M208 X0:300 Y-3:300 Z0:200               ; Set axis minima maxima

; X Y Endstops
M574 X1 S1 P"xstop"                            ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                            ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S2                                     ; configure Z-probe endstop for low end on Z

; Z-Probe
M950 S0 C"exp.8"                               ; create servo 0 pin 8 for BLTouch
M558 P9 C"zprobe.in+zprobe.mod" F150 H2.5 R0.5 T2000 A10 S0.03 B0  ; set Z probe type to bltouch and the dive height + speeds
G31 P25 X0 Y80 Z1.25                           ; Set Z probe trigger value, offset and trigger height
M557 X0:300 Y80:300 S20			       ; Set Z probe point or define probing grid

; Thermal Sensors
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950 R4700              ; configure sensor 0 as thermistor on pin bedtemp
M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.060000e-8 R4700  ; configure sensor 1 as thermistor on pin e0temp
M308 S2 Y"drivers" A"DRIVERS"                                     ; configure sensor 2 as temperature warning and overheat flags on the TMC2660 on Duet
M308 S3 P"e1temp" Y"thermistor" T100000 B3950 A"Left_Stepper"     ; configure sensor 3 as thermistor on pin e1temp for left stepper
M308 S4 Y"mcu-temp" A"MCU"                                        ; configure sensor 4 for cpu temperature

; Heaters
M950 H0 C"bedheat" T0                          ; create bed heater output on bedheat and map it to sensor 0
M307 H0 A249.5 C287.5 D5.7 S1.00 V24.0 B0      ; Disable bang-bang mode for the bed heater and set PWM limit
M950 H1 C"e0heat" T1                           ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 A878.0 C303.6 D6.1 S1.00 V24.0 B0      ; Disable bang-bang mode for the nozzle heater and set PWM limit

; Calibrate MCU Temperature
M912 P0 S6.0                                 ; calibrate CPU temperature

; Max temp Protection
M143 H0 S130                                 ; Set temperature limit for heater 0 to 130C
M143 H1 S285                                 ; Set temperature limit for heater 1 to 285C

; Fans
M950 F0 C"fan0" Q500                           ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1 C"PartCooling"                  ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M950 F1 C"fan1" Q500                           ; create fan 1 on pin fan1 and set its frequency
M106 P1 H1 T45                       ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M950 F2 C"fan2" Q500                           ; create fan 2 on pin fan2 and set its frequency
M106 P2 H2:4 L0.0 X0.05 B0.5 T45:55    ; set fan 2 value, turn on at 50% if the CPU temperature reaches 45C, and increase to full speed gradually as the temperature rises to 55C

; Tools
M563 P0 D0 H1 S"HotEnd"                  ; Define tool 0
G10 P0 X0 Y0 Z0                          ; Set tool 0 axis offsets
G10 P0 R0 S0                             ; Set initial tool 0 active and standby temperatures to 0C

; Pressure Advance
M572 D0 S0.2                             ; enable pressure advance

; Automatic saving after power loss is enabled
M911 S20.0 R22.0 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"

; Led strip
M950 P2 C"e1heat"                        ; create GPIO port 2 attached to heater 1 pin on expansion connector PWM channel for LED strip

; firmware retractation (activate in slicer)
M207 S1.2 F2100 Z0.075                   ; retract 1.2mm 35mm/s

; Miscellaneous
T0                                       ; Select first tool

M564 H0                                  ; allow movement of axes that have not been homed

; workaround to show ATX button
M81                                     ; 24V PSU OFF

M501                                    ; Read stored parameters from EEPROM