
If (False:C215)
	//Object Name:      [USER].Qualities_Pallette.Variable3
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]Qualities_Pallette.Variable3"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
End case 
ERR_MethodTrackerReturn("OBJ [USER]Qualities_Pallette.Variable3"; $_t_oldMethodName)
