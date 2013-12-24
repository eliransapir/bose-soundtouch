# AirPlay and Bose SoundTouch scripts

Tap into [Daniel Bahls](http://www.danielbahl.dk/) awesome scripts for Bose SoundTouch and Apple AirPlay. I use this GitHub-project to publish scripts and code for improving my life with AirPlay.


# iTunes-AirPlay.scpt 

**This is a simple AppleScript for controlling iTunes and AirPlay**

This script can be used with all AirPlay-devices including Bose SoundTouch, AirPort Express etc.
Video-demo available at www.danielbahl.dk

The script detects all available AirPlay Devices and sets the audio volume to 0, it then plays a predefined playlist with either local music, iCloud music or a streaming audio file / radio station. It will slowly turn up the volume to a predefined value, perfect for using as a alarm clock in the morning.

===============

# Tips and Tricks

*  Press and hold the #5 and "Volume Down" buttons together for extra information, RSSI shows the WiFi signal strenght.

*  SoundTouch accesspoint: hold down the #2 and "Volume Down" - then connect to the BOSE WiFi AP and open http://192.168.1.1

*  "Now Playing" XML-feed can be accessed on http://ip.of.bose:8090/now_playing/

Example: 
```
<nowPlaying deviceID="0000000000" source="INTERNET_RADIO">
<ContentItem source="INTERNET_RADIO" location="0000" sourceAccount="">
<itemName>DR P3</itemName>
</ContentItem>
<track/>
<artist/>
<album/>
<stationName>DR P3</stationName>
<art artImageStatus="IMAGE_PRESENT">http://logo.vtuner.net/007452/logo/logo-3516.jpg</art>
<playStatus>PLAY_STATE</playStatus>
<head/>
</nowPlaying>
```
* Info XML-feed can be accessed on http://ip.of.bose:8090/info
