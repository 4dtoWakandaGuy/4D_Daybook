If (False:C215)
	//object Name: [USER]HLP_Edit.Button1
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].HLP_Edit.Button1"; Form event code:C388)
CANCEL:C270
ERR_MethodTrackerReturn("OBJ:HLP_Edit,BCancel"; $_t_oldMethodName)