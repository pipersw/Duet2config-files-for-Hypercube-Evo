;Check if water pump is running correctly
if  (heat.heaters[1].current > 55) ; only react if extruder temp is over 55 degrees C (or whtever you have it configured to start/stop at)
	if fans[1].rpm <= 1000 ; Coolant pump RPM off or low
		echo "Water pump fault - shutting down - RPM : " ^ fans[1].rpm
		M112; emergency shutdown
		M81 S1 ; turn off power when fans have turned off
	elif (fans[1].rpm > 1000) && (fans[1].rpm < 3000)
		echo "WARNING: Water pump RPM low - RPM : " ^ fans[1].rpm
		if (state.status=="processing") ; check if we're printing
		        M25 ; pause print so you might be able to save it using M119
			;M41 P5 S1  ; activate output connected to externally powered latching relay here to sound alarm
			M0 ; unconditional stop.  If axes are homed and a print is being canceled will run cancel.g  otherwise will run stop.g
			M81 S1 ; turn off power when fans have turned off
	else
			;echo "Coolant OK - RPM : "  ^ fans[1].rpm
{1}
