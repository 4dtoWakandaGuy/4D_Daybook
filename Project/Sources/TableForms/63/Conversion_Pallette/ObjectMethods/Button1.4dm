If (False:C215)
	//object Name: [MODULES]Conversion_Pallette.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(WS_CREATE)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [MODULES].Conversion_Pallette.Button1"; Form event code:C388)
WS_CREATE:=0
ERR_MethodTrackerReturn("OBJ [MODULES].Conversion_Pallette.Button1"; $_t_oldMethodName)