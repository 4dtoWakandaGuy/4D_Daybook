//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_InLPM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vCT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_InLPM")
[CONTACTS:1]Export:18:=Export_Stamp3([CONTACTS:1]Export:18)
[CONTACTS:1]Modified_Date:28:=<>DB_d_CurrentDate
DB_bo_RecordModified:=True:C214
Gen_FindVars
vCT:=1
ERR_MethodTrackerReturn("Contacts_InLPM"; $_t_oldMethodName)