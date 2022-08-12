If (False:C215)
	//object Name: [PRODUCTS]Products_SU.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SU.Variable10"; Form event code:C388)
If (r1=1)
	[PRODUCTS:9]Start_Number:30:=7
End if 
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SU.Variable10"; $_t_oldMethodName)