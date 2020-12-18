; =========================================================================================================
;
; Configuration file for Duet WiFi (firmware version 3)           Version 20201129
; for 0.9° motors on xyz
; extruder heater connected on E1
; BLTOUCH
;
; for CaribouDuet320
; https://github.com/Caribou3d/CaribouDuet-Configuration-and-Macros/tree/main/Bondtech-E3d-Thermistor/sys
;
; =========================================================================================================
; Network settings
; =========================================================================================================
;
M550 P"Hypercube"                                 ; set printer name
M669 K1                                           ; switch to CoreXY mode
;
M552 S1 P0.0.0.0                                       ; enable network, set IP DHCP
M586 P0 S1                                             ; enable HTTP
M586 P1 S1                                             ; enable FTP
M586 P2 S0                                             ; disable Telnet
M575 P1 S1 B57600                                      ; Enable support for PanelDue
;

; =========================================================================================================
; Drives
; =========================================================================================================
;
M569 P0 S0 F8                            ; Drive 0 goes forwards (X)
M569 P1 S0 F8                            ; Drive 1 goes forwards (Y)
M569 P2 S0 F8                            ; Drive 2 goes forwards (Z)
M569 P3 S1 F4                            ; Drive 3 goes backwards (E0)
M569 P4 S0 F4                            ; Drive 4 goes forwards (E1)
M584 X0 Y1 Z2 E3                         ; Set drive mapping
M350 X16 Y16 Z16 E16 I1                  ; Configure microstepping with interpolation
M92 X160 Y160 Z1600 E415                 ; Set steps per mm with 1/16 and BMG extruder with 1.8° stepper on XY, 1.8° on Z, leadscrew pas 2mm
;M566 X720 Y720 Z24 E400                  ; jerk, Set maximum instantaneous speed changes (mm/min)
;M203 X18000 Y18000 Z300 E3600            ; Set maximum speeds (mm/min)
;M201 X1500 Y1500 Z250 E3000              ; Set accelerations (mm/s^2)
M201 X500.00 Y500.00 Z100.00 E500.00                    ; set accelerations (mm/s^2)
M203 X9000.00 Y9000.00 Z1000.00 E3600.00                ; set maximum speeds (mm/min)
M204 P500.0 T500.0                                      ; set print and travel accelerations (mm(s^2)
M566 X480.00 Y480.00 Z48.00 E300.00                     ; set maximum instantaneous speed changes (mm/min)
;M906 X1400 Y1400 Z1400 E600 I30         ; Set peak motor currents to 85% (mA) and motor idle factor
;M906 X1100 Y1100 Z800 E600 I40            ; Set peak motor currents between 50% to 85% (mA) and motor idle factor
M906 X800 Y800 Z800 E600 I40            ; Set peak motor currents between 50% to 85% (mA) and motor idle factor
M84 S30                                  ; Set idle timeout

; Axis Limits
M208 X0:300 Y-3:300 Z0:190               ; Set axis minima maxima

; define the X and Y coordinates of the adjusting screws
M671 X-10:176.5:310 Y320:-0.1:320 P0.5   ; adjusting screws at rear left, front middle and rear right, thread pitch 0.5mm

; X Y Endstops
M574 X1 S3                             ; configure active-high endstop for low end on X via pin xstop
M574 Y1 S3                             ; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S2                             ; configure Z-probe endstop for low end on Z
M574 Z2 S3                             ; configure sensorless endstop for high end on Z

; Stallguard Sensitivy

M915 X S2 F0 H400 R0		        	 				; Set X axis Sensitivity
M915 Y S1 F0 H400 R0		          	 				; Set Y axis Sensitivity
M915 Z S0 F0 H200 R0		          	 				; Set Z axis Sensitivity

; run-out filament detector
M591 D0 P3 C"e0stop" S1 R20:200 L25.5 E20.0 ; Duet3D rotating magnet sensor for extruder drive 0 is connected to E0 endstop input, enabled, sensitivity 25.5mm.rev, 20% to 200% tolerance, 20mm detection length

; Z-Probe
M950 S0 C"exp.8"                                                 ; create servo 0 pin 8 for BLTouch
M558 P9 C"zprobe.in+zprobe.mod" F150 H5 R0.5 T3500 A10 S0.03 B0  ; set Z probe type to bltouch and the dive height + speeds, bed on
G31 P25 X34.5 Y0.2 Z3.400                                             ; Set Z probe trigger value, offset and trigger height
;M557 X40:300 Y10:260 P20			                             ; Set Z probe point or define probing grid 20x20 points per axis
M557 X40:300 Y10:260 P3			                             ; Set Z probe point or define probing grid 3x3 points per axis

; Thermal Sensors and heaters for bed
M308 S0 P"bedtemp" Y"thermistor" T100000 B3950 A"Bed"       ; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bedheat" T0                          				; create bed heater output on bedheat and map it to sensor 0
M140 H0 S0 R50                                  			; set temperature for bed 50deg in standby
M307 H0 A167.0 C982.2 D5.1 S1.00 V23.1 B0      				; Disable bang-bang mode for the bed heater and set PWM limit
M143 H0 S135 A2                                 			; switch off heater temporarily if it exceeds 135°C
M143 H0 S140 A0                                 			; raise a heater fault if it exceeds 140°C
M144 														; put bed heater on standby temperature

; Thermal Sensors and heaters for hotend 0
M308 S1 P"spi.cs1" Y"rtd-max31865" F50 A"Hotend0"           ; configure sensor 1 as pt100 on spi pin cs1, filter 50Hz
M950 H1 C"e0heat" T1                           				; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 A771.7 C282.9 D6.2 S1.00 V24.0 B0      				; Disable bang-bang mode for the nozzle heater and set PWM limit
M143 H1 S275 A2                                 			; switch off heater temporarily if it exceeds 275°C
M143 H1 S285 A0                                 			; raise a heater fault if it exceeds 285°C

; Thermal Sensors and heaters for TMC drivers
M308 S2 Y"drivers" A"Drivers"                               ; configure sensor 2 as temperature warning and overheat flags on the TMC2660 on Duet

; Thermal Sensors and heaters for water temperature
M308 S3 P"e1temp" Y"thermistor" T10000 B3950 A"Water"       ; configure sensor 3 as thermistor on pin e1temp for temp water 

; Thermal Sensors and heaters for processor
M308 S4 Y"mcu-temp" A"Processor"                            ; configure sensor 4 for cpu temperature


; Calibrate MCU Temperature
M912 P0 S6.0                                 

; Fans
M950 F0 C"fan0" Q100                           ; create fan 0 on pin fan0 and set its frequency for tool 0
M106 P0 S0 H-1                                 ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M950 F1 C"!fan1+^exp.pb6" Q100                 ; create fan 1 on pin fan1 and set its frequency, read pwm
M106 P1 S1.0 T45 H1 C"Pump"                    ; Set fan 1/pump value to 100% when temp >45C

; Tools
M563 P0 D0 H1                            ; Define tool 0 on extruder 0, heater 1 fan 0
G10 P0 X0 Y0 Z0                          ; Set tool 0 axis offsets
G10 P0 R0 S160                           ; Set initial tool 0 active and standby temperatures to 160C
T0                                       ; Select first tool

; Pressure Advance
;M572 D0 S0.8                             ; enable pressure advance 0.8mm

; firmware retractation (activate in slicer)
;M207 S4.5 F1500 Z0.5                   ; retract 4.5mm 25mm/s z lift 0.5mm

; Automatic saving after power loss is enabled
M911 S21.0 R23.0 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"

; Miscellaneous
M564 H0                                  ; allow movement of axes that have not been homed
M376 H4                                  ; Set bed compensation taper to 4mm

; workaround to show ATX button
M81 S1                                  ; 24V PSU OFF

M501                                    ; Read stored parameters from EEPROM

G90                                                      ; send absolute coordinates...
M83                                                      ; ... but relative extruder moves
