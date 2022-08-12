//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZProducts_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/01/2010 14:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZProducts_Mod")

If (Count parameters:C259>=3)
	$3->:=ZProc_withReply("Products_Mod"; DB_ProcessMemoryinit(2); "View Products"; $1; $2)
Else 
	//ALERT("1")  `4/1/2010
	
	ZProc("Products_Mod"; DB_ProcessMemoryinit(2); "View Products")
End if 
//Copied to Functions palette
ERR_MethodTrackerReturn("ZProducts_Mod"; $_t_oldMethodName)