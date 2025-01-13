(*) Notes:
	- This is only for screen recording
	- This settings are for very low-end hardware (multiple gen. old cpu w igpu, 2-6gb ram)


(*) Main Window:
    - Right click on the preview and disable it.


______________________________________________________________________________
|| Select File > Settings to open up settings panel. In the settings panel, ||


(*) Output:
    Set output mode to "Advanced".
  
    Navigate to "Recording" tab:-
	- Video encoder: x264 or QuickSync H.264 if your cpu supports intel QSync
	- Audio encoder: AAC
	- Rescale output: Disabled
	- Rate control: CBR
	- Bitrate: 2000 - 3000 kbps (start from 2000 then increase to see the limit)
	- Target Usage: Balanced

    Navigate to "Audio" tab:-
	- Audio Bitrate: 128


(*) Audio:
    - Sample rate: 44.1 kHz


(*) Video:
    - Canvas resolution: 1280x720
    - Output resolution: 1280x720 (increase this if you can but keep both resolution values the same)
    - Common FPS value: 29.97 (keep it around 24.97 to 30)


(*) Advanced:
    - Process priority: Normal (if you aren't doing any resource intensive task such as gaming, you can set it to "Above normal")
    - Renderer: Direct3D 11
    - Color format: NV12
    - Color space: 709
    - Color range: Limited
