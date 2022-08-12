If (False:C215)
	//object Name: [USER]SP_TargetSetup.Variable5
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
	//Array LONGINT(SP_al_PeriodIDs;0)
	//Array TEXT(SP_at_PeriodCodes;0)
	C_LONGINT:C283(SP_l_SPeriodFromID)
	C_TEXT:C284($_t_oldMethodName; SP_t_SPeriodFrom)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_TargetSetup.Variable5"; Form event code:C388)
If (SP_at_PeriodCodes>0)
	SP_t_SPeriodFrom:=SP_at_PeriodCodes{SP_at_PeriodCodes}
	SP_l_SPeriodFromID:=SP_al_PeriodIDs{SP_at_PeriodCodes}
End if 
SP_at_PeriodCodes:=0
ERR_MethodTrackerReturn("OBJ [USER].SP_TargetSetup.Variable5"; $_t_oldMethodName)