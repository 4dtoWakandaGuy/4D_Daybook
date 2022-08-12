//%attributes = {}
If (False:C215)
	//Project Method Name:      Period_Close
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 14:33
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_NotLocked)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_PeriodID; MOD_l_CurrentModuleAccess; vD)
	C_TEXT:C284($_t_oldMethodName; $Period)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Period_Close")
//Period_Close
Start_Process
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)

If ((MOD_l_CurrentModuleAccess<2) | (MOD_l_CurrentModuleAccess=3))
	Gen_Alert("You do not have full access to the Nominal Ledger volume"; "Cancel")
	OK:=0
	vD:=0
	ABORT:C156
Else 
	
	READ WRITE:C146([PERIODS:33])
	vDate:=<>DB_d_CurrentDate
	$_l_PeriodID:=Check_Period
	vDate:=[PERIODS:33]From_Date:3-1
	$_l_PeriodID:=Check_Period
	$Period:=[PERIODS:33]Period_Code:1
	$Period:=Substring:C12(Gen_Request("Period to close:"; $Period); 1; 11)
	If (OK=1)
		QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$Period)
		If (Records in selection:C76([PERIODS:33])>0)
			Are_You_Sure
			If (OK=1)
				$_bo_NotLocked:=Check_Locked(->[PERIODS:33]; 1)
				If ($_bo_NotLocked)
					[PERIODS:33]NL_Closed:5:=True:C214
					[PERIODS:33]SL_Closed:7:=False:C215
					[PERIODS:33]PL_Closed:8:=False:C215
					DB_SaveRecord(->[PERIODS:33])
					AA_CheckFileUnlocked(->[PERIODS:33]x_ID:10)
					Gen_Alert("Period "+[PERIODS:33]Period_Code:1+" is now closed"; "")
				Else 
					Gen_Alert("Not completed - Period in use"; "")
				End if 
			End if 
		Else 
			Gen_Alert("No Period found"; "Cancel")
		End if 
	End if 
	UNLOAD RECORD:C212([PERIODS:33])
	READ ONLY:C145([PERIODS:33])
End if 
Process_End
ERR_MethodTrackerReturn("Period_Close"; $_t_oldMethodName)
