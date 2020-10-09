;===================================================================================================
;====================================== Volume OSD =================================================
;===================================================================================================
;	Author:						Sjc1000 ( Uptone Software )
;
;	System:						Win7 x64. AutoHotkey ANSI x86. ( CAN run on other systems :D )
;
;	Contact:					insertfunnyaddress@hotmail.com, 42Echo6Alpha@gmail.com, 
;								http://www.autohotkey.com/board/user/16820-sjc1000/
;
;	Comments:					A simple volume on screen display, it changes when you press the
;								hotkeys you set and when any other program changes the volume.
;===================================================================================================


SetBatchLines, -1


;=== User Variables ( Feel free to change these ) ==================================================

Gui_W				:= A_ScreenWidth / 2 - 20


Gui_X				:= A_ScreenWidth - gui_W - 10
Gui_Y				:= A_ScreenHeight - 140


Back_Colour			:= 0x000000
Font_Colour			:= 0xFFFFFF
BackBar_Colour		:= 0x000000
Bar_Colour			:= 0xFFFFFF
roundedGui			:= 0

VolUp_Key			:= "^!Up"
VolDown_Key			:= "^!Down"
muteKey 			:= "^!End"
Amount				:= 5


Update_Freq			:= 1
Timeout				:= 1500
Max_Trans			:= 200

mouseOverTray 		:= 1

;=== End of user variables =========================================================================

Gui_X				:= Gui_X ? "x" Gui_X : ""
Gui_Y 				:= Gui_Y ? "y" Gui_Y : ""
Update 				:= 0

SoundGet, Vol
Curr_Vol			:= Vol

Trans 				:= 0


Control_W			:= GUI_W - 30


;=== Main GUI =======================================================================================
Gui, Color, % Back_Colour, 
Gui, Font, c%Font_Colour% s12 Bold
Gui, Add, Text, w%Control_W% Center, Volume
Gui, Font
Gui, Add, Progress, w%Control_W% vProgress c%Bar_Colour% +Background%BackBar_Colour%, % Curr_Vol
Gui, Font, c%Font_Colour% s24 Bold
SoundGet, Vol
Gui, Add, Text, w%Control_W% Center vVol, % Floor( vol ) "%"
Gui, -Caption +AlwaysOnTop -SysMenu +ToolWindow  +E0x20 

Gui, Show, NoActivate h100 w%Gui_W% %Gui_X% %Gui_Y% , Vol_OSD

If ( roundedGui )
	WinSet, Region, w%Gui_W% h100 R10-10 0-0, Vol_OSD
WinSet, Transparent, %Trans%, Vol_OSD


;=== Sets the Hotkeys ================================================================================
Hotkey, % VolUp_Key, Volume_Up
Hotkey, % VolDown_Key, Volume_Down
Hotkey, % muteKey, Volume_Mute
SetTimer, Update, % Update_Freq

SetTimer, Fade, % "-" Timeout

return


;=== GUI fadeout =====================================================================================
; 	A simple GUI fadeout. That gets called when the GUI has been around for the amount of time you set.
; 	It uses A_Index to make the fade more dynamic, and add a speed up effect. It is only just visible
;	but still looks good.
;=====================================================================================================
Fade:
	While ( Trans > 0 && Update = 0)
	{	Trans -= A_Index / 4
		WinSet, Transparent, % Trans, Vol_OSD
		Sleep, 5
	}
Return


;=== Update ==========================================================================================
; 	This checks for any change to the volume and updates the program accordingly.
;=====================================================================================================
Update:
	SetTimer, Update, % Update_Freq
	Update				:= 0
	SoundGet, Vol
	If ( Vol <> Curr_Vol || forceUpdate = 1)
	{	Update 			:= 1
		GuiControl,, Progress, % Ceil( Vol )
		GuiControl,, Vol, % Ceil( Vol) "%"
		Curr_Vol 		:= Vol
		
		While ( Trans < Max_Trans )
		{	Trans 		+= A_Index * 2
			WinSet, Transparent, % Trans, Vol_OSD 
			Sleep 1
		}	
		SetTimer, Fade, % "-" Timeout
		forceUpdate 			:= 0
	}
Return


;=== Volume Down =====================================================================================
Volume_Down:
	SoundSet, -%Amount%, MASTER
	SetTimer, Update, -1
return


;=== Volume Up =======================================================================================
Volume_Up:
	SoundSet, +%Amount%, MASTER
	SetTimer, Update, -1
Return


;=== Volume Mute =====================================================================================
Volume_Mute:
	Send, {Volume_Mute}
	SoundGet, isMuted, MASTER, MUTE

	Gui, Font
	If ( isMuted = "On" )
		Gui, Font, cRed Italic s24
	else
		Gui, Font, c%Font_Colour% s24 Bold
	
	GuiControl, Font, Vol
	forceUpdate 			:= 1
Return


#If ( mouseOverTray = 1 && overTray() )
;=== Wheel down ======================================================================================
WheelDown::	
	SoundSet, -%Amount%, MASTER
	SetTimer, Update, -1
return

;=== Wheel up ========================================================================================
WheelUp::
	SoundSet, +%Amount%, MASTER
	SetTimer, Update, -1
return

#If 

;=== overTray() ======================================================================================
; 	This is just a simple function that checks if the mouse if over the start bar. If it is, it will return 1
;=====================================================================================================
overTray()
{	MouseGetPos, mX, mY, mWin
	WinGetClass, wClass, ahk_id %mWin%
	Return % wClass = "Shell_TrayWnd" ? 1 : 0
}
