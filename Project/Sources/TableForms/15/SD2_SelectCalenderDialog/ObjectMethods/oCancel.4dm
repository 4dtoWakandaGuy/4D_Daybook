If (False:C215)
	//object Name: [USER]SD2_SelectCalenderDialog.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(WS_l_OpenCalander)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_SelectCalenderDialog.Button1"; Form event code:C388)


WS_l_OpenCalander:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].SD2_SelectCalenderDialog.Button1"; $_t_oldMethodName)