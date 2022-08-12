//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_Updatereminder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD_bo_CBAlarmed)
	C_LONGINT:C283(SD_l_TimeFrame)
	C_TEXT:C284($_t_oldMethodName; SD_at_TimeFrame)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_Updatereminder")
If (SD_bo_CBAlarmed)
	Case of 
		: (SD_at_TimeFrame="Minutes")
			If (SD_l_TimeFrame=0)
				SD_l_TimeFrame:=5
			End if 
			
			[DIARY:12]Alarm_Timeframe:48:=SD_l_TimeFrame
			
		: (SD_at_TimeFrame="Hours")
			If (SD_l_TimeFrame=0)
				SD_l_TimeFrame:=1
			End if 
			[DIARY:12]Alarm_Timeframe:48:=SD_l_TimeFrame*60
		: (SD_at_TimeFrame="Days")
			If (SD_l_TimeFrame=0)
				SD_l_TimeFrame:=1
			End if 
			[DIARY:12]Alarm_Timeframe:48:=SD_l_TimeFrame*(60*24)
	End case 
Else 
	[DIARY:12]Alarm_Timeframe:48:=0
	SD_l_TimeFrame:=0
	
End if 
ERR_MethodTrackerReturn("SD_Updatereminder"; $_t_oldMethodName)