If (False:C215)
	//object Name: [USER]SalesProjectionEntry.Pop-up%2FDrop-down List1
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
	C_REAL:C285(SP_R_SalesProjectionPCT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SalesProjectionEntry.Pop-up/Drop-down List1"; Form event code:C388)
If (SP_ar_Probability>0)
	SP_R_SalesProjectionPCT:=SP_ar_Probability{SP_ar_Probability}
End if 
SP_ar_Probability:=0
ERR_MethodTrackerReturn("OBJ [USER].SalesProjectionEntry.Pop-up/Drop-down List1"; $_t_oldMethodName)