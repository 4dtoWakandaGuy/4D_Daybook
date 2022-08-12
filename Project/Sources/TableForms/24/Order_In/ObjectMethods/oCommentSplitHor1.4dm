If (False:C215)
	//object Name: [ORDERS]Orders_In.oCommentSplitHor1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/12/2013 14:48
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS]Orders_In.oCommentSplitHor1"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ Orders_In.oCommentSplitHor1"; $_t_oldMethodName)