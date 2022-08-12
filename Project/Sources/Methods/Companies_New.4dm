//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_New
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/08/2010 18:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>OneEntry)
	C_LONGINT:C283(<>NoStart; DB_l_ButtonPrefsSet; vAdd; vNo)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_New")

DB_CreateNewRecord(Current process:C322; (Not:C34(<>OneEntry)); Table:C252(->[COMPANIES:2]); False:C215)
ERR_MethodTrackerReturn("Companies_New"; $_t_oldMethodName)