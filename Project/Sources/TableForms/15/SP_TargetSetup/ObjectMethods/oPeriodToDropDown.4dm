If (False:C215)
	//object Name: [USER]SP_TargetSetup.Variable12
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
	//ARRAY LONGINT(SP_al_PeriodIDs;0)
	//ARRAY TEXT(SP_at_PeriodCodes;0)
	C_LONGINT:C283(SP_l_SPeriodtoID)
	C_TEXT:C284($_t_oldMethodName; SP_t_SPeriodTo)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_TargetSetup.Variable12"; Form event code:C388)
If (SP_at_PeriodCodes>0)
	SP_t_SPeriodTo:=SP_at_PeriodCodes{SP_at_PeriodCodes}
	SP_l_SPeriodtoID:=SP_al_PeriodIDs{SP_at_PeriodCodes}
End if 
SP_at_PeriodCodes:=0
ERR_MethodTrackerReturn("OBJ [USER].SP_TargetSetup.Variable12"; $_t_oldMethodName)
