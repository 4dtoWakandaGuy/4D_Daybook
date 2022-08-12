//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ScrnSav Change
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
	C_LONGINT:C283(<>AutoProc; <>SYS_l_CancelProcess; $_l_CurrentProcess; $_l_ScreenSaverProcess)
	C_REAL:C285($_r_RandomNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ScrnSav Change")
$_l_ScreenSaverProcess:=Process_No("$ScreenSaveWin")
If ($_l_ScreenSaverProcess>0)
	$_l_CurrentProcess:=Current process:C322
	If (<>AutoProc=0)
		$_r_RandomNumber:=Random:C100%(500)+200
		DelayTicks($_r_RandomNumber+100)
		While (<>SYS_l_CancelProcess=0)
			IDLE:C311  // 7/04/03 pb
			If (Application type:C494#4D Server:K5:6)
				POST OUTSIDE CALL:C329($_l_ScreenSaverProcess)
			End if 
			DelayTicks($_r_RandomNumber)
		End while 
	Else 
		<>AutoProc:=0
		$_r_RandomNumber:=120  //5
		DelayTicks(120)
		While (<>SYS_l_CancelProcess=0)
			IDLE:C311  // 7/04/03 pb
			If (Application type:C494#4D Server:K5:6)
				POST OUTSIDE CALL:C329($_l_ScreenSaverProcess)
			End if 
			DelayTicks($_r_RandomNumber)
		End while 
	End if 
End if 
ERR_MethodTrackerReturn("ScrnSav Change"; $_t_oldMethodName)