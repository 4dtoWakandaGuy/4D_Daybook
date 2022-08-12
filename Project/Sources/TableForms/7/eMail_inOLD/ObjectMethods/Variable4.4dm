If (False:C215)
	//object Name: [DOCUMENTS]EMail_IN.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].EMail_IN.Variable4"; Form event code:C388)
[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].EMail_IN.Variable4"; $_t_oldMethodName)