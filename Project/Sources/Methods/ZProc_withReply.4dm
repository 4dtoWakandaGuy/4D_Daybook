//%attributes = {}

If (False:C215)
	//Project Method Name:      ZProc_withReply
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>ProcProc; $_l_CurrentProcess; $_l_OK; $_l_ProcessNumber; WS_ProcMainWindow)
	C_REAL:C285($0; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $1; $10; $11; $3; $4; $5; $6; $7; $8)
	C_TEXT:C284($9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZProc_withReply")

//NG Feb 2007
//This method is based on zProc. One important difference..this will return the process number started
$_t_oldMethodName:=ERR_MethodTracker("ZProc_withReply")
//NG June 2007 Because this is used opening a linked record
//if there is anywhere this is not wanted an extract parameter will be needed
DB_LoadViewPreference
//<>Mill:=Milliseconds

If (Count parameters:C259>=3)
	$_l_CurrentProcess:=Current process:C322
	$_l_OK:=1
	If (Length:C16($3)>31)
		$_t_ProcessName:=Substring:C12($3; 1; 31)
	Else 
		$_t_ProcessName:=$3
	End if 
	Case of 
		: (Count parameters:C259=3)
			$_l_ProcessNumber:=New process:C317($1; $2; $_t_ProcessName)
		: (Count parameters:C259=4)
			$_l_ProcessNumber:=New process:C317($1; $2; $_t_ProcessName; $4)
		: (Count parameters:C259=5)
			$_l_ProcessNumber:=New process:C317($1; $2; $_t_ProcessName; $4; $5)
		: (Count parameters:C259=6)
			$_l_ProcessNumber:=New process:C317($1; $2; $_t_ProcessName; $4; $5; $6)
		: (Count parameters:C259=7)
			$_l_ProcessNumber:=New process:C317($1; $2; $_t_ProcessName; $4; $5; $6; $7)
		: (Count parameters:C259=8)
			$_l_ProcessNumber:=New process:C317($1; $2; $_t_ProcessName; $4; $5; $6; $7; $8)
		: (Count parameters:C259=9)
			$_l_ProcessNumber:=New process:C317($1; $2; $_t_ProcessName; $4; $5; $6; $7; $8; $9)
		: (Count parameters:C259=10)
			$_l_ProcessNumber:=New process:C317($1; $2; $_t_ProcessName; $4; $5; $6; $7; $8; $9; $10)
		: (Count parameters:C259=11)
			$_l_ProcessNumber:=New process:C317($1; $2; $_t_ProcessName; $4; $5; $6; $7; $8; $9; $10; $11)
			
		Else 
			//  ALERT("An incorrect number of parameters has been passed to zproc")
			Gen_Alert("An incorrect number of parameters has been passed to zproc.")
			$_l_OK:=0
	End case 
	If ($_l_OK=1)
		$0:=$_l_ProcessNumber  // NG this is the significant line
		PROC_SetProcess($_l_ProcessNumber; WS_ProcMainWindow; Current process:C322)
		
		If (<>ProcProc#0)
			POST OUTSIDE CALL:C329(<>ProcProc)
		End if 
	End if 
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("ZProc_withReply"; $_t_oldMethodName)
