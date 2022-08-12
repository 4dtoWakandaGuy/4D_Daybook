If (False:C215)
	//object Name: [USER]SalesProjectionEntry.Variable12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(SP_ar_Probability;0)
	C_LONGINT:C283($_l_ProbabilityRow)
	C_REAL:C285(SP_R_SalesProjectionPCT)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SalesProjectionEntry.Variable12"; Form event code:C388)
$_l_ProbabilityRow:=Find in array:C230(SP_ar_Probability; SP_R_SalesProjectionPCT)
If ($_l_ProbabilityRow<0)
	SP_R_SalesProjectionPCT:=0
End if 
ERR_MethodTrackerReturn("OBJ [USER].SalesProjectionEntry.Variable12"; $_t_oldMethodName)
