If (False:C215)
	//object Name: [SCRIPTS]Scripts_in.Variable12
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SCRIPTS].Scripts_in.Variable12"; Form event code:C388)
RecText_EditArr(->[SCRIPTS:80]Recording_Text:4)
ERR_MethodTrackerReturn("OBJ [SCRIPTS].Scripts_in.Variable12"; $_t_oldMethodName)