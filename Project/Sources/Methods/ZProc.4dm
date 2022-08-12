//%attributes = {}
If (False:C215)
	//Project Method Name:      ZProc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MILL; <>ProcProc; <>RecBarUp; <>SCPT_l_currentScriptProcess; <>SCPT_l_PlayerActive; $_l_CurrentProcess; $_l_OK; $_l_ProcessMemory; $_l_ProcessNumber; $2; WS_ProcMainWIndow)
	C_TEXT:C284(<>EXECUTE; <>RECTEXT; $_t_CallChainDelim; $_t_oldMethodName; $_t_ProcessName; $1; $10; $11; $3; $4; $5)
	C_TEXT:C284($6; $7; $8; $9; DB_t_ErrTrackingStack; MyDoesNotExist)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZProc")
//<>Mill:=Milliseconds

//*********added call chain recording/reporting 18/10/07 -kmw ********
$_t_CallChainDelim:=" |Starting New Process with Method| "
DB_t_ErrTrackingStack:="ZProc"+$1
//*********************************************

If (Count parameters:C259>=1)
	$_l_CurrentProcess:=Current process:C322
	$_l_OK:=1
	If (Count parameters:C259>=3)
		
		If (Length:C16($3)>31)
			$_t_ProcessName:=Substring:C12($3; 1; 31)
		Else 
			$_t_ProcessName:=$3
		End if 
	Else 
		$_t_ProcessName:=$1
	End if 
	If (Count parameters:C259>=2)
		$_l_ProcessMemory:=$2
	Else 
		$_l_ProcessMemory:=256000
	End if 
	Case of 
		: (Count parameters:C259<=3)
			$_l_ProcessNumber:=New process:C317($1; $_l_ProcessMemory; $_t_ProcessName)
		: (Count parameters:C259=4)
			$_l_ProcessNumber:=New process:C317($1; $_l_ProcessMemory; $_t_ProcessName; $4)
		: (Count parameters:C259=5)
			$_l_ProcessNumber:=New process:C317($1; $_l_ProcessMemory; $_t_ProcessName; $4; $5)
		: (Count parameters:C259=6)
			$_l_ProcessNumber:=New process:C317($1; $_l_ProcessMemory; $_t_ProcessName; $4; $5; $6)
		: (Count parameters:C259=7)
			$_l_ProcessNumber:=New process:C317($1; $_l_ProcessMemory; $_t_ProcessName; $4; $5; $6; $7)
		: (Count parameters:C259=8)
			$_l_ProcessNumber:=New process:C317($1; $_l_ProcessMemory; $_t_ProcessName; $4; $5; $6; $7; $8)
		: (Count parameters:C259=9)
			$_l_ProcessNumber:=New process:C317($1; $_l_ProcessMemory; $_t_ProcessName; $4; $5; $6; $7; $8; $9)
		: (Count parameters:C259=10)
			$_l_ProcessNumber:=New process:C317($1; $_l_ProcessMemory; $_t_ProcessName; $4; $5; $6; $7; $8; $9; $10)
		: (Count parameters:C259=11)
			$_l_ProcessNumber:=New process:C317($1; $_l_ProcessMemory; $_t_ProcessName; $4; $5; $6; $7; $8; $9; $10; $11)
		Else 
			Gen_Alert("An incorrect number of parameters has been passed to zproc.")
			$_l_OK:=0
	End case 
	If ($_l_OK=1)
		
		//Also in Process_StartAr
		PROC_SetProcess($_l_ProcessNumber; WS_ProcMainWIndow; Current process:C322)
		
		If (<>ProcProc#0)
			POST OUTSIDE CALL:C329(<>ProcProc)
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("ZProc"; $_t_oldMethodName)