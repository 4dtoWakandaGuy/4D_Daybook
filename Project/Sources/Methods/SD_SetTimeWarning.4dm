//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetTimeWarning
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SD_bo_ChangePrefs)
	C_LONGINT:C283($_l_CurrentWinRefOLD; SD_l_SettingsTimeLen; SD_l_Timescale; SD_l_TimeType; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; SD_t_label1; SD_t_TimeSettingType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetTimeWarning")
//this brings up a small dialog to set the warning time
If (Count parameters:C259>=1)
	Case of 
		: (Count parameters:C259=1)
			//timescale
			
			SD_l_Timescale:=$1->
			SD_bo_ChangePrefs:=True:C214
			SD_t_label1:="Set default timeframe for this Action"
			SD_l_TimeType:=2
		: (Count parameters:C259=2)
			//warning timescale
			SD_t_label1:="Set reminder time for this Action"
			SD_l_Timescale:=$1->
			SD_bo_ChangePrefs:=True:C214
			SD_l_TimeType:=3
			
	End case 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
	DIALOG:C40([CONTACTS:1]; "Dialog_TimeSetting")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (SD_l_Timescale>0)
		SD_bo_ChangePrefs:=True:C214  //if the setting is minutes
		Case of 
			: (SD_l_TimeType=1)
				$1->:=SD_l_Timescale
			: (SD_l_TimeType=2)
				Case of 
					: (SD_t_TimeSettingType="Days")
						$1->:=SD_l_Timescale*3600
						If (Count parameters:C259>1)
							$2->:=String:C10(SD_l_Timescale)+" "+"Days"
						End if 
						
					: (SD_t_TimeSettingType="Hours")
						$1->:=SD_l_Timescale*60
						If (Count parameters:C259>1)
							$2->:=String:C10(SD_l_Timescale)+" "+"Hours"
						End if 
					Else 
						$1->:=SD_l_Timescale
						If (Count parameters:C259>1)
							$2->:=String:C10(SD_l_Timescale)+" "+"Minutes"
						End if 
						
				End case 
				
			Else 
				// If ($1->=0)
				SD_bo_ChangePrefs:=True:C214
				//need to set to default
				Case of 
					: (SD_l_TimeType=1)
						If (SD_l_SettingsTimeLen=0)
							SD_l_SettingsTimeLen:=5
						End if 
						$1->:=SD_l_SettingsTimeLen
					: (SD_l_TimeType=3)
						//   SD_l_Timescale:=5
						$1->:=SD_l_Timescale
						If (Count parameters:C259>1)
							$2->:=String:C10(SD_l_Timescale)+" "+"Minutes"
						End if 
				End case 
				
				//End if
				
		End case 
	End if 
	
End if 
ERR_MethodTrackerReturn("SD_SetTimeWarning"; $_t_oldMethodName)
