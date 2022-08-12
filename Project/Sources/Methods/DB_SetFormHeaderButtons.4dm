//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_SetFormHeaderButtons
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ShowArrayBased; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_SetFormHeaderButtons")
$_bo_ShowArrayBased:=$1
If ($_bo_ShowArrayBased)
	//Object Get
Else 
End if 
ERR_MethodTrackerReturn("DB_SetFormHeaderButtons"; $_t_oldMethodName)