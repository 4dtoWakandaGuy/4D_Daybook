If (False:C215)
	//object Name: Object Name:      PRT_DymoLabelProject.Check Box
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/05/2012 11:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PRT_bo_IncludeCount)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; PRT_T_CounterFormula)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PRT_DymoLabelProject.Check Box"; Form event code:C388)
$_l_event:=Form event code:C388
//TRACE
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PRT_bo_IncludeCount)
			
			OBJECT SET ENTERABLE:C238(*; "oCounter@"; True:C214)
			GOTO OBJECT:C206(PRT_T_CounterFormula)
			
		Else 
			
			OBJECT SET ENTERABLE:C238(*; "oCounter@"; False:C215)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ PRT_DymoLabelProject.Check Box"; $_t_oldMethodName)
