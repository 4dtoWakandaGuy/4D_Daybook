//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_PeriodMod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2010 09:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_ButtonClickedFunction; MOD_l_CurrentModuleAccess; vNo)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_PeriodMod")
If (Count parameters:C259>=1)
	Start_Process
	
	MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_DataManager))
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([PERIODS:33])
	End if 
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$1)
	
	vNo:=Records in selection:C76([PERIODS:33])
	If (vNo=0)
		DB_CreateNewRecord(Current process:C322; False:C215; Table:C252(->[PERIODS:33]); True:C214)
		QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$1)
		
		
	Else 
		
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[PERIODS:33]))
		
	End if 
	If (Count parameters:C259>=2)
		If ($2>0)
			SET PROCESS VARIABLE:C370($2; DB_l_ButtonClickedFunction; DB_GetButtonFunction("RefreshPeriods"))
			POST OUTSIDE CALL:C329($2)
		End if 
	End if 
	Process_End
End if 
ERR_MethodTrackerReturn("ACC_PeriodMod"; $_t_oldMethodName)