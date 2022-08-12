If (False:C215)
	//object Name: Object Name:      STK_LogShowOptions.oRBShowPrevious2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2011 08:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(STK_i_ShowLegend; STK_i_ShowMovement; STK_i_ShowNothing; STK_i_ShowPrevious)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ STK_LogShowOptions.oRBShowPrevious2"; Form event code:C388)

If (STK_i_ShowMovement=1)
	STK_i_ShowNothing:=0
	STK_i_ShowPrevious:=0
	STK_i_ShowLegend:=0
	STK_i_ShowMovement:=1
End if 
ERR_MethodTrackerReturn("OBJ STK_LogShowOptions.oRBShowPrevious2"; $_t_oldMethodName)
