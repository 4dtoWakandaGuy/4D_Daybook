//%attributes = {}
If (False:C215)
	//Project Method Name:      ZAccBal_Bal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/08/2010 15:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZAccBal_Bal")

If (Count parameters:C259>=3)
	DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ACCOUNT_BALANCES:34])); <>MENU_l_BarModule; ""; ->[ACCOUNT_BALANCES:34]Unique_StringIdent:8; [ACCOUNT_BALANCES:34]Unique_StringIdent:8)
	//$_l_ProcessID:=ZProc_withReply ("AccBal Bal";◊K2;"View Account Balances";$1;$2;»
	//$3:=->$_l_ProcessID
Else 
	DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ACCOUNT_BALANCES:34])); <>MENU_l_BarModule)
	//ZProc ("AccBal Bal";◊K2;"View Account Balances")
End if 
ERR_MethodTrackerReturn("ZAccBal_Bal"; $_t_oldMethodName)
