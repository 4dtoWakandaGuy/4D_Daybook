//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_SetNextTime
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ReverseUp)
	C_DATE:C307($_d_LastDate; $_d_NextDate; $1)
	C_LONGINT:C283($_l_Days; $_l_DaysHours; $_l_DaysMinutes; $_l_Frequency; $_l_FrequencyType; $_l_NextTime; $_l_Remainder; $0; $2; $3)
	C_TEXT:C284($_t_FrequencyType; $_t_oldMethodName; $4)
	C_TIME:C306($_ti_LastTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_SetNextTime")
//C_LONGINT(DM_al_NextTime)

$_bo_ReverseUp:=False:C215
$0:=GEN_TimeDateStamp(Current date:C33(*); Current time:C178(*))
If (Count parameters:C259>=4)
	$_d_LastDate:=$1
	If ($_d_LastDate=!00-00-00!)
		//no previous time work backwards
		$_d_LastDate:=Current date:C33(*)
		$_bo_ReverseUp:=True:C214
	End if 
	$_ti_LastTime:=Time:C179(Time string:C180($2))
	If ($_ti_LastTime=?00:00:00?)
		$_ti_LastTime:=Current time:C178(*)
		$_bo_ReverseUp:=True:C214
	End if 
	$_l_Frequency:=$3  //Minutes
	$_t_FrequencyType:=$4  //M H D
	If ($_bo_ReverseUp)
		$0:=GEN_TimeDateStamp(Current date:C33(*); Current time:C178(*))
	Else 
		Case of 
			: ($_t_FrequencyType="M")  //Minutes
				// note the entry screen should not let this be higher than
				// minutes in a day`(60*24)
				If ($3>(24*60))
					//its more than a day
					$_l_Days:=Int:C8($_l_Frequency/(24*60))
					$_l_DaysMinutes:=$_l_Days*(24*60)
					$_l_Remainder:=$_l_Frequency-$_l_DaysMinutes
					$_d_NextDate:=$_d_LastDate+$_l_Days
					$_l_NextTime:=$_ti_LastTime+($_l_Remainder*60)
					If ($_l_NextTime<($_ti_LastTime*1))
						//the time ticked over to another day
						$_d_NextDate:=$_d_NextDate+1
					End if 
					$0:=GEN_TimeDateStamp($_d_NextDate; $_l_NextTime)
				Else 
					// less than one day
					$_l_NextTime:=$_ti_LastTime+($_l_Frequency*60)
					$_d_NextDate:=$_d_LastDate
					If ($_l_NextTime<($_ti_LastTime*1))
						//the time ticked over to another day
						$_d_NextDate:=$_d_NextDate+1
					End if 
					$0:=GEN_TimeDateStamp($_d_NextDate; $_l_NextTime)
				End if 
			: ($_t_FrequencyType="H")  //Hours
				If ($3>24)  //more than one day
					$_l_Days:=Int:C8($_l_Frequency/(24))
					$_l_DaysHours:=$_l_Days*(24)
					$_l_Remainder:=$_l_Frequency-$_l_DaysHours
					$_d_NextDate:=$_d_LastDate+$_l_Days
					$_l_NextTime:=$_ti_LastTime+(($_l_Remainder*60*60))
					If ($_l_NextTime<($_ti_LastTime*1))
						//the time ticked over to another day
						$_d_NextDate:=$_d_NextDate+1
					End if 
					$0:=GEN_TimeDateStamp($_d_NextDate; $_l_NextTime)
					
				Else 
					$_l_NextTime:=$_ti_LastTime+($_l_Frequency*60*60)
					$_d_NextDate:=$_d_LastDate
					If ($_l_NextTime<($_ti_LastTime*1))
						//the time ticked over to another day
						$_d_NextDate:=$_d_NextDate+1
					End if 
					$0:=GEN_TimeDateStamp($_d_NextDate; $_l_NextTime)
				End if 
				
			: ($_t_FrequencyType="D")  //Days
				$_d_NextDate:=$_d_NextDate+$_l_Frequency
				$_l_NextTime:=($_ti_LastTime*1)
				$0:=GEN_TimeDateStamp($_d_NextDate; $_l_NextTime)
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("DM_SetNextTime"; $_t_oldMethodName)