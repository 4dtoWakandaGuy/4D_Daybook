If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.Variable31
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
	C_LONGINT:C283(s1; s3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.Variable31"; Form event code:C388)
[PRODUCTS:9]Bundle_Show:37:=2
Products_InMod
s1:=0
s3:=0
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.Variable31"; $_t_oldMethodName)