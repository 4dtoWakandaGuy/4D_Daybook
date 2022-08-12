If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Field2
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
	//ARRAY LONGINT(SP_al_ProjectionProbability;0)
	C_LONGINT:C283($_l_event; $_l_ProbabilityRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Field2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		$_l_ProbabilityRow:=Find in array:C230(SP_al_ProjectionProbability; [SALES_PROJECTION:113]Probability:17)
		If ($_l_ProbabilityRow<0)
			[SALES_PROJECTION:113]Probability:17:=0
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].SalesProjectionEntry.Field2"; $_t_oldMethodName)
