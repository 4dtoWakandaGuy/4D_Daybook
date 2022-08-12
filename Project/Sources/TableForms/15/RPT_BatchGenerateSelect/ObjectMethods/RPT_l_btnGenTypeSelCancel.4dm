If (False:C215)
	//object Name: [USER]RPT_BatchGenerateSelect.RPT_l_btnGenTypeSelCancel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:35
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].RPT_BatchGenerateSelect.RPT_l_btnGenTypeSelCancel"; Form event code:C388)
ERR_MethodTrackerReturn("OBJ [USER].RPT_BatchGenerateSelect.RPT_l_btnGenTypeSelCancel"; $_t_oldMethodName)