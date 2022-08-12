If (False:C215)
	//object Name: [USER]User_In.oCallResponseTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_ResponseTypes;0)
	C_LONGINT:C283(SVS_l_DefaultResponseType)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oCallResponseTypes"; Form event code:C388)

SVS_l_DefaultResponseType:=SVS_at_ResponseTypes
ERR_MethodTrackerReturn("OBJ [USER].User_In.oCallResponseTypes"; $_t_oldMethodName)