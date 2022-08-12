//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZContacts_Mod
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
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZContacts_Mod")


If (Count parameters:C259>=3)
	$3->:=ZProc_withReply("Contacts_Mod"; DB_ProcessMemoryinit(3); "View Contacts"; $1; $2)
Else 
	ZProc("Contacts_Mod"; DB_ProcessMemoryinit(6); "View Contacts")
End if 

//Copied to Functions Palette
ERR_MethodTrackerReturn("ZContacts_Mod"; $_t_oldMethodName)