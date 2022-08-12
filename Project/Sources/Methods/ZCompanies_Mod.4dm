//%attributes = {}
If (False:C215)
	//Project Method Name:      ZCompanies_Mod
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
	C_LONGINT:C283($_l_ProcessNumber)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZCompanies_Mod")
//REP_BuildMenuReports


//If i declare $0 outside here we get an error on the PC-wierd(no error mac)
//So we have pass back the process in $3 this is damned annoying
If (Count parameters:C259>=3)
	
	
	
	$_l_ProcessNumber:=ZProc_withReply("Companies_Mod"; DB_ProcessMemoryinit(6); "View Companies"; $1; $2)
	$3->:=$_l_ProcessNumber
Else 
	
	
	ZProc("Companies_Mod"; DB_ProcessMemoryinit(6); "View Companies")
End if 
//Copied to Functions Palette
ERR_MethodTrackerReturn("ZCompanies_Mod"; $_t_oldMethodName)