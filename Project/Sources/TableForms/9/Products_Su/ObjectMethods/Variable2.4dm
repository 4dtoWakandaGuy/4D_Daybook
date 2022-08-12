If (False:C215)
	//object Name: [PRODUCTS]Products_SU.Variable2
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
	C_LONGINT:C283(s1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_SU.Variable2"; Form event code:C388)
If (s1=1)
	[PRODUCTS:9]First_Day_Month:33:=1
End if 
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_SU.Variable2"; $_t_oldMethodName)