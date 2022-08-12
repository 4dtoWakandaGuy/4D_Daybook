//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_WorkingMinutes
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
	C_BOOLEAN:C305(SD_bo_SaturdayWork; SD_bo_SundayWork)
	C_DATE:C307($_d_DateStart)
	C_LONGINT:C283($_l_TimeLeft; $2)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_TimeStart; $0; $1; SD_ti_SettingsTimeEnd; SD_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_WorkingMinutes")
If (Count parameters:C259>=4)
	If ($1#?00:00:00?)
		$_ti_TimeStart:=Time:C179(Time string:C180($1+($2*60)))
		$_d_DateStart:=SD_WorkingDays($3->; 1; SD_bo_SaturdayWork; SD_bo_SundayWork)
		If ($_ti_TimeStart>SD_ti_SettingsTimeEnd)  //then it needs to be the next day
			$_l_TimeLeft:=SD_ti_SettingsTimeEnd-$_ti_TimeStart
			Case of 
				: (Day of:C23($3->)=Friday:K10:17)
					Case of 
						: (SD_bo_SaturdayWork)
							$_d_DateStart:=$3->+1
						: (SD_bo_SundayWork)
							$_d_DateStart:=$3->+2
						Else 
							$_d_DateStart:=$3->+3
					End case 
				: (Day of:C23($3->)=Saturday:K10:18)
					Case of 
						: (SD_bo_SundayWork)
							$_d_DateStart:=$3->+1
						Else 
							$_d_DateStart:=$3->+2
					End case 
				Else 
					$_d_DateStart:=$3->+1
					
			End case 
			$3->:=$_d_DateStart
			$0:=Time:C179(Time string:C180(SD_ti_SettingsTimeStart+$_l_TimeLeft))
		Else 
			$0:=$_ti_TimeStart
		End if 
		$0:=$_ti_TimeStart
	End if 
End if 
ERR_MethodTrackerReturn("SD_WorkingMinutes"; $_t_oldMethodName)
