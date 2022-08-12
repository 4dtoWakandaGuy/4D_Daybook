//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_DisplayBalances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    09/08/2010 16:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_NulArray; 0)
	C_BOOLEAN:C305(<>DB_bo_AutoOut; $_bo_AutoFind; $_bo_AutoOut; $_bo_AutoSearch)
	C_LONGINT:C283(vAB)
	C_TEXT:C284($_t_AutoSearchCode; $_t_CurrentOutputform; $_t_oldMethodName; $_t_SetName; $1; $2; ACC_t_OutputCurrency; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_DisplayBalances")
//ACC_DisplayBalances
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
If (Count parameters:C259>=2)
	$_bo_AutoSearch:=($2="TRUE")
	
	$_t_AutoSearchCode:=$1
	$_bo_AutoOut:=<>DB_bo_AutoOut
	<>DB_bo_AutoOut:=False:C215
Else 
	$_bo_AutoSearch:=False:C215
	$_t_AutoSearchCode:=""
	$_bo_AutoOut:=<>DB_bo_AutoOut
End if 
Start_Process
ACC_BalFile
While (vAB=1)
	// 03/04/03 pb
	vTitle:="BALANCES SELECTION"
	DB_t_CurrentFormUsage:="BS"
	DB_t_CurrentFormUsage2:="NCS"
	
	If ($_bo_AutoSearch)
		ARRAY LONGINT:C221($_al_NulArray; 0)
		ACC_BalSelect(1; ->$_al_NulArray; ->$_t_AutoSearchCode; $_bo_AutoSearch)
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=$1)
	Else 
		ALL RECORDS:C47([ACCOUNT_BALANCES:34])
	End if 
	
	
	If (vAB=1)
		If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
			
			
			$_bo_AutoFind:=False:C215
			CREATE SET:C116([ACCOUNT_BALANCES:34]; "AccBalFound")
			$_t_SetName:="AccBalFound"
			Minor_Mod(->[ACCOUNT_BALANCES:34]; "Accounts Balances"; ""; ""; $_t_SetName; $_bo_AutoFind)
			
			
			vAB:=0
		Else 
			Gen_None("Balances"; ->vAB)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("ACC_DisplayBalances"; $_t_oldMethodName)
//ACC_DisplayBalances