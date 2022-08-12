If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Pop-up%2FDrop-down List1
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
	//Array LONGINT(SP_al_ProjectionProbability;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Pop-up/Drop-down List1"; Form event code:C388)
If (SP_al_ProjectionProbability>0)
	[SALES_PROJECTION:113]Probability:17:=SP_al_ProjectionProbability{SP_al_ProjectionProbability}
End if 
SP_al_ProjectionProbability:=0
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].SalesProjectionEntry.Pop-up/Drop-down List1"; $_t_oldMethodName)