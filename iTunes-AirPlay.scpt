-- Daniel Bahls Awesome AirPlay iTunes Script
-- Made for Bose SoundTouch, but can be used with all AirPlay-devices

-- This script can be included in a repeating iCal event, so it will start every day

(*

* iTunes-AirPlay.scpt
This is a simple AppleScript for controlling iTunes and AirPlay. 

This script can be used with all AirPlay-devices including Bose SoundTouch, AirPort Express etc.
Video-demo available at www.danielbahl.dk

The script detects all available AirPlay Devices and sets the audio volume to 0, 
it then plays a predefined playlist with either local music, iCloud music or
a streaming audio file / radio station.

It will slowly turn up the volume to a predefined value, perfect for using as a alarm clock in the morning.

This script can be included in a repeating iCal event, so it will start every day.

*)

property KnobAmount : 4 -- turn up the vol. every loop with this amount (ex. 4..8..12..16..)
property WaitSeconds : 5 -- wait this many secounds betweens every loop
property AdjustVolumeTo : 40 -- at the end, adjust the volume to this value
property PlayThisPlaylist : "Radio - Nova FM" -- Playlist (Can be a playlist with a streaming radio station)

tell application "iTunes"
	
	# Activate all AirPlay devices except Apple TVs (this can be adjusted, if you want to AirPlay to an Apple TV)
	# - Devicetypes: computer/AirPort Express/Apple TV/AirPlay device/unknown
	# Bose SoundTouch is reconized as a "computer"
	set current AirPlay devices to (get AirPlay devices whose kind is not Apple TV)
	
	# Set Volume to 0
	set sound volume to 0
	
	# Tell iTunes to play the Playlist
	play playlist PlayThisPlaylist
	
	# Sloooowly turn up the volume
	repeat
		if (get sound volume) is greater than or equal to (AdjustVolumeTo - KnobAmount) then
			set sound volume to AdjustVolumeTo
			exit repeat
		end if
		set sound volume to (sound volume + KnobAmount)
		delay WaitSeconds
	end repeat
	
end tell
