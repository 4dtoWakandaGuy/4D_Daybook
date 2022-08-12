If (False:C215)
	//object Name: [DOCUMENTS]Reports_Out.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 08:08
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Reports_Out.Variable2"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ:Reports_Out,xPrint"; $_t_oldMethodName)