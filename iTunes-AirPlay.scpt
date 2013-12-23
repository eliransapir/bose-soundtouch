-- Daniel Bahls Awesome AirPlay iTunes Script
-- Made for Bose SoundTouch, but can be used with all AirPlay-devices

-- This script can be included in a repeating iCal event, so it will start every day

(*

* iTunes-AirPlay.scpt
This is a simple AppleScript for controlling iTunes and AirPlay. 

This script can be used with all AirPlay-devices including Bose SoundTouch, AirPort Express etc.
Video-demo available at www.danielbahl.dk

The script detects all available AirPlay Devices and sets the audio volume to 0, it then plays a predefined playlist with either local music, iCloud music or a streaming audio file / radio station. It will slowly turn up the volume to a predefined value, perfect for using as a alarm clock in the morning.
*)

property KnobAmount : 4 -- Turn up every loop with this amount (ex. 4..8..12..16..)
property WaitSeconds : 5 -- wait this many secounds
property AdjustVolumeTo : 40 -- At the end, adjust the volume to this value
property PlayThisPlaylist : "Radio - Nova FM" -- Playlist to play (Can be a playlist with a streaming radio station)

tell application "iTunes"
	
	# Activate AirPlay Devices that is not Apple TV (this can be adjusted, if you want to AirPlay to an Apple TV)
	# Available Devices: computer/AirPort Express/Apple TV/AirPlay device/unknown
	set current AirPlay devices to (get AirPlay devices whose kind is not Apple TV)
	
	# Sæt voluem to 0
	set sound volume to 0
	
	# Tell iTunes to play the Playlist Nova FM
	play playlist PlayThisPlaylist
	
	# Slwoly turn up the vilume
	repeat
		if (get sound volume) is greater than or equal to (AdjustVolumeTo - KnobAmount) then
			set sound volume to AdjustVolumeTo
			exit repeat
		end if
		set sound volume to (sound volume + KnobAmount)
		delay WaitSeconds
	end repeat
	
end tell
