If (False:C215)
	//object Name: [USER]OutPut_Background.INT_p_OutStrip
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].OutPut_Background.INT_p_OutStrip"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].OutPut_Background.INT_p_OutStrip"; $_t_oldMethodName)